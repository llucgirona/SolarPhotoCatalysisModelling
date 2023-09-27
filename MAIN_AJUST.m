% Before executing make sure you have the following extensions installed
%        Global Optimization Toolbox
%        Parallel Co5mputing Toolbox
%%
clear all; close all; clc;
set(0,'DefaultLineLineWidth',1)
experiments = {'AO'};%'B','C', 'D','H','I','AE','AM','AG','AN','AD','AT5','AJ','AK','AY','AL','AO'};
folderExcel='EXCEL_FILES';
%options = odeset();%RelTol',0.1,'AbsTol',0.1);
%%
addpath("Mains_CE");addpath("Mains"); addpath("SubMains");addpath("readDATA"); addpath("plotData"); 
addpath("plotData\plot_Degradation"); addpath("plotData\plot_Errors");addpath("R2"); addpath("OF"); 
addpath("FIND"); addpath("defODE"); addpath("ajustPARAMETERS"); 
%%
fprintf('What model do you want to ajust?:');

fprintf('\n\nModels without considering evaporation:')
fprintf('\n1 -> dC/dt=k·C·I');
fprintf('\n2 -> dC/dt=k·I');
fprintf('\n3 -> dC/dt=k·C^n·I^m');
fprintf('\n4 -> dC/dt=a·C·I/(b·C+1)')
fprintf('\n5 -> dC/dt=a·C·I/(C+1)')


fprintf('\n\nModels considering evaporation, blank reactor data needed:')
fprintf('\n6 -> dC/dt=a·C·I/(C+1)+g·C^2/C0·I');


fprintf('\n\nModels recalculating concentration excluding evaporation effect:')
fprintf('\n7 -> dC/dt=k·C·I');
fprintf('\n8 -> dC/dt=k·I');
fprintf('\n9 -> dC/dt=k·C^n·I^m');
fprintf('\n10 -> dC/dt=a·C·I/(b·C+1)')
fprintf('\n11 -> dC/dt=a·C·I/(C+1)')

n=input('\n\nEnter a number:');


switch n
    case 1
        fprintf('\n1 -> dC/dt=k·C·I');
        filenameExcel='Experimental_Data_Order1.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order1(experiments,fullfilenameExcel);
    case 2
        fprintf('\n2 -> dC/dt=k·I');
        filenameExcel='Experimental_Data_Order0.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order0(experiments,fullfilenameExcel);
    case 3
        fprintf('\n3 -> dC/dt=k·C^n·I^m');
        filenameExcel='Experimental_Data_Order_n_m.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order_n_m(experiments,fullfilenameExcel);
    case 4
        fprintf('\n4 -> dC/dt=a·C·I/(b·C+1)')
        filenameExcel='Experimental_Data_AlphaBeta.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_AlphaBeta(experiments,fullfilenameExcel);
    case 5
        fprintf('\n5 -> dC/dt=a·C·I/(C+1)')
        filenameExcel='Experimental_Data_Alpha.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Alpha(experiments,fullfilenameExcel);
    
    
    case 6
        fprintf('\n6 -> dC/dt=a·C·I/(C+1)+g·C^2/C0·I');
        filenameExcel='Experimental_Data_AlphaGamma.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_AlphaGamma(experiments,fullfilenameExcel);
    
    
    case 7
        fprintf('\n7 -> dC/dt=k·C·I');
        filenameExcel='Experimental_Data_Order1_CE.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order1_CE(experiments,fullfilenameExcel);
    case 8
        fprintf('\n8 -> dC/dt=k·I');
        filenameExcel='Experimental_Data_Order0_CE.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order0_CE(experiments,fullfilenameExcel);
    case 9
        fprintf('\n9 -> dC/dt=k·C^n·I^m');
        filenameExcel='Experimental_Data_Order_n_m_CE.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Order_n_m_CE(experiments,fullfilenameExcel);
    case 10
        fprintf('\n10 -> dC/dt=a·C·I/(b·C+1)')
        filenameExcel='Experimental_Data_AlphaBeta_CE.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_AlphaBeta_CE(experiments,fullfilenameExcel);
    case 11
        fprintf('\n11 -> dC/dt=a·C·I/(C+1)')
        filenameExcel='Experimental_Data_Alpha_CE.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        Main_Alpha_CE(experiments,fullfilenameExcel);

    otherwise
        fprintf('Not accepted number, execution ended!!!');
end


