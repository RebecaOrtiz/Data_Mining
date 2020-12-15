setwd("C:/")
dataset <- read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

dataset$Purchased = factor(dataset$Purchased, levels = c(0,1) )

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio =0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



training_set[-3]= scale(training_set[-3])
test_set[-3]= scale(test_set[-3])


library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                data=training_set,
                type='C-Classification',
                kernel='linear')

naiveBayes


y_pred = predict(classifier, newdata = test_set[-3])
y_pred

cm = table(test_set[, 3], y_pred)
cm

library(ElemStatLearn)
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