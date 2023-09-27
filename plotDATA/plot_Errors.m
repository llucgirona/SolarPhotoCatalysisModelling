function plot_Errors(dataExp,dataI,t,C,experiment,fullfilenameExcel,posExcel)    
    
    tExp = dataExp(:,1);
    CExp = dataExp(:,3);
    tspan=dataI(:,1);
    
    C_err=[];
    for i=1:length(tExp)
        Ct=findC(tExp(i),t,C);
        C_err=[C_err,(Ct-CExp(i))*100/Ct];
    end
    %%
    % Ajust sizing
    ancho_proporcion = 5;
    alto_proporcion = 6;
    figure('Name', 'Errors', 'Units', 'inches', 'Position', [0, 0, ancho_proporcion, alto_proporcion]);
       
    %title('Error Concentration PCT')
    bar(dataExp(:,1),C_err)

    ytickformat('%g%%');

    ylim([-25,25])

    xlabel('time [s]')
    ylabel('Relative error Concentration PCT [µM]')
    
    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end