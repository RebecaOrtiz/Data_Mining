#Model Naive Bayes


#Naive Bayes is a special class of Machine Learning classification algorithm. 
#It is based on a statistical classification technique called Bayes theorem.

#This algorithm assumes that predictor variables are independent of each other, 
#which means that the presence of a certain characteristic in a dataset is not at 
#all related to the presence of any other characteristic that might be had.

#The Naive Bayes algorithm is used to build models with very good behaviors. 
#It is made in an easier way due to the simplicity of it.
#The algorithm manages to do this as it provides a way to calculate the subsequent probability 
#of a certain event A occurring, given some probabilities of previous events.
#Naive Bayes is easy to build and particularly useful for very large datasets.



#1.- Command to place ourselves on the route on which we will work.
setwd("C:/Users/rebec/Clase_Datos/Data_Mining/Evaluation")

#2.- Import of the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#3.- We create a new dataset with the data of the columns that interest us.
dataset$Purchased = factor(dataset$Purchased, levels = c(0,1) )

#4.- Install packages('caTools').
library(caTools)

#5.- We divide the dataset into the training set and the test set.
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio =0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#5.- Scaling features.
training_set[-3]= scale(training_set[-3])
test_set[-3]= scale(test_set[-3])

#6.- Install packages('e1071').
library(e1071)

#7.- Adjustment of logistic regression to the training set.
classifier = naiveBayes(formula = Purchased ~ .,
                data=training_set,
                type='C-Classification',
                kernel='linear')

naiveBayes

#8.- Prediction of the results of the test suite.
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

#9.- We do the confusion matrix.
cm = table(test_set[, 3], y_pred)
cm

#10.- We load the "ElemStatLearn" library.
library(ElemStatLearn)

#11.- Here we use the training_set data, with these we create two sequences, 
#we use the grid_set with which we compare the sequences, we add the columns of 
#"Age" and "EstimatedSalary" to create a vector.
#With the y_grid we use the prediction we created earlier.
#With the chart design we add the title with the main, we determine the axes "x" and "y" and 
#their respective names. We determine the points that will be displayed on the chart and 
#the color of each, in this case if they bought they will be green and those that did not 
#buy will be in red.
set = training_set
x1= seq(min(set[, 1]) -1, max(set[, 1]) + 1, by=0.01)
x2= seq(min(set[, 2]) -1, max(set[, 2]) + 1, by=0.01)
grid_set = expand.grid(x1,x2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
      main = 'Naive Bayes (Training Set)',
      xlab = 'Age', ylab = 'Estimated Salary',
      xlim = range(x1), ylim = range(x2))
contour(x1,x2, matrix(as.numeric(y_grid), length(x1),length(x2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid ==1, 'springgreen3', 'tomato'))
points(set, pch =21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


#12.- Visualization of the results of the test suite with the above procedure, using the data of test_set.
library(ElemStatLearn)
set = test_set
x1= seq(min(set[, 1]) -1, max(set[, 1]) + 1, by=0.01)
x2= seq(min(set[, 2]) -1, max(set[, 2]) + 1, by=0.01)
grid_set = expand.grid(x1,x2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
      main = 'Naive Bayes (Test Set)',
      xlab = 'Age', ylab = 'Estimated Salary',
      xlim = range(x1), ylim = range(x2))
contour(x1,x2, matrix(as.numeric(y_grid), length(x1),length(x2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid ==1, 'springgreen3', 'tomato'))
points(set, pch =21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))