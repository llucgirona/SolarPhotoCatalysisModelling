function dCdt = SolarReactorFunction_Order_n_m(t,C,PARAMS,dataI)
    k=PARAMS(2);
    n=PARAMS(3);
    m=PARAMS(4);
    intensity = findI(t,dataI);
    dCdt=-k*C^n.*intensity^m;
end