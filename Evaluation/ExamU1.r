El Banco Mundial quedó muy impresionado con su entrega en la asignación anterior y
tienen un nuevo proyecto para usted.

#### 1.- Debe generar un diagrama de dispersión (scatter-plot) que muestre las estadísticas
#de esperanza de vida ( Life expectancy - eje y) y tasa de fertilidad (Fertility Rate -eje
#x) por país (Country).

#Install ggplot2
install.packages("ggplot2")
library(ggplot2)


#Estadisticas 1960
qplot(data = merged, y=Life_Expectancy_1960, x=Fertility.Rate,
            color=Country.Name, color = Region, size(1), shape=I(15), alpha = I(.4), 
            main = "Life expectancy & Fertility Rate 1960"))

#Estadisticas 2013
qplot(data = merged, y=Life_Expectancy_2013, x=Fertility.Rate,
            color=Country.Name, color = Region, size(1), shape=I(15), alpha = I(.4), 
            main = "Life expectancy & Fertility Rate 2013"))


#### 2- El diagrama de dispersión también debe clasificarse por países Regiones (Country Regions).

#Clasificacion por pais 1960
qplot(data = merged, x = Fertility.Rate, y = Life_Expectancy_1960,
              color = Region, size(1), shape=I(15), alpha = I(.4), main = "Country Regions 1960")

#Clasificacion por pais 2013
qplot(data = merged, x = Fertility.Rate, y = Life_Expectancy_2013,
              color = Region, size(1), shape=I(15), alpha = I(.4), main = "Country Regions 2013")



#### 3.- Se le han proporcionado datos durante 2 años: 1960 y 2013 y se le exige que produzca una visualización para cada uno de estos años.


#Fertility Rate 1960
y1960 <- stats[stats$Year == 1960]

y1960

qplot(data = y1960, x = Region , y = Fertility.Rate, 
              color = Region, size(1), shape=I(15), alpha = I(.4), main = " Fertility Rate 1960")


#Fertility Rate 2013
y2013 <- stats[stats$Year == 1960]

y2013

qplot(data = y2013, x = Region , y = Fertility.Rate, 
              color = Region, size(1), shape=I(15), alpha = I(.4), main = " Fertility Rate 2013")

#### 4.- Algunos datos se han proporcionado en un archivo CVS, algunos en vectores R. El
#archivo CVS contiene datos combinados de ambos años. Toda manipulación de datos
#debe realizarse en R (No en Excel) porque este proyecto puede ser auditado en una
#etapa posterior.


#Mezcla entre ambos años (1960 y 2013)
dfmerge <- data.frame(Country= Country_Code, Life_Expectancy_1960=Life_Expectancy_At_Birth_1960, Life_Expectancy_2013=Life_Expectancy_At_Birth_2013)

head(stats)
head(dfmerge)

merged <- merge(stats, dfmerge, by.x = "Country.Code", by.y = "Country")
head(merged)

#Marcos de datos por año
stats1960 <- stats[stats$Year == 1960]
stats2013 <- stats[stats$Year == 2013]

#Esperanza de vida 
dfmerge60 <- data.frame(Country= Country_Code, Life_Expectancy_1960=Life_Expectancy_At_Birth_1960)
dfmerge13 <- data.frame(Country= Country_Code, Life_Expectancy_2013=Life_Expectancy_At_Birth_2013)


#Merge por año
merged60 <- merge(stats1960, dfmerge60, by.x = "Country.Code", by.y = "Country")
merged13 <- merge(stats2013, dfmerge13, by.x = "Country.Code", by.y = "Country")



#### 5.- También se le ha pedido que proporcione información sobre cómo se comparan los dos períodos. 
#(Hint: Basicamente la expricacion de sus observaciones)

Nota:
Los archivos para realizar esta practica que son CountryRegionVectors.R y
DataFrameEvaluation_Data.csv se encuentra en la carpeta de Google Drive
compartida Recursos/Informacion_UI:

