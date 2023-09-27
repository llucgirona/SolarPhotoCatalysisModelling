function fun = OF_AlphaGamma(dataExp,dataI,PARAMS,gamma)
    
    rows_with_nan = any(isnan(dataExp), 2);
    dataExp = dataExp(~rows_with_nan, :);
    
    tExp = dataExp(:,1);
    CExp = dataExp(:,3);
    
    C0=PARAMS(1);

    PARAMS=[PARAMS,gamma];

    tspan=dataI(:,1);
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaGamma(t,C,PARAMS,dataI), tspan, C0);
    suma=0;
    for i=1:length(tExp)
        suma=suma+(CExp(i)-findC(tExp(i),t,C))^2;
    end
    fun=suma;
end