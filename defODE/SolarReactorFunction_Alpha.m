function dCdt = SolarReactorFunction_Alpha(t,C,PARAMS,dataI)
    alpha=PARAMS(2);
    intensity = findI(t,dataI);
    dCdt=-alpha*C.*intensity/(C + 1);
end