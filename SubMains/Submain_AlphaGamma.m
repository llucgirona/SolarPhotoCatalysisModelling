function Submain_AlphaGamma(experiment,fullfilenameExcel,dataI,dataExp,gamma)
    
    tspan=dataI(:,1);
    %%
    InitialAprox=readMatrixExcel(experiment,fullfilenameExcel,"P21:R22");
    lb=InitialAprox(:,1)';
    ub=InitialAprox(:,2)';
    x0=InitialAprox(:,3)';
    
    PARAMS=ajustPARAMS_AlphaGamma(dataI,dataExp,lb,ub,x0,gamma);
    
    C0 = PARAMS(1);
    
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaGamma(t,C,[PARAMS,gamma],dataI), tspan, C0);
    
    %% plot
    
    plot_DegradiationPCT_AlphaGamma(dataI,dataExp,t,C,[PARAMS,gamma],experiment,fullfilenameExcel,'AB2')

    plot_Errors_AlphaGamma(dataExp,dataI,[PARAMS,gamma],experiment,fullfilenameExcel,'AB24')
    
    %% save info
    writematrix(transpose([PARAMS,gamma,OF_AlphaGamma(dataExp,dataI,PARAMS,gamma), ...
        R2_AlphaGamma(dataExp,dataI,[PARAMS,gamma])]), ...
        fullfilenameExcel, 'Sheet', experiment,'Range', 'S21:S25');

end