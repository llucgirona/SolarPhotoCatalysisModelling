function Submain_Order1(experiment,fullfilenameExcel,dataI,dataExp)
    
    tspan=dataI(:,1);
    %%
    InitialAprox=readMatrixExcel(experiment,fullfilenameExcel,"P13:R14");
    lb=InitialAprox(:,1)';
    ub=InitialAprox(:,2)';
    x0=InitialAprox(:,3)';
    
    PARAMS=ajustPARAMS_Order1(dataI,dataExp,lb,ub,x0);
    
    C0 = PARAMS(1);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_Order1(t,C,PARAMS,dataI), tspan, C0);
    
    %% plot
    plot_IrradiationProfile(dataI,dataExp,experiment,fullfilenameExcel,'O22')
    
    plot_DegradiationPCT_Order1(dataI,dataExp,t,C,PARAMS,experiment,fullfilenameExcel,'U2')

    plot_Errors_Order1(dataExp,dataI,PARAMS,experiment,fullfilenameExcel,'U24')
    
    %% save info
    writematrix(transpose([PARAMS,OF_Order1(dataExp,dataI,PARAMS), ...
        R2_Order1(dataExp,dataI,PARAMS)]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S13:S17');

end