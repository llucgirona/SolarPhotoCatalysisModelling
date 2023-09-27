function SubmainR_Gamma(experiment,fullfilenameExcel,dataI,dataExp)
    
    tspan=dataI(:,1);
    %%
    PARAMS=readMatrixExcel(experiment,fullfilenameExcel,"S13:S14")';
    
    
    C0 = PARAMS(1);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_Gamma(t,C,PARAMS,dataI), tspan, C0);
    
    %% plot
    plot_IrradiationProfile(dataI,dataExp,experiment,fullfilenameExcel,'O28')
    
    plot_DegradiationPCT(dataI,dataExp,t,C,experiment,fullfilenameExcel,'U2')

    %plot_Errors(dataExp,dataI,t,C,experiment,fullfilenameExcel,'U24')
    
    %% save info
    writematrix(transpose([PARAMS,OF_Gamma(dataExp,dataI,PARAMS), ...
        R2_Gamma(dataExp,dataI,PARAMS)]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S13:S16');

end