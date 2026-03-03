function run_simulations()
% Run simulations for Allcott, Lockwood, Taubinsky "Regressive Sin Taxes"

clear all;
addpath(genpath('./functions/'));
addpath(genpath('./resources/'));

global EXTERNALS OUTPUT VERBOSE LABORELAST; 
EXTERNALS = '~/Dropbox/Research/OptimalSodaTax/Externals'; 
OUTPUT = '../../Output/Simulations';
VERBOSE = false; % report verbose logging to console?

% global parameters
LABORELAST = 0.33; % from Chetty ECMA 2012

diaryfile = [OUTPUT '/logfile_new.txt'];
if (exist(diaryfile,'file')), delete(diaryfile); end
diary(diaryfile);

export_mtrs(); % uncomment to re-generate MTRs for empirical estimation

USPop = 0.311; % U.S. adult equivalents, in billions (see text)

%% Compute sufficient statistics results

mainSpecs = {...
    {'baseline','Baseline'}... 
    {'selfReports','Self-reported SSB consumption'}... 
    {'pigou','Pigouvian (no redistributive motive)'}... 
    {'weakRedist','Weaker redistributive preferences'}... 
    {'strongRedist','Stronger redistributive preferences'}... 
    {'inverseOpt','Redistributive preferences rationalize U.S. income tax'}... 
    {'highElast','Higher demand elasticity ($\zeta^c(\theta) = 2$)'}... 
    {'lowElast','Lower demand elasticity ($\zeta^c(\theta) = 1$)'}... 
    {'steepElast','Demand elasticity declines faster with income'}... 
    {'prefHet','Pure preference heterogeneity'}... 
    {'incEffects','Pure income effects'}... 
    {'measError','Measurement error correction for self control'}... 
    {'knowledgeOnly','Internality from nutrition knowledge only'}... 
    {'selfControlHalf','Self control bias set to 50\% of estimated value'}... 
    {'selfControlTwice','Self control bias set to 200\% of estimated value'}... 
    {'subsBaseline','With substitution: untaxed goods equally harmful'}... 
    {'subsHalf','With substitution: untaxed goods half as harmful'}... 
    {'subsDouble','With substitution: untaxed goods doubly harmful'}... 
    {'subsDietGood','With substitution: diet drinks not harmful'}... 
    {'subsDietBad','With substitution: only to diet drinks, equally harmful'}... 
    {'noInternality','No internality'}... 
    {'noCorrection','No corrective motive'}... 
    {'subsCrossBorder25','Optimal local tax, with 25\% cross-border shopping'}... 
    {'subsCrossBorder50','Optimal local tax, with 50\% cross-border shopping'}... 
};


for iSpec = 1:length(mainSpecs)

    thisSpec = mainSpecs{iSpec};

    specName = thisSpec{1};
    tab.tableRowLabels{iSpec} = thisSpec(2);
    
    [tFixed, tOpt, dw] = compute_sufficient_statistics(specName);

    % Save values for reference in text
    
    switch specName
        case {'baseline','selfReports','noInternality'}

            write_param(['optTax' specName],round(tFixed,2));
            write_param(['optTaxPct' specName],round(tFixed/load_price(),2)*100);
            write_param(['optTaxOptIncTax' specName],round(tOpt,2));

            write_param(['dw' specName],round(dw,2));
            
            switch specName
                case {'baseline','selfReports'}
                    write_param(['dwPop' specName],round(dw*USPop,1));
                    if strcmp(specName,'baseline'), dwBaseline = dw; end
                case 'noInternality'
                    write_param(['dwPop' specName],round(dw*USPop*1000,0));
            end
            
    end
    
    tab.data(iSpec,:) = [tFixed tOpt];
    
end


tab.tableColLabels = {'Existing income tax','Optimal income tax'};
tab.tableCaption = '';
tab.dataFormat = {'%.2f'};
tab.dataFormatMode = 'column';
tab.tableColumnAlignment = {'l','c','c'};

latex = latexTable(tab);

outFile = [OUTPUT '/opt_tax_table.tex'];
fid = fopen(outFile,'wt');
for ir=1:size(latex,1)
    fprintf(fid, '%s\n', latex{ir});
end
fclose(fid);


% do alternative welfare calculations with fixed (suboptimal) SSB taxes
[~, ~, dw] = compute_sufficient_statistics('fixedTax',1);
write_param('dwonecenttax',round(dw,2));
write_param('dwPoponecenttax',round(dw*USPop,1));
write_param('dwLossonecenttax',round((dwBaseline-dw)*USPop,1)*1000);


idx = 21;
assert(strcmp(tab.tableRowLabels{idx},'No internality'),'wrong index for noInternality');
noIntTax = tab.data(idx,1);
[~, ~, dw] = compute_sufficient_statistics('fixedTax',noIntTax);
write_param('dwIgnoreInternality',round(dw,2));
write_param('dwPopIgnoreInternality',round(dw*USPop,1));
write_param('dwLossIgnoreInternality',round((dwBaseline-dw)*USPop,1));

write_param('minTaxRound',min(round(tab.data(1:idx-1,1),1)));
write_param('maxTaxRound',max(round(tab.data(:,1),1)));
write_param('minTaxPct',round(100*min(tab.data(1:idx-1,1)./load_price()),0));
write_param('maxTaxPct',round(100*max(tab.data(:,1))./load_price(),0));

%% Compute structural results

% Each specification stores results in a structure r, with 
%   r.spec: name of specification
%   r.desc: description (e.g., for exported table row titles)
%   r.prim: model primitives for this specification
%   r.eqbm: equilibrium values for this specification
%   r.ssbTax: optimal ssb tax for this spec (reported in cents/oz, includes externalities)
%   r.eqbmOptIncTax: equilibrium when income tax is jointly solved for optimum
%   r.ssbTax: optimal ssb tax under optimal income tax
% These results are then stored in a cell called Results.


% List of specifications to be run in the following simulations
specs = {...
    {'baseline','Baseline'}... 
    {'pigou','Pigouvian (no redistributive motive)'}... 
    {'weakRedist','Weaker redistributive preferences'}... 
    {'strongRedist','Stronger redistributive preferences'}... 
    {'inverseOpt','Redistributive preferences rationalize U.S. income tax'}... 
    {'highElast','Higher demand elasticity ($\zeta^c(\theta) = 2$)'}... 
    {'lowElast','Lower demand elasticity ($\zeta^c(\theta) = 1$)'}... 
    {'constBiasElast','Constant bias and elasticity'}...
    {'prefHetStruc','Pure preference heterogeneity'}... 
    {'incEffectsStruc','Pure income effects'}... 
    {'measError','Measurement error correction for self control'}... 
    {'knowledgeOnly','Internality from knowledge only'}... 
    {'selfControlHalf','Self control bias set to 50\% of estimated value'}... 
    {'selfControlTwice','Self control bias set to 200\% of estimated value'}... 
    {'noInternality','No internality'}... 
    {'noCorrection','No corrective motive'}... 
    {'selfReports','Self-reported SSB consumption'}... 
};


% Loop over two different structural specifications, described in Appendix
for internalizedHealthCost = [1 0]
    
    % Loop over specifications to run
    specRange = 1:length(specs);
    
    for iR = specRange
        
        clear r;
        iSpec = specs{iR};
        r.spec = iSpec{1}; % specification name
        r.desc = [num2str(iR) '. ' iSpec{2}]; % specification description (for Tex table)
        
        [r.prim,eqbm_US] = calibrate_primitives(r.spec,internalizedHealthCost);
        
        % Compute optimal SSB tax holding fixed income tax
        switch r.spec
            case 'optTaxSimple'
                r.ssbTax = compute_simple_tax(r.prim,eqbm_US,'fixed_income_tax');
                r.ssbTaxOptIncTax = compute_simple_tax(r.prim,eqbm_US,'flex_income_tax');
            otherwise
                r.eqbm = compute_optimal_taxes(r.prim,eqbm_US);
                r.ssbTax = r.eqbm.soda_tax;
        end
        
        % Compute jointly optimal SSB tax and income tax
        switch r.spec
            case {'pigou'}
                % Pigouvian tax is same under all income taxes
                r.ssbTaxOptIncTax = NaN;
            otherwise
                r.eqbmOptIncTax = compute_optimal_taxes(r.prim,eqbm_US,false);
                r.ssbTaxOptIncTax = r.eqbmOptIncTax.soda_tax;
        end
        
        Results{iR} = r;
        
    end
    
    % Export results
    
    tab.tableColLabels = {'Existing income tax','Optimal income tax'};
    tab.tableCaption = '';
    tab.tableRowLabels = {};
    tab.data = NaN(length(Results),2);
    tab.dataFormat = {'%.2f'};
    tab.tableColumnAlignment = {'l','c','c'};
    
    for ir = 1:length(Results)
        
        rr = Results{ir};

        % Store for export
        tab.tableRowLabels{ir} = rr.desc;
        tab.data(ir,:) = 100.*[rr.ssbTax rr.ssbTaxOptIncTax];
        
    end
    
    latex = latexTable(tab);
    
    if internalizedHealthCost == 0
        outFile = [OUTPUT '/results_table_PanelA.tex'];
    else
        outFile = [OUTPUT '/results_table_PanelB.tex'];
    end
    fid = fopen(outFile,'wt');
    for ir=1:size(latex,1)
        fprintf(fid, '%s\n', latex{ir});
    end
    fclose(fid);
    
