function dCdt = SolarReactorFunction_AlphaGamma(t,C,PARAMS,dataI)
    C0=PARAMS(1);
    alpha=PARAMS(2);
    gamma=PARAMS(3);
    intensity = findI(t,dataI);
    dCdt=-alpha*C.*intensity/(C + 1)+gamma*C0^2/C.*intensity;
end