% function plot_DegradiationPCT(dataI,dataExp,t_C,C,experiment,fullfilenameExcel,posExcel)
%     t_I=dataI(:,1);
%     I=dataI(:,2);
% 
%     figure('Name','Degradation PCT')
%     
%     yyaxis left
%     plot(t_I,I)
% 
%     ylim([0,2.5])
%     
%     %title('Degradation PCT')
%     xlabel('time [s]')
%     ylabel('Intensity [mW/cm2]')
%     
%     yyaxis right
%     plot(t_C,C,'-',dataExp(:,1),dataExp(:,3),'*')
% 
%     ylim([0,120])
% 
%     ylabel('Concentration PCT[µM]')
%     legend({'Intensity [mW/cm2]','Model concentration PCT [µM]','Model concentration PCT [µM]'}, ...
%         'Location','southoutside')
% 
%     printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
% end

function plot_DegradiationPCT(dataI, dataExp, t_C, C, experiment, fullfilenameExcel, posExcel)
    t_I = dataI(:, 1);
    I = dataI(:, 2);

    % Ajust sizing
    ancho_proporcion = 5;
    alto_proporcion = 6;
    figure('Name', 'Degradation PCT', 'Units', 'inches', 'Position', [0, 0, ancho_proporcion, alto_proporcion]);

    yyaxis left
    plot(t_I, I)

    ylim([0, 5.5])

    %title('Degradation PCT')
    xlabel('time [s]')
    ylabel('Intensity [mW/cm2]')

    yyaxis right
    plot(t_C, C, '-', dataExp(:, 1), dataExp(:, 3), '*')

    ylim([0, 120])

    ylabel('Concentration PCT[µM]')
    legend({'Intensity [mW/cm2]', 'Model concentration PCT [µM]', 'Experimental concentration PCT [µM]'}, ...
        'Location', 'southoutside')

    printPlotExcel(gcf, fullfilenameExcel, experiment, posExcel)
end
