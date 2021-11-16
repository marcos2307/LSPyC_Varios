## LSPyC_Varios
Archivos varios que se desarrollan para el LSPyC

# 1. calcularMSEyTHD.m 
    SCRIPT que lee archivos de mediciones de un directorio (y subdirectorios) y genera un archivo excel con los 
    valores calculados. Ver mas informacion en los comentarios.
    Calcula el MSE de una señal respecto de un modelo de la forma y ~ b0 + b1 sin(b2*t + b3). 
    El modelo se ajusta con los datos del vector x y el vector de tiempos t según los valores iniciales: 
    B0 = mean(x) (componente DC de x),    
    B1 = (max(x)-min(x))/2 (para el valor pico),    
    B2 = 2*pi*50 (frecuencia natural de 50 Hz),    
    B3 = pi (por dar un valor, en realidad no se puede estimar previamente para el caso general);    
    En el excel se guarda el MSE descrito previamente de la señal de salida.
    Calcula el THD para 10 armónicos (contando la fundamental). Devuelve el porcentaje de distorsión por 
    armónicos porcentual respecto
    de la fundamental. En el archivo excel se guardan el THD de la señal de referencia y de la señal de 
    salida.
    En el script también se realizan gráficos, se muestran mas detalles de los cálculos y se calcula SNR 
    (se mantiene en alrededor de 40db para ref y 20db para out en este caso).
# 2. realizarTestEstadistico.m 
    FUNCION que utiliza la función swtest.m encontrada en mathworks para verificar si las entradas (X e Y) tienen
    distribucion normal. Posteriormente se realiza el test de Levene (tambien de mathworks) para verificar la igualdad 
    de varianzas.
    Luego se utiliza la funcion ttest2 de MATLAB para el test de student de muestras independientes de las entradas X e Y.
    H0: las muestras son iguales.
    H1: puede elegirse segun la cola ('tail') de ttest2 para elegir diferentes, mayor o menor.
    #entradas X e Y
    #salidas h: 0 -> iguales, (no se puede rechazar H0)
                1 -> se rechaza H0 (y acepta H1).
# 3. ordenarYCalcular.m 
    SCRIPT que toma la planilla excel generada por calcularMSEyTHD.m y compara los casos Independiente y Acoplado para un 
    mismo punto de trabajo (corriente y frecuencia)
    Registra los resultados de comparar THD de la salida y MSE 
