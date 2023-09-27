% Before executing make sure you have the following extensions installed
%        Global Optimization Toolbox
%        Parallel Computing Toolbox
%%
clear all; close all; clc;
set(0,'DefaultLineLineWidth',1)
experiments = {'AM','AJ','AG','AT5','AL','AE','AN','AD','AO'};%'AM','AJ','AG','AT5','AL',%'B','C', 'D','H','I','AM','AJ','AG','AT5','AL','AE','AN','AD','AO'};
folderExcel='EXCEL_FILES';
%options = odeset();%RelTol',0.1,'AbsTol',0.1);
%%
addpath("MainsR_MG"); addpath("readDATA"); addpath("plotData"); 
addpath("R2"); addpath("OF"); addpath("FIND"); addpath("defODE"); addpath("ajustPARAMETERS"); 
%%
fprintf('What model do you want to represent?:');

fprintf('\n\nModels with and without evaporation:')
fprintf('\n1 -> dC/dt=k·C·I');
fprintf('\n2 -> dC/dt=k·I');
fprintf('\n3 -> dC/dt=k·C^n·I^m');
fprintf('\n4 -> dC/dt=a·C·I/(b·C+1)')
fprintf('\n5 -> dC/dt=a·C·I/(C+1)')
fprintf('\n6 -> dC/dt=a·C·I/(C+1)+g·C^2/C0·I')


n=input('\n\nEnter a number:');
switch n
    case 1
        fprintf('\n1 -> dC/dt=k·C·I');
        filenameExcel1='Experimental_Data_Order1.xlsm';
        filenameExcel2='Experimental_Data_Order1_CE.xlsm';
        fullfilenameExcel1=fullfile(pwd,folderExcel,filenameExcel1);
        fullfilenameExcel2=fullfile(pwd,folderExcel,filenameExcel2);
        MainR_Order1_MG(experiments,fullfilenameExcel1,fullfilenameExcel2);
    case 2
        fprintf('\n2 -> dC/dt=k·I');
        filenameExcel1='Experimental_Data_Order0.xlsm';
        filenameExcel2='Experimental_Data_Order0_CE.xlsm';
        fullfilenameExcel1=fullfile(pwd,folderExcel,filenameExcel1);
        fullfilenameExcel2=fullfile(pwd,folderExcel,filenameExcel2);
        MainR_Order0_MG(experiments,fullfilenameExcel1,fullfilenameExcel2);
    case 3
        fprintf('\n3 -> dC/dt=k·C^n·I^m');
        filenameExcel1='Experimental_Data_Order_n_m.xlsm';
        filenameExcel2='Experimental_Data_Order_n_m_CE.xlsm';
        fullfilenameExcel1=fullfile(pwd,folderExcel,filenameExcel1);
        fullfilenameExcel2=fullfile(pwd,folderExcel,filenameExcel2);
        MainR_Order_n_m_MG(experiments,fullfilenameExcel1,fullfilenameExcel2);
    case 4
        fprintf('\n4 -> dC/dt=a·C·I/(b·C+1)')
        filenameExcel1='Experimental_Data_AlphaBeta.xlsm';
        filenameExcel2='Experimental_Data_AlphaBeta_CE.xlsm';
        fullfilenameExcel1=fullfile(pwd,folderExcel,filenameExcel1);
        fullfilenameExcel2=fullfile(pwd,folderExcel,filenameExcel2);
        MainR_AlphaBeta_MG(experiments,fullfilenameExcel1,fullfilenameExcel2);
    case 5
        fprintf('\n5 -> dC/dt=a·C·I/(C+1)')
        filenameExcel1='Experimental_Data_Alpha.xlsm';
        filenameExcel2='Experimental_Data_Alpha_CE.xlsm';
        fullfilenameExcel1=fullfile(pwd,folderExcel,filenameExcel1);
        fullfilenameExcel2=fullfile(pwd,folderExcel,filenameExcel2);
        MainR_Alpha_MG(experiments,fullfilenameExcel1,fullfilenameExcel2);
    case 6
        fprintf('\n6 -> dC/dt=a·C·I/(C+1)+g·C^2/C0·I');
        filenameExcel='Experimental_Data_AlphaGamma.xlsm';
        fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
        MainR_AlphaGamma_MG(experiments,fullfilenameExcel);

    otherwise
        fprintf('Not accepted number, execution ended!!!');
end
