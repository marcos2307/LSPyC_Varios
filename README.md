# LSPyC_Varios
Archivos varios que se desarrollan para el LSPyC

1. calcularMSEyTHD. Lee archivos de mediciones de un directorio (y subdirectorios) y genera un archivo excel con los valores calculados

Calcula el MSE de una señal respecto de un modelo de la forma y ~ b0 + b1 sin(b2*t + b3). 
El modelo se ajusta con los datos del vector x y el vector de tiempos t según los valores iniciales:
B0 = mean(x) (componente DC de x),
B1 = (max(x)-min(x))/2 (para el valor pico),
B2 = 2*pi*50 (frecuencia natural de 50 Hz),
B3 = pi (por dar un valor, en realidad no se puede estimar previamente para el caso general);
En el excel se guarda el MSE descrito previamente de la señal de salida.

Calcula el THD para 10 armónicos (contando la fundamental). Devuelve el porcentaje de distorsión por armónicos porcentual respecto
de la fundamental. En el archivo excel se guardan el THD de la señal de referencia y de la señal de salida.

Se realizaron los calculos de esta forma para sopesar los problemas en la medición. Sin embargo, ambas medidas muestran la calidad
de la señal. Sin embargo, no se ofrece relacion entre la referencia y la salida. Sobre todo por existir un offset. Se piensa que
eliminando el offset de ambas señales se podrían comparar las señales. Se discutirá la solución, antes de continuar.

Dentro del script también se grafican las señales, se muestran las amplitudes de los armónicos, y se calcula la SNR de las señales.
Por lo general se tiene alrededor de 40db para la referencia y alrededor de 20db para la salida.


