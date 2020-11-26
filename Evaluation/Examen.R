Examen


setwd(C:/Users/rebec/OneDrive/Documentos/ClasesDatos/ClaseMineria/Data_Mining/Data_Mining/Evaluation/Examen)
getwd()

data<-read.csv("Project-Data.csv")


library(ggplot2)

colnames(data)<-c("Day_of_Week","Director","Genre","Movie_Title","Release_Date","Studio",
                  "Adjusted_Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating",
                  "Overseas_M","Overseas","Profit_M","Profit","Runtime","US","Gross_US")

dataframe<-data[Data$Genre=="action"|Data$Genre=="adventure"|Data$Genre=="animation"
                |Data$Genre=="comedy"|Data$Genre=="drama"]

