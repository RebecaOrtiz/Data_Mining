Functions

Practice find 20 more functions in R and make an example of it.

?rnorm()
c()
seq()
rep()
print()
is.numeric()
is.integer()
is.double()
is.character()
typeof()
sqrt()
paste()

La funcion "ls()" lista los objetos en memoria: solo muestra los nombres de los mismos
ls()

La funcion "ls.str()" muestra algunos detalles de los objetos en memoria
ls.str()

Esta funcion elimina objetos 
rm()

Nos mostrara ayuda para la funcion 
lm()
help()

Para mirar ayuda en formato htpl
help.start()

La funcion "apropos" encuentra todas aquellas funciones cuyo nombre contiene la palabra dada
apropos(help)

Para ver el tipo y la longitud de un objeto 
mode()
length()

Para saber cual es el directorio en donde se esta trabajando 
getwd()

Para cambiar el directorio de trabajo
setwd("C:/data")
setwd("/home/rebeca/ejercicio")

Esta funcion cre un marco de datos(data frame) y constituye la manera mas usual de leer datos en forma tabular
read.table(archivo.dat)

Esta funcion guarda el contenido de un objeto en un archivo
write.table()

Para generar una secuencia regular de numeros enteros
1:30
1:10-1

Para generarsecuencias de numeros reales
seq(1, 5, 0.5)

Esta funcion crea un vector con elementos identicos
rep(1, 30)

Genera series regulares de factores.
gl(k, n) donde k es el numero de niveles o clases , y n es el numero de replicas en cada nivel 

gl(5, 3)

Crea un marco de datos con todas las combinaciones de vectores o factores proporcionados como argumentos 
expand.grid()


