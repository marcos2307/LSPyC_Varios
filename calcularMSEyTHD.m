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

    %time = str2double(time);
    %ref = str2double(ref);
    %out = str2double(out);

    %MSE
    MSE = sum((ref-out).^2)/25000

    %THD de osvaldo
%     B0 = mean(out);  % Vertical shift
%     B1 = (max(out) - min(out))/2; % Amplitude
%     B2 = 2*pi*50; % Phase (Number of peaks)
%     B3 = pi/2; % Phase shift (eyeball the Curve)
%     myFit = NonLinearModel.fit(time,out, 'y ~ b0 + b1*sin(b2*x1 + b3)', [B0, B1, B2, B3]);
%     hold on
%     plot(time, myFit.Fitted);
%     hold off
%     %ventana
%     first = find(time==0.12, 1, 'first');
%     last = find(time==0.12, 1, 'first');
% 
%     Amedrms=rms(out(first:last));
%     Arefrms=rms(ref(first:last));  %(first_max:last_max) si se usa ventana
%     A1rms=table2array(myFit.Coefficients(2,1))/sqrt(2);
%     Adisrms=sqrt((abs(Amedrms^2-Arefrms^2)));
%     THDref=Adisrms/A1rms*100
    
% thd de matlab
    [thd_ref_db,harmpow_ref,harmfreq_ref] = thd(ref,1/(time(2)-time(1)),10);
    [thd_out_db,harmpow_out,harmfreq_out] = thd(out,1/(time(2)-time(1)),10);
    Tref = table(harmfreq_ref,harmpow_ref,'VariableNames',{'Frequency','Power'}) %100*(10.^(harmpow_ref/20))
    Tout = table(harmfreq_out,harmpow_out,'VariableNames',{'Frequency','Power'}) %100*(10.^(harmpow_out/20))
    THDref = 100*(10^(thd_ref_db/20))
    THDout = 100*(10^(thd_out_db/20))
    NN = {f, MSE, THDref, THDout};
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

Source2 = time;
CH3 =out;
