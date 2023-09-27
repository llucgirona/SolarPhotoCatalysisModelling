function gamma=Submain_Gamma(experiment,fullfilenameExcel,dataI,dataExp)
    
    tspan=dataI(:,1);
    %%
    InitialAprox=readMatrixExcel(experiment,fullfilenameExcel,"P13:R14");
    lb=InitialAprox(:,1)';
    ub=InitialAprox(:,2)';
    x0=InitialAprox(:,3)';
    
    PARAMS=ajustPARAMS_Gamma(dataI,dataExp,lb,ub,x0);
    
    C0 = PARAMS(1);
    gamma=PARAMS(2);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_Gamma(t,C,PARAMS,dataI), tspan, C0);
    
    %% plot
    plot_IrradiationProfile(dataI,dataExp,experiment,fullfilenameExcel,'O28')
    
    plot_DegradiationPCT_Gamma(dataI,dataExp,t,C,PARAMS,experiment,fullfilenameExcel,'U2')

    plot_Errors_Gamma(dataExp,dataI,PARAMS,experiment,fullfilenameExcel,'U24')
    
    %% save info
    writematrix(transpose([PARAMS,OF_Gamma(dataExp,dataI,PARAMS), ...
        R2_Gamma(dataExp,dataI,PARAMS)]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S13:S16');

end