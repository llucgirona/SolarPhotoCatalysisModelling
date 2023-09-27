function plot_Errors_Order0(dataExp,dataI,PARAMS,experiment,fullfilenameExcel,posExcel)
    C0 = PARAMS(1);    
    
    tExp = dataExp(:,1);
    CExp = dataExp(:,3);
    tspan=dataI(:,1);
    [t,C] = ode15s(@(t,C) SolarReactorFunction_Order0(t,C,PARAMS,dataI), tspan, C0);
    
    C_err=[];
    for i=1:length(tExp)
        Ct=findC(tExp(i),t,C);
        C_err=[C_err,(Ct-CExp(i))/Ct];
    end
    %%
    
    figure('Name', 'Errors');
       
    %title('Error Concentration PCT')
    
    bar(dataExp(:,1),C_err)

    ytickformat('%g%%');

    xlabel('time [s]')
    ylabel('Relative error Concentration PCT [µM]')
    
    ylim([-0.25e-2, 0.25e-2])
    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end