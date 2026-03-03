function [] = export_mtrs()
% Export marginal tax rates (averaged in income bins) for computing Slutsky equation in
% empirical analysis. 

global EXTERNALS;

% LOAD INCOME DISTRIBUTION AND MARGINAL TAX RATES
[pmf,incUS,consumpUS] = load_income_dist();
F = cumsum(pmf);

% CALIBRATE US TAX SCHEDULE: MARGINAL RATES, LUMP SUM GRANT, REVENUE REQUIREMENT
% construct schedule of tax rates: d(z-c)/dz, with kernel smoothing regression
mtrRaw = diff(incUS - consumpUS)./diff(incUS);
r = ksr(F(2:end),mtrRaw); % chooses optimal bandwidth automatically
mtrUS = interpcon(r.x,r.f,F,'linear','extrap');


% startRow = 2;
% endRow = inf;
% delimiter = ',';
% filename = [EXTERNALS '/Intermediate/Simulations/BiasByIncome.csv'];
% fileID = fopen(filename,'r');
% formatSpec = '%f%f%f%f%f%[^\n\r]';
% dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
% fclose(fileID);
% incGrid = dataArray{:, 1}*1000;

% DEFINE GRID OF INCOMES TO COMPUTE MTRS FOR 
incGrid = [2500
    6500
    9000
    11000
    13500
    17500
    22500
    27500
    32500
    37500
    42500
    47500
    55000
    65000
    85000
    140000];

mtrGrid = interpcon(incUS,mtrUS,incGrid);

csvwrite([EXTERNALS '/Data/MTRsForHomescan.csv'],[incGrid mtrGrid]);

end
