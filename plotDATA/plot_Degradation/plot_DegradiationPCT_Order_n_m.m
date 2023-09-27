function plot_DegradiationPCT_Order_n_m(dataI,dataExp,t_C,C,PARAMS,experiment,fullfilenameExcel,posExcel)
    t_I=dataI(:,1);
    I=dataI(:,2);
    
    C0 = PARAMS(1);
    k = PARAMS(2);
    n = PARAMS (3);
    m = PARAMS(4);

    figure('Name','Degradation PCT')
    yyaxis left
    plot(t_I,I)
    
    %title('Degradation PCT')
    xlabel('time [s]')
    ylabel('Power [mW/cm2]')
    
    yyaxis right
    plot(t_C,C,'-',dataExp(:,1),dataExp(:,3),'*')


    ylabel('Concentration PCT[µM]')
    legend({'Power [mW/cm2]','Model concentration PCT [µM]','Experimental concentration PCT [µM]'},'Location','southwest')

    annotation('textbox', [0.7, 0.8, 0.1, 0.1], 'String', ...
        {sprintf('C_{0} = %f', C0), sprintf('k = %f', k), sprintf('n = %f', n), sprintf('m = %f', m)}, ...
        'HorizontalAlignment','center','BackgroundColor',"w")
   
    annotation('textbox', [0.7, 0.58, 0.1, 0.1], 'String', ...
        sprintf('R^{2} = %f', R2_Order_n_m(dataExp,dataI,PARAMS)), ...
        'HorizontalAlignment','center','BackgroundColor',"w")

    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end