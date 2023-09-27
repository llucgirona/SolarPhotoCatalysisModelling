function PARAMS=ajustPARAMS_AlphaGamma(dataI,dataExp,lb,ub,x0,gamma)
    
    rng default % For reproducibility
    gs = GlobalSearch;
    % Define the objetive function
    objfun = @(PARAMS) OF_AlphaGamma(dataExp,dataI,PARAMS,gamma);
    
    problem = createOptimProblem('fmincon','x0',x0,'objective',objfun,'lb',lb,'ub',ub);
    
    % Start the optimization as a parallel task
    f = parfeval(@run, 1, gs, problem);
    
    % Wait for the task to complete
    PARAMS = fetchOutputs(f);
    fprintf('\nC0 = %f', PARAMS(1));
    fprintf('\nalpha = %f', PARAMS(2));
    fprintf('\ngamma = %f', gamma);

    fprintf('\nOF = %f\n', objfun(PARAMS));
end
