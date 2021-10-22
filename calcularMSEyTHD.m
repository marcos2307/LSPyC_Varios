%% calcula el THD y error cuadratico medio de un CSV generado por el osciloscopio
%% se creo para datos el convertidor matricial y lee tiempo, ref de corriente,
%% y corriente.

clear all;
clc;
% abre archivo
path_dir='C:\Datos\Resultados M-MMC mejorado\';
d = dir('C:\Datos\Resultados M-MMC mejorado\**\*.CSV');
path_out = 'C:\Resultados\';


for k=1:length(d)
    f = strcat(d(k).folder,'\',d(k).name)
    T = readtable(f);
    
    
    % extrae mediciones de tiempo, referencia y salida
    time = table2array(T(17:25016, 1));
    ref = table2array(T(17:25016, 2));
    out = table2array(T(17:25016, 4));

    time = str2double(time);
    ref = str2double(ref);
    out = str2double(out);

    %MSE
    MSE = sum((ref-out).^2)/25000

    %THD de osvaldo
    MA = max(ref);
    %ventana
    first_max = find(out==MA, 1, 'first');
    last_max = find(out==MA, 1, 'last');
    Arms=MA/sqrt(2);
    Amedrms=rms(out(first_max:last_max));  %(first_max:last_max) si se usa ventana
    Adisrms=sqrt((abs(Amedrms^2-Arms^2)));
    THD=Adisrms/Arms*100
    
    NN = {f, MSE, THD};
    M{k,:}= NN;
end

o = strcat(path_out, 'resultado.csv');
% Convert cell to a table and use first row as variable names
T2 = cell2table(M)
% Write the table to a CSV file
writetable(T2,o)

o = strcat(path_out, 'resultadoExcel.xls')
writetable(T2,o)

o = strcat(path_out, 'resultadoCell.csv');
