function printPlotExcel(fig,fullfilename,experiment,pos)
    
    Excel=actxserver('Excel.Application');
    Excel.Visible=1;
    
    if ~exist(fullfilename, 'file')
        error('File not found');
    end

    wb = Excel.Workbooks.Open(fullfilename);
    ws = wb.Sheets.Item(experiment);
    range=ws.Range(pos); 
    
    print(fig, '-dmeta');
    range.PasteSpecial();

    % Save and close workbook
    wb.Save;
    wb.Close;
    Excel.Quit;
    delete(Excel);
    
end