function [h] = realizarTestEstadistico(X,Y)
ALPHA = 0.05;
[HX_noesnormal, pValue, SWstatistic] = swtest(X, ALPHA)
[HY_noesnormal, pValue, SWstatistic] = swtest(Y, ALPHA)

if HX_noesnormal | HY_noesnormal
   disp("se rechaza la hipotesis nula de que X e Y tienen distribuciones normales");
   h=999;
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
end