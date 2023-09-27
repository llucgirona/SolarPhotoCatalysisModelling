function Main_AlphaGamma(experiments,fullfilenameExcel)
    for i = 1:length(experiments)
        close all;
        experiment = experiments{i};
        fprintf('\nexperiment = %s\n', experiment);
        try
            dataI = readIntensity(experiment);
            dataExpG = readExperimentalData(experiment,fullfilenameExcel,"H:M");
            dataExp=[dataExpG(:,1:2),dataExpG(:,3)];
            %%
            gamma=Submain_Gamma(experiment,fullfilenameExcel,dataI,dataExp);
            dataExp=[dataExpG(:,1:2),dataExpG(:,4)];
            Submain_AlphaGamma(experiment,fullfilenameExcel,dataI,dataExp,gamma);
        catch
            fprintf('\nERROR!');
        end
    end
end