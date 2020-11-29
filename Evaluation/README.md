# Evaluation Unit 2

**Introduction**

Next, the problem is required to be solved and the development procedure for solving it.

Develop the following problem with R and RStudio for knowledge extraction
that the problem requires.

The directors of the movie review website are very happy with their previous installment and now they have a new requirement for you.

The previous consultant had created a chart for them which is illustrated in the image below.

![Grafica](/Data_Mining/Evaluation/127630004_391015135674608_5010534013072660560_n.png "Grafica")

However, the R code used to create the graph has been lost and cannot be recovered.

Your task is to create the code that will recreate the same table making it look as close to the original as possible.
You will be provided with a new dataset which you can find in the folder:
DataMining / Datasets / Project-Data.csv

Track
- Note that not all Genres (Genre) and studios (Studio) are used.
- You will need to filter your dataframe after importing the csv file.

**Development**


**1.-** We start using the "getwd" function to check that the path we are working on is correct.

```r
getwd()
```

**2.-** It is required to read the csv file with which we will work and which contains the necessary data. 

```r
data<-read.csv("Project-Data.csv")
```

**3.-** We load the ggplot2 library since we will be using it later.

```r
library(ggplot2)
```

**4.-** We build the data within a dataframe by selecting the columns that contain the data with which we are going to work and thus avoid working with unnecessary data.

```r
colnames(data)<-c("Day_of_Week","Director","Genre","Movie_Title","Release_Date","Studio","Adjusted_Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating","Overseas_M","Overseas","Profit_M","Profit","Runtime","US","Gross_US")
```

**5-**  We create the first dataframe in which we will handle the data related to Gender and we only create the columns that we want to show.

```r
dataframe<- data[ data$Genre=="action" | data$Genre=="adventure" |                                                                                                              

      data$Genre=="animation" | data$Genre=="comedy"|data$Genre=="drama",]
```

**6.-**  We create the second dataframe in which we will handle the data related to the study and we only create the columns that we want to show with the corresponding names of each study. It is important to take into account that we are using the first dataframe within the second.

```r
dataframe2<- dataframe[dataframe$Studio == "Buena Vista Studios" |                   
      dataframe$Studio == "Fox" | dataframe$Studio == "Paramount Pictures" 
      | dataframe$Studio == "Sony"| dataframe$Studio == "Universal" |          
      dataframe$Studio == "WB",]
```

**7.-** Once the information is structured, we generate the plot, use the following structure already defined and indicate that we will use the second dataframe.

```r
plot<- ggplot(dataframe2, aes(x=Genre, y=Gross_US, color=Studio,    

       size=Budget))
```

**8.-**  Here we first use the "geom_jitter" function that allows us to add a diagram to represent the data and a boxplot so that it can be grouped into boxes, indicating the type of format we want to give it and taking an aspect such as color, size, dispersion, etc.

```r
plot + geom_jitter()+geom_boxplot(size=0.2,color="Black", alpha=0.4)+
    labs(title="Domestic Gross % by Genre", y="Gross % US") +     
    scale_size(name = "Budget SM") + 
    theme(axis.title.x=element_text(color="BlueViolet",size=15),
          axis.title.y=element_text(color="BlueViolet",size=15),
          plot.title=element_text(hjust=0.5,size=19),
          text=element_text(family="Comic Sans MS"))
```

Graph obtained:

![Grafica2](/Data_Mining/Evaluation/127785714_363567004602835_3119086932602925738_n.png "Grafica2")

**Conclusion**

In the course of the semester we have learned to handle the data, which thanks to this it was possible to carry out the practice with less problem. It's becoming a nice thing to work with data.