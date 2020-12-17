*#We verify the route in which we are going to work, then we load the
#file "Social_Network_Ads.csv" and mark the dataset in [3: 5] to work with
#the data from columns 3 to 5
setwd("C:/Users/Downloads/DataMining-master/MachineLearning/KNN")
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#In the Purchased column we work with the true and false values
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

#We install the caTools library
library(caTools)

#We load the CaTools library and tell it to use the TRUE values in the training_set and the FALSE values in the test_set
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#We use the Scale function with which what we do is center the values of a
#matrix and scale them
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#We load the class library to be able to classify the values of training_set and test_set
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

#We create the confusion matrix with the table function, which we will give test_set
#showing 3 columns and we give it y_pred
cm = table(test_set[, 3], y_pred)

#Now we install ElemStatLearn, in my case I had problems with the version, so we occupy the following command, with X1 and X2 we set the minimum and maximum parameters, we configure the graphing, for example we use y_grid as y axis
#We visualize the training set and test set graphs.
install_version('ElemStatLearn', version = '4.0')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl =
               training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
        = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl =
               training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
        = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3',
                                         'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))