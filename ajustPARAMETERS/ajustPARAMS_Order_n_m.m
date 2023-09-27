function PARAMS=ajustPARAMS_Order_n_m(dataI,dataExp,lb,ub,x0)
    
    rng default % For reproducibility
    gs = GlobalSearch;
    % Define the objetive function
    objfun = @(PARAMS) OF_Order_n_m(dataExp,dataI,PARAMS);
    
    problem = createOptimProblem('fmincon','x0',x0,'objective',objfun,'lb',lb,'ub',ub);
    
    % Start the optimization as a parallel task
    f = parfeval(@run, 1, gs, problem);
    
    % Wait for the task to complete
    PARAMS = fetchOutputs(f);
    fprintf('\nC0 = %f', PARAMS(1));
    fprintf('\nk = %f', PARAMS(2));
    fprintf('\nn = %f', PARAMS(3));
    fprintf('\nm = %f', PARAMS(4));
    
    fprintf('\nOF = %f\n', objfun(PARAMS));
end
