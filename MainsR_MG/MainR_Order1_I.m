function MainR_Order1_I(experiments,fullfilenameExcel)
    for i = 1:length(experiments)
        close all;
        experiment = experiments{i};
        fprintf('\nexperiment = %s\n', experiment);
        try
            dataI = readIntensity(experiment);
            tspan=dataI(:,1);
            dataExp = readExperimentalData(experiment,fullfilenameExcel,"H:M");
            dataExp1=[dataExp(:,1:2),dataExp(:,4)];
            
            M1 = readMatrixExcel(experiment,fullfilenameExcel,"P13:P16");
            
            C0=M1(1);
            kl=M1(2);
            km=M1(3);
            ku=M1(4);

            PARAMS=[C0,kl];
            [t1,C1] = ode15s(@(t1,C1) SolarReactorFunction_Order1(t1,C1,PARAMS,dataI), tspan, C0);

            PARAMS=[C0,km];
            [t2,C2] = ode15s(@(t2,C2) SolarReactorFunction_Order1(t2,C2,PARAMS,dataI), tspan, C0);

            PARAMS=[C0,ku];
            [t3,C3] = ode15s(@(t3,C3) SolarReactorFunction_Order1(t3,C3,PARAMS,dataI), tspan, C0);
                        
            plot_DegradiationPCT_I(dataI,dataExp1,t1,C1,t2,C2,t3,C3,fullfilenameExcel,experiment,"R2")

            plot_Errors(dataExp,dataI,t2,C2,experiment,fullfilenameExcel,'R34')  
            
            dataExp2=[dataExp(:,1:2),dataExp(:,6)];
            
            M2 = readMatrixExcel(experiment,fullfilenameExcel,"Y13:Y16");
            
            C0=M2(1);
            kl=M2(2);
            km=M2(3);
            ku=M2(4);

            PARAMS=[C0,kl];
            [t1,C1] = ode15s(@(t1,C1) SolarReactorFunction_Order1(t1,C1,PARAMS,dataI), tspan, C0);

            PARAMS=[C0,km];
            [t2,C2] = ode15s(@(t2,C2) SolarReactorFunction_Order1(t2,C2,PARAMS,dataI), tspan, C0);

            PARAMS=[C0,ku];
            [t3,C3] = ode15s(@(t3,C3) SolarReactorFunction_Order1(t3,C3,PARAMS,dataI), tspan, C0);
                        
            plot_DegradiationPCT_I(dataI,dataExp2,t1,C1,t2,C2,t3,C3,fullfilenameExcel,experiment,"AA2")
            
              
        catch
            fprintf('\nERROR!');
        end
    end
end
            