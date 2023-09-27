function PARAMS=ajustPARAMS_Order0(dataI,dataExp,lb,ub,x0)
    
    rng default % For reproducibility
    gs = GlobalSearch;
    % Define the objetive function
    objfun = @(PARAMS) OF_Order0(dataExp,dataI,PARAMS);
    
    problem = createOptimProblem('fmincon','x0',x0,'objective',objfun,'lb',lb,'ub',ub);
    
    % Start the optimization as a parallel task
    f = parfeval(@run, 1, gs, problem);
    
    % Wait for the task to complete
    PARAMS = fetchOutputs(f);
    fprintf('\nC0 = %f', PARAMS(1));
    fprintf('\nk = %f', PARAMS(2));

    fprintf('\nOF = %f\n', objfun(PARAMS));
end
