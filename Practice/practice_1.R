Pruebe la ley de los números grandes para N números aleatorios normalmente distribuidos con media = 0, stdev = 1:

Cree una secuencia de comandos R que cuente cuántos de estos números se encuentran entre -1 y 1 y divida
por la cantidad total de N

Sabes que E (X) = 68,2%
Compruebe que Mean (Xn) -> E (X) mientras vuelve a ejecutar su script mientras aumenta N

Insinuación:
1. Inicializar el tamaño de la muestra
2. Inicializar contador
3. bucle para (i en rnorm (tamaño))
4. Verifique si la variable iterada cae
5. Aumente el contador si la condición es verdadera
6. devuelve un resultado <- contador / N