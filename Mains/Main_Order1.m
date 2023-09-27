function Main_Order1(experiments,fullfilenameExcel)
    for i = 1:length(experiments)
        close all;
        experiment = experiments{i};
        fprintf('\nexperiment = %s\n', experiment);
        try
            dataI = readIntensity(experiment);
            dataExp = readExperimentalData(experiment,fullfilenameExcel,"H:M");
            dataExp=[dataExp(:,1:2),dataExp(:,4)];
            %%
            Submain_Order1(experiment,fullfilenameExcel,dataI,dataExp);
        catch
            fprintf('\nERROR!');
        end
    end
end