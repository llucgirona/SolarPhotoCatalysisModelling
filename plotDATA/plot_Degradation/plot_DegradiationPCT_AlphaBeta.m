function plot_DegradiationPCT_AlphaBeta(dataI,dataExp,t_C,C,PARAMS,experiment,fullfilenameExcel,posExcel)
    t_I=dataI(:,1);
    I=dataI(:,2);
    
    C0 = PARAMS(1);
    alpha = PARAMS(2);
    beta=PARAMS(3);

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
        {sprintf('C_{0} = %f', C0), sprintf('α = %f', alpha),sprintf('β = %f', beta),}, ...
        'HorizontalAlignment','center','BackgroundColor',"w")
   
    annotation('textbox', [0.7, 0.62, 0.1, 0.1], 'String', ...
        sprintf('R^{2} = %f', R2_AlphaBeta(dataExp,dataI,PARAMS)), ...
        'HorizontalAlignment','center','BackgroundColor',"w")

    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end