function Submain_AlphaBeta(experiment,fullfilenameExcel,dataI,dataExp)
    
    tspan=dataI(:,1);
    %%
    InitialAprox=readMatrixExcel(experiment,fullfilenameExcel,"P13:R15");
    lb=InitialAprox(:,1)';
    ub=InitialAprox(:,2)';
    x0=InitialAprox(:,3)';
    
    PARAMS=ajustPARAMS_AlphaBeta(dataI,dataExp,lb,ub,x0);
    
    C0 = PARAMS(1);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaBeta(t,C,PARAMS,dataI), tspan, C0);
    
    %% plot
    plot_IrradiationProfile(dataI,dataExp,experiment,fullfilenameExcel,'O22')
    
    plot_DegradiationPCT_AlphaBeta(dataI,dataExp,t,C,PARAMS,experiment,fullfilenameExcel,'U2')

    plot_Errors_AlphaBeta(dataExp,dataI,PARAMS,experiment,fullfilenameExcel,'U24')
    
    %% save info
    writematrix(transpose([PARAMS,OF_AlphaBeta(dataExp,dataI,PARAMS), ...
        R2_AlphaBeta(dataExp,dataI,PARAMS)]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S13:S17');

end