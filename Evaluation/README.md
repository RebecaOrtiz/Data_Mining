 # UNIT EXAM 1


The World Bank is very impressed with your delivery in the previous assignment and have a new project for you.

Before starting it is important to note that to perform the exam it is necessary to upload the CountryRegionVectors.R and DataFrameEvaluation_Data.csv files provided by the teacher to the Resources folder.
 

**1.- You must generate a scatter-plot that shows the statistics of life expectancy (Life expectancy - y-axis) and fertility rate (Fertility Rate -axis x) by country (Country).**

//The "ggplot2" package is installed.
>install.packages("ggplot2")

//She sends for her bookstore so she can work with her.
>library(ggplot2)

//This command is run to be able to load the files that we will work with, in automatic it opens the window to be able to locate them. 

>stats <- read.csv(file.choose())

//The following vectors will be generated with which we will also be working.
//A lot of data is generated, so I'll just leave one sample.

>Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG",
"AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP")

>Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,
32.9848292682927,62.2543658536585,52.2432195121951,65.2155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976)

>Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,
60.0282682926829,51.8661707317073,77.537243902439,77.1956341463415,
75.9860975609756,74.5613658536585,75.7786585365854,82.1975609756098,80.890243902439,70.6931463414634,56.2516097560976,80.3853658536585)

//We carry out the following functions to be able to observe the countries that have registration in question of Life Expectancy and Fertility Rate based on the years 1960 and 2013 respectively.

**Statistics 1960**

>qplot(data = merged, y=Life_Expectancy_1960, x=Fertility.Rate,
      color=Country.Name, size=I(1), shape=I(15), alpha = I(.4), 
      main = "Life expectancy & Fertility Rate 1960")



**Statistics 2013**

>qplot(data = merged, y=Life_Expectancy_2013, x=Fertility.Rate,
      color=Country.Name, size=I(1), shape=I(15), alpha = I(.4), 
       main = "Life expectancy & Fertility Rate 2013")



**2- The scatter plot must also be classified by Country Regions.**

//Below we perform the following functions so that we are shown in graph the Fertility Rate and Life Expectancy, considering the country and the year.

**1960 country ranking**

>qplot(data = merged, x = Fertility.Rate, y = Life_Expectancy_1960,
      color = Region, size=I(2), shape=I(15), alpha = I(.4), 
      main = "Country Regions 1960")


**2013 country ranking**

>qplot(data = merged, x = Fertility.Rate, y = Life_Expectancy_2013,
      color = Region, size=I(2), shape=I(15), alpha = I(.4), 
      main = "Country Regions 2013")




**3.- You have been provided with data for 2 years: 1960 and 2013 and are required to produce a visualization for each of these years.**

**Fertility rate 1960**

//We declare the following variable by assigning statistics with respect to the year 1960. 

>y1960 <- stats[stats$Year == 1960,]

//We show the variable.

>y1960

//We create the function to observe the data in graph.

>qplot(data = y1960, x = Region , y = Fertility.Rate, 
      color = Region, size=I(2), shape=I(15), alpha = I(.4), 
      main = " Fertility Rate 1960")



**Fertility Rate 2013**

//We declare the following variable by assigning statistics with respect to the year 1960.

>y2013 <- stats[stats$Year == 2013,]

//We show the variable.

>y2013

//We create the function to observe the data in graph.

>qplot(data = y2013, x = Region , y = Fertility.Rate, 
      color = Region, size=I(2), shape=I(15), alpha = I(.4), 
      main = " Fertility Rate 2013")



**4.- 4.- Some data has been provided in a CVS file, some in R vectors.
#CVS file contains combined data from both years. All data manipulation
#must be done in R (Not in Excel) because this project can be audited in a
#post stage.**


**Mix between both years (1960 and 2013)**

//We create the following variables that will be saved in our Data and with which we will be working 


>dfmerge <- data.frame(Country= Country_Code,        Life_Expectancy_1960 =Life_Expectancy_At_Birth_1960,     Life_Expectancy_2013=Life_Expectancy_At_Birth_2013)

>merged <- merge(stats, dfmerge, by.x = "Country.Code", by.y = "Country")

//We show them to look at the data


>head(dfmerge)
>head(stats)


**Data frames per year**
>stats1960 <- stats[stats$Year == 1960,]
>stats2013 <- stats[stats$Year == 2013,]

**Life expectancy** 
>dfmerge60 <- data.frame(Country= Country_Code, Life_Expectancy_1960=Life_Expectancy_At_Birth_1960)

>dfmerge13 <- data.frame(Country= Country_Code, Life_Expectancy_2013=Life_Expectancy_At_Birth_2013)


**Merge by year**
>merged60 <- merge(stats1960, dfmerge60, by.x = "Country.Code", by.y = "Country")

>merged13 <- merge(stats2013, dfmerge13, by.x = "Country.Code", by.y = "Country")


**5.- You have also been asked to provide information on how the two periods compare.
 (Hint: Basically the expression of your observations).**

In the 1960 plot, it shows the relationship between the life expectancy of individuals and the fertility rate, which is the number of children per woman.

We can see that European countries are between 70 years of life expectancy and reach up to 75 years at most and Africa do not have as much life expectancy with a high fertility rate, because they do not have the resources that Europeans have. .

In the 2013 plot we can see that European countries are no longer the only ones with a high life expectancy, but Asia and the Americas are also found. We can see that the others remain the same and that Africa continues without so much life expectancy and with a high fertility rate.

In conclusion, it can be said that in countries the higher the life expectancy, the lower the fertility rate.