end


%% Generate plots across elasticities and bias values

constBothIdx = 8;

% double-check
assert(strcmp(Results{constBothIdx}.spec,'constBiasElast'),'wrong index');


rBaseline = Results{1};
rConstBoth = Results{constBothIdx};

figureSpec = 'figure';
gammaVec = 0:0.01:0.04;

elastBaseline = mean(1./rBaseline.prim.k);

elastVec = [3 elastBaseline 0.5 0.25];
optTaxMat = NaN(length(gammaVec),length(elastVec));
for iGamma = 1:length(gammaVec)
    for iElast = 1:length(elastVec)
        disp(['(gamma,ssbElast) = ' num2str(gammaVec(iGamma)) ',' num2str(elastVec(iElast)) ')']);
        [prim,eqbm_US] = calibrate_primitives(figureSpec,0,gammaVec(iGamma),elastVec(iElast));
        eqbm = compute_optimal_taxes(prim,eqbm_US);
        optTax = eqbm.soda_tax;
        optTaxMat(iGamma,iElast) = optTax;
    end
end
plot_comp_statics(gammaVec,elastVec,optTaxMat,mean(rConstBoth.prim.gamma));


%% Plot optimal tax across different Marg Value of Public Funds from sin tax

mvpfSTVec = [0.1 0.5 1 2 3 4 5 7 9];
[prim,eqbm_US] = calibrate_primitives('baseline',0);
incTaxFixed = true;

optTaxMVPFs = NaN(length(mvpfSTVec),1);

for iMVPF = 1:length(mvpfSTVec)
    eqbm = compute_optimal_taxes(prim,eqbm_US,incTaxFixed,mvpfSTVec(iMVPF));
    optTaxMVPFs(iMVPF) = eqbm.soda_tax;
end
plot(mvpfSTVec,100*optTaxMVPFs,'Linewidth',1)
ylabel('Optimal SSB tax (cents per ounce)');
xlabel('Social value of SSB tax revenues (relative to lump-sum grant)');
set(gca,'fontsize',14);
xlim([0; max(mvpfSTVec)]);
ylim([0; ceil(max(100*optTaxMVPFs(:)))]);

hold on;
plot([1 1],[-10; 10],'Linewidth',0.5,'Color','k');
isPoor = (prim.F < .1);
gHatPoor = trapz(prim.F(isPoor),eqbm.msww_hat(isPoor))/prim.F(sum(isPoor));
plot(gHatPoor*[1 1],[-10; 10],'Linewidth',0.5,'Color','k');
hold off;

text(1.05,100*optTaxMVPFs(mvpfSTVec==1),'\leftarrow revenues distributed lump-sum','FontSize',12);
gMinTax = interp1(mvpfSTVec,100*optTaxMVPFs,gHatPoor);
text(gHatPoor + .05,gMinTax-.03,'\leftarrow revenues targeted to poorest 10%','FontSize',12);

fname = [OUTPUT '/Figures/across_mvpfs.pdf'];
fig = gcf;
fig.PaperPositionMode = 'auto';
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];

print(fig,fname,'-dpdf');
close;



%% Plot income distributions
plot(rBaseline.eqbm.income./1000,rBaseline.eqbm.consump./1000,'Marker','o','Markersize',5);
hold on;
plot(rBaseline.eqbmOptIncTax.income./1000,rBaseline.eqbmOptIncTax.consump./1000,'Marker','d','Markersize',5);
hold off;
ubound = 150;
xlim([0 ubound]);
ylim([0 ubound]);
legend({'US status quo (Piketty et al. 2018)','Optimal income tax when allowed to adjust'},'location','northwest');
set(gca,'fontsize',14);

xlabel('Pre-tax income ($1000s)');
ylabel('Post-tax income ($1000s)');

fname = [OUTPUT '/Figures/income_tax.pdf'];
fig = gcf;
fig.PaperPositionMode = 'auto';
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];

print(fig,fname,'-dpdf');
close;


%% Display and export results

save('results_workspace','Results');

disp('Finished.')
diary off;

end
