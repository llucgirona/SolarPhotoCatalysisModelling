function dataExp=readExperimentalData(experiment,filename,range)
    data=readtable(filename, 'Sheet', experiment, 'Range',range,'VariableNamingRule','preserve');
    dataExp = table2array(data);
    nanIndex = find(isnan(dataExp(:, 1)), 1);
    if ~isempty(nanIndex)
        dataExp=dataExp(1:nanIndex-1,:);
    end
end