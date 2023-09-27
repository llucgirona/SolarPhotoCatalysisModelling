function dCdt = SolarReactorFunction_AlphaBeta(t,C,PARAMS,dataI)
    alpha=PARAMS(2);
    beta=PARAMS(3);
    intensity = findI(t,dataI);
    dCdt=-alpha*C.*intensity/(beta*C + 1);
end