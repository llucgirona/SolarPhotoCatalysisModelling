function plot_IrradiationProfile(dataI,dataExp,experiment,fullfilenameExcel,posExcel)
    tspan=dataI(:,1);
    I=dataI(:,2);
    figure('Name','Irradiation Profile')
    yyaxis left
    plot(tspan,I)
    
    %title('Irradiation Profile')
    xlabel('time [s]')
    ylabel('Power [mW/cm2]')
    
    yyaxis right
    plot(tspan,cumtrapz(tspan, I),'-',dataExp(:,1),dataExp(:,2),'*')
    ylabel('Energy [mJ/cm2]')
    legend({'Power [mW/cm2]','Theoretical energy [mJ/cm2]','Experimental energy [mJ/cm2]'},'Location','south')
    
    printPlotExcel(gcf,fullfilenameExcel,experiment,posExcel)
end
