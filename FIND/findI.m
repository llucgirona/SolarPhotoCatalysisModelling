function intensity = findI(t,dataI)
    tspan = dataI(:,1);
    I = dataI(:,2);
    intensity = interp1(tspan,I,t,'spline');
end