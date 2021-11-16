file = 'C:\Resultados\resultado.csv';
T = readtable(file);
T = table2struct(T);
casos =  {};
casosFI = {};
for i = 1:505
    cad = split(T(i).M_1, "\");
    cas = strcat(cad(4), '\', cad(5), '\', cad(6));
    casFI = strcat(cad(5), '\', cad(6));
    check=ismember(cas,casos);
    if(~check)
        casos = [casos; cas];
        casosFI = [casosFI; casFI];
    end  
end

for k1 = 1:length(casos)
    dat(k1).caso = casos(k1);
    dat(k1).casFI = casosFI(k1);
    dat(k1).thdRef = {};
    dat(k1).thdOut = {};
    dat(k1).MSE = {};
   for i = 1:505
    cad = split(T(i).M_1, "\");
    cas = strcat(cad(4), '\', cad(5), '\', cad(6));
    if (strcmp(casos(k1), cas))
        dat(k1).thdRef = [dat(k1).thdRef; T(i).M_2];
        dat(k1).thdOut = [dat(k1).thdOut; T(i).M_3];
        dat(k1).MSE = [dat(k1).MSE; T(i).M_6];
    end
   end
end

Tres = {};
for k1 = 1:(length(casos)-1)
    X1 = cell2mat(dat(k1).thdOut);
    X2 = cell2mat(dat(k1).MSE);
    for k2 = k1+1:length(casos)
       if(strcmp(dat(k1).casFI, dat(k2).casFI))
           Y1 = cell2mat(dat(k2).thdOut);
           Y2 = cell2mat(dat(k2).MSE);
           h1  = realizarTestEstadistico(X1,Y1);
           h2  = realizarTestEstadistico(X2,Y2);
           Tres = [Tres; {dat(k1).casFI,h1, h2}];
       end
    end
end
Tres = cell2table(Tres);
writetable(Tres,'C:\Users\Usuario\LSPyC_Varios\Estadistica.xls')


