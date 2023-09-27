function plot_DegradiationPCT_I(dataI, dataExp, t1, C1, t2, C2, t3, C3, fullfilenameExcel, experiment, posExcel)
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
    plot(t2, C2, '-', dataExp(:, 1), dataExp(:, 3), '*', 'color', "#FF8800")
    hold on;

    plot(t1, C1, '-', t3,C3, '-', 'color', "red")

    hold off;

    ylim([0, 120])

    ylabel('Concentration PCT[µM]')

    legend({'Intensity [mW/cm2]', 'Model concentration PCT [µM]', 'Experimental concentration PCT [µM]', ...
        'Upper and lower concentration limits PCT [µM]'}, 'Location', 'southoutside')

    printPlotExcel(gcf, fullfilenameExcel, experiment, posExcel)
end
