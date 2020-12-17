#We check the current directory path with getwd and configure the path to the working directory in case it is not the desired one
getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/Data
Mining/MachineLearning/SVM")
getwd()

#We import the dataset from the .csv file
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#Encoding the target function as a factor, we classify values as true and false
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

#We install the caTools library
library(caTools)

#Split the data set into the training set and the test_set
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#We carry out a scaling of training and test functions
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#Adaptation of SVM method to test set
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm

#We predict the results of the test set data set
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

#Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

#Viewing training_set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
        = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#Viewing the results of the test_set
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
        = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))