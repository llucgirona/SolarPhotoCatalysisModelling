% function plot_DegradiationPCT_MG(dataI,dataExp1,dataExp2,t1,C1,t2,C2,fullfilenameExcel,experiment,posExcel)
%     t_I=dataI(:,1);
%     I=dataI(:,2);
%     
%     figure('Name','Degradation PCT')
%     yyaxis left
%     plot(t_I,I)
%     
%     xlabel('time [s]')
%     ylabel('Power [mW/cm2]')
%     
%     yyaxis right
%     plot(t1,C1,'-',dataExp1(:,1),dataExp1(:,3),'*','color',"#FF8800")
%     hold on;
%     
%     plot(t2,C2,'-',dataExp2(:,1),dataExp2(:,3),'*','color',"red")
%     hold off;
%     ylabel('Concentration PCT[µM]')
% 
%     legend({'Power [mW/cm2]','Model concentration PCT [µM]','Experimental concentration PCT [µM]', ...
%         'Model concentration PCT without evaporation [µM]','Experimental concentration without evaporation PCT [µM]'},'Location','southoutside')
%     
%     printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
% end

function plot_DegradiationPCT_MG(dataI, dataExp1, dataExp2, t1, C1, t2, C2, fullfilenameExcel, experiment, posExcel)
    t_I = dataI(:, 1);
    I = dataI(:, 2);

    % Ajustar el tamaño del gráfico
    ancho_proporcion = 5;
    alto_proporcion = 6;
    figure('Name', 'Degradation PCT', 'Units', 'inches', 'Position', [0, 0, ancho_proporcion, alto_proporcion]);

    yyaxis left
    plot(t_I, I)

    ylim([0, 5.5])

    xlabel('time [s]')
    ylabel('Intensity [mW/cm2]')

    yyaxis right
    plot(t1, C1, '-', dataExp1(:, 1), dataExp1(:, 3), '*', 'color', "#FF8800")
    hold on;

    plot(t2, C2, '-', dataExp2(:, 1), dataExp2(:, 3), '*', 'color', "red")
    hold off;

    ylim([0, 120])

    ylabel('Concentration PCT[µM]')

    legend({'Intensity [mW/cm2]', 'Model concentration PCT [µM]', 'Experimental concentration PCT [µM]', ...
        'Model concentration PCT without evaporation [µM]', 'Experimental concentration without evaporation PCT [µM]'}, 'Location', 'southoutside')

    printPlotExcel(gcf, fullfilenameExcel, experiment, posExcel)
end
