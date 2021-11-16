clear all
%tabla con datos
f = 'resultadoExcel.xls';
T = readtable(f);

%datos a evaluar de la tabla, especificar las filas y columnnas del excel
%10K 10A
X = table2array(T(2:7, 3));
Y = table2array(T(98:103, 3));
ALPHA = 0.05;
[HX_noesnormal, pValue, SWstatistic] = swtest(X, ALPHA)
[HY_noesnormal, pValue, SWstatistic] = swtest(Y, ALPHA)

if HX_noesnormal | HY_noesnormal
   disp("se rechaza la hipotesis nula de que X e Y tienen distribuciones normales");
else
    caso1 = [X ones(size(X))];
    caso2 = [Y 2*ones(size(Y))];
    [Levenetest1] = Levenetest([caso1; caso2],ALPHA)
    if Levenetest1
       disp('Las varianzas son iguales')
    %x and y comes from independent random samples from normal distributions with equal means and equal but unknown variances
    %The result h is 1 if the test rejects the null hypothesis at the 5% significance level, and 0 otherwise.
       [h,p] = ttest2(X,Y, 'alpha', 0.05, 'tail', 'both', 'vartype', 'equal')
       if ~h
           disp('No se puede descartar la H0 de que son iguales')
       end
    else
       disp('Las varianzas no son iguales')
       [h,p] = ttest2(X,Y, 'alpha', 0.05, 'tail', 'both', 'vartype', 'unequal')
       if ~h
           disp('No se puede descartar la H0 de que son iguales')
       end
    end
end