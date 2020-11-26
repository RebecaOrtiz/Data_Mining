Examen


setwd(C:/Users/rebec/OneDrive/Documentos/ClasesDatos/ClaseMineria/Data_Mining/Data_Mining/Evaluation/Examen)
getwd()

data<-read.csv("Project-Data.csv")


library(ggplot2)

colnames(data)<-c("Day_of_Week","Director","Genre","Movie_Title","Release_Date","Studio",
                  "Adjusted_Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating",
                  "Overseas_M","Overseas","Profit_M","Profit","Runtime","US","Gross_US")



dataframe<- data[ data$Genre=="action" | data$Genre=="adventure" | data$Genre=="animation"
                | data$Genre=="comedy" | data$Genre=="drama",]



dataframe2<-dataframe[dataframe$Studio == "Buena Vista Studios" | dataframe$Studio == "Fox"
                      |dataframe$Studio == "Paramount Pictures" |dataframe$Studio == "Sony"
                      |dataframe$Studio == "Universal" |dataframe$Studio == "WB",]


plot<- ggplot(dataframe2, aes(x=Genre, y=Gross_US,
                              color=Studio, size=Budget))

plot + geom_jitter()+geom_boxplot(size=0.2,color="Black", alpha=0.4)+
    labs(title="Domestic Gross % by Genre", y="Gross % US") +scale_size(name = "Budget SM") + 
    theme(axis.title.x=element_text(color="BlueViolet",size=15),
          axis.title.y=element_text(color="BlueViolet",size=15),
          plot.title=element_text(hjust=0.5,size=19),
          text=element_text(family="Comic Sans MS"))
  