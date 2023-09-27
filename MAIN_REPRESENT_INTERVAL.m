% Before executing make sure you have the following extensions installed
%        Global Optimization Toolbox
%        Parallel Computing Toolbox
%%
clear all; close all; clc;
set(0,'DefaultLineLineWidth',1)
experiments = {'AK'};%'AM','AJ','AG','AT5','AL',%'B','C', 'D','H','I','AM','AJ','AG','AT5','AL','AE','AN','AD','AO'};
folderExcel='EXCEL_FILES';
%options = odeset();%RelTol',0.1,'AbsTol',0.1);
%%
addpath("MainsR_MG"); addpath("readDATA"); addpath("plotData"); 
addpath("R2"); addpath("FIND"); addpath("defODE"); 
%%
fprintf('\n1 -> dC/dt=k·C·I');

filenameExcel='Validation_Explotation.xlsm';
fullfilenameExcel=fullfile(pwd,folderExcel,filenameExcel);
MainR_Order1_I(experiments,fullfilenameExcel)