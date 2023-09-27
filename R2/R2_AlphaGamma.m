function res = R2_AlphaGamma(dataExp,dataI,PARAMS)
    
    C0=PARAMS(1);

    tExp = dataExp(:,1);
    CExp = dataExp(:,3);

    tspan=dataI(:,1);
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaGamma(t,C,PARAMS,dataI), tspan, C0);
    
    C_teor=[];
    for i=1:length(tExp)
        Ct=findC(tExp(i),t,C);
        C_teor=[C_teor,Ct];
    end
%%
    res=rsquare(CExp,transpose(C_teor));
end