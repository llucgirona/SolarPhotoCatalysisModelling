function concentration = findC(t,tspan,C)
    concentration= interp1(tspan,C,t,'spline');
end