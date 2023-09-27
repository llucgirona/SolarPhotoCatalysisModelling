function MainR_Order_n_m_MG(experiments,fullfilenameExcel1,fullfilenameExcel2)
    for i = 1:length(experiments)
        close all;
        experiment = experiments{i};
        fprintf('\nexperiment = %s\n', experiment);
        try  
            dataI = readIntensity(experiment);
            tspan=dataI(:,1);
            dataExp1 = readExperimentalData(experiment,fullfilenameExcel1,"H:M");
            dataExp1=[dataExp1(:,1:2),dataExp1(:,4)];
            PARAMS1=readMatrixExcel(experiment,fullfilenameExcel1,"S13:S16")';
            C01 = PARAMS1(1);
            [t1,C1] = ode15s(@(t1,C1) SolarReactorFunction_Order_n_m(t1,C1,PARAMS1,dataI), tspan, C01);


            dataExp2 = readExperimentalData(experiment,fullfilenameExcel2,"H:M");
            dataExp2=[dataExp2(:,1:2),dataExp2(:,6)];
            PARAMS2=readMatrixExcel(experiment,fullfilenameExcel2,"S13:S16")';
            C02 = PARAMS2(1);
            [t2,C2] = ode15s(@(t2,C2) SolarReactorFunction_Order_n_m(t2,C2,PARAMS2,dataI), tspan, C02);
                        
            plot_DegradiationPCT_MG(dataI,dataExp1,dataExp2,t1,C1,t2,C2,fullfilenameExcel2,experiment,"AB2")            
        
        catch
            fprintf('\nERROR!');
        end
    end
end