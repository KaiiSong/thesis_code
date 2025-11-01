function run_simulations_test()
% Test python call

global EXTERNALS OUTPUT VERBOSE SPEC ssb_kg_price; 
OUTPUT = 'Output/Simulations';
VERBOSE = false; % report verbose logging to console?

diaryfile = [OUTPUT '/logfile_new_test.txt'];
if (exist(diaryfile,'file')), delete(diaryfile); end
diary(diaryfile);

disp('Success!')
end
