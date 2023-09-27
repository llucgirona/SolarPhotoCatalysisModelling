function dCdt = SolarReactorFunction_Order1(t,C,PARAMS,dataI)
    k=PARAMS(2);
    intensity = findI(t,dataI);
    dCdt=-k*C.*intensity;
end