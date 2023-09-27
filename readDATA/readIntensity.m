function mat=readIntensity(experiment)
    filename = ['TXT_INTENSITY\Experiment ' experiment ' - SolarData.txt'];
    fid = fopen(filename, 'r');
    tspan = [];
    intensity = [];
    while ~feof(fid)
        line = fgetl(fid);
        try
            data = textscan(line, '%f%q%q%q%f%q%f%f%q', 'Delimiter', ',');
            t = duration(data{4}, 'Format', 'hh:mm:ss');
            tspan = [tspan; t];
            intensity = [intensity; data{5}];
        catch
            % Skip this line if there is an error
            continue
        end
    end
    fclose(fid);
    tspan = seconds(tspan - tspan(1));
    [unique_times, ~, index] = unique(tspan);
    mean_intensities = accumarray(index, intensity, [], @mean);
    mat = [unique_times, mean_intensities];
end

% function mat=readIntensity(experiment)
%     filename = ['TXT_INTENSITY\Experiment ' experiment ' - SolarData.txt'];
%     data = readtable(filename, 'Delimiter', ',', 'Format', '%f%q%q%q%f%q%f%f%q');
%     tspan=seconds(duration(data.Var4, 'Format', 'hh:mm:ss'));
%     tspan=tspan-tspan(1);
%     intensity=data.Var5;
%     [unique_times,~,index] = unique(tspan);
%     mean_intensities = accumarray(index,intensity,[],@mean);
%     mat=[unique_times,mean_intensities];
% end
