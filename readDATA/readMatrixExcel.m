function matrix=readMatrixExcel(experiment,filename,range)
    data=readtable(filename, 'Sheet', experiment, 'Range',range,'VariableNamingRule','preserve');
    matrix = table2array(data);
end