function dCdt = SolarReactorFunction_Gamma(t,C,PARAMS,dataI)
    C0=PARAMS(1);
    gamma=PARAMS(2);
    intensity = findI(t,dataI);
    dCdt=gamma*C0^2/C.*intensity;
end