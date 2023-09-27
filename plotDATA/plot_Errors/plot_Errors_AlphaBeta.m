function plot_Errors_AlphaBeta(dataExp,dataI,PARAMS,experiment,fullfilenameExcel,posExcel)
    C0 = PARAMS(1);    
    
    tExp = dataExp(:,1);
    CExp = dataExp(:,3);
    tspan=dataI(:,1);
    [t,C] = ode15s(@(t,C) SolarReactorFunction_AlphaBeta(t,C,PARAMS,dataI), tspan, C0);
    
    C_err=[];
    for i=1:length(tExp)
        Ct=findC(tExp(i),t,C);
        C_err=[C_err,(Ct-CExp(i))/Ct];
    end
    %%
    figure('Name','Errors')
       
    %title('Error Concentration PCT')
    
    bar(dataExp(:,1),C_err)

    ytickformat('%g%%');

    xlabel('time [s]')
    ylabel('Relative error Concentration PCT [µM]')
    
    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end