function fun = OF_Alpha(dataExp,dataI,PARAMS)
    
    rows_with_nan = any(isnan(dataExp), 2);
    dataExp = dataExp(~rows_with_nan, :);

    tExp = dataExp(:,1);
    CExp = dataExp(:,3);
    
    C0=PARAMS(1);

    tspan=dataI(:,1);
    [t,C] = ode15s(@(t,C) SolarReactorFunction_Alpha(t,C,PARAMS,dataI), tspan, C0);
    suma=0;
    for i=1:length(tExp)
        suma=suma+(CExp(i)-findC(tExp(i),t,C))^2;
    end
    fun=suma;
end