function SubmainR_AlphaGamma(experiment,fullfilenameExcel,dataI,dataExp)
    
    tspan=dataI(:,1);
    %%
    PARAMS=readMatrixExcel(experiment,fullfilenameExcel,"S21:S23")';

    C0 = PARAMS(1);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaGamma(t,C,PARAMS,dataI), tspan, C0);
    
    %% plot
    
    plot_DegradiationPCT(dataI,dataExp,t,C,experiment,fullfilenameExcel,'AB2')

    %plot_Errors(dataExp,dataI,t,C,experiment,fullfilenameExcel,'AB24')
    
    %% save info
    writematrix(transpose([PARAMS,OF_AlphaGamma(dataExp,dataI,PARAMS(1:2),PARAMS(3)), ...
        R2_AlphaGamma(dataExp,dataI,PARAMS)]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S21:S25');

end