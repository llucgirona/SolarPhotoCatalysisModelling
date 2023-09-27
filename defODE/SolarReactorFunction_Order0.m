function dCdt = SolarReactorFunction_Order0(t,C,PARAMS,dataI)
    k=PARAMS(2);
    intensity = findI(t,dataI);
    dCdt=-k*intensity;
end