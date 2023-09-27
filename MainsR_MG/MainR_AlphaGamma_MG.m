function MainR_AlphaGamma_MG(experiments,fullfilenameExcel)
    for i = 1:length(experiments)
        close all;
        experiment = experiments{i};
        fprintf('\nexperiment = %s\n', experiment);
        try
            dataI = readIntensity(experiment);
            tspan=dataI(:,1);
            dataExp = readExperimentalData(experiment,fullfilenameExcel,"H:M");
            dataExp1=[dataExp(:,1:2),dataExp(:,4)];

            PARAMS1=readMatrixExcel(experiment,fullfilenameExcel,"S21:S23")';
            C01 = PARAMS1(1);
            [t1,C1] = ode15s(@(t1,C1) SolarReactorFunction_AlphaGamma(t1,C1,PARAMS1,dataI), tspan, C01);


         
            dataExp2=[dataExp(:,1:2),dataExp(:,6)];
            PARAMS2=readMatrixExcel(experiment,fullfilenameExcel,"S21:S22")';
            C02 = PARAMS1(1);
            [t2,C2] = ode15s(@(t2,C2) SolarReactorFunction_Alpha(t2,C2,PARAMS2,dataI), tspan, C02);
                        
            plot_DegradiationPCT_MG(dataI,dataExp1,dataExp2,t1,C1,t2,C2,fullfilenameExcel,experiment,"AJ2")
        catch
            fprintf('\nERROR!');
        end
    end
end