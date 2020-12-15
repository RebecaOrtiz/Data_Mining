# Practice 1

Prove the law of large numbers for N normally distributed random numbers with mean = 0, stdev = 1:
Create an R script that counts how many of these numbers are between -1 and 1 and divides
by the total amount of N
You know that E (X) = 68.2%
Check that Mean (Xn) -> E (X) while rerunning your script while increasing N

Innuendo:
Initialize the sample size
```r
Xn <- .68
```
We assign the sample value to 100
```r
sampleSize <- 100
```
Initialize the counter to 0 just to ensure it start from the beginning
```r
counter <- 0
```
Loop for (i in rnorm (size)) it make i worth a value from the distribution function (mean = 0, stdev = 1). Check if iterated variable drops with the if conditional that is between values -1 and 1 if it is true the counter will increase +1
```r
    for(i in rnorm(sampleSize))
    {

    if(i >= -1 && 1 <= 1){

        counter <- counter + 1
     }
  
    }
```
Returns a result <- counter / value of sample size
```r
    res <- counter/sampleSize
```
Now we print the results of the division
```r
res
```
And we verified if the results it's equal to Xn (68%)
```r
res == Xn
```
# Practice 2
Functions

Practice find 20 more functions in R and make an example of it.

```r
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
```
The "ls ()" function lists the objects in memory: it only shows their names
```r
ls()
```
The function "ls.str ()" shows some details of the objects in memory
```r
ls.str()
```
This function removes objects
```r
rm()
```
It will show us help for the function
```r
lm()
help()
```
To see help in html format
```r
help.start()
```
The function "apropos" finds all those functions whose name contains the given word
```r
apropos(help)
```
To view the type and length of an object
```r
mode()
length()
```
To know which is the directory where you are working
```r
getwd()
```
To change the working directory
```r
setwd("C:/data")
setwd("/home/rebeca/ejercicio")
```
This function created a data frame and is the most common way to read data in tabular form
```r
read.table(archivo.dat)
```
This function saves the content of an object in a file
```r
write.table()
```
To generate a regular sequence of whole numbers
```r
1:30
1:10-1
```
To generate sequences of real numbers
```r
seq(1, 5, 0.5)
```
This function creates a vector with identical elements
```r
rep(1,30)
```
Generate regular series of factors.
```r
gl(k, n) 
```
where k is the number of levels or classes, and n is the number of replicates in each level
```r
gl(5 ,3)
```
Creates a data frame with all combinations of vectors or factors provided as arguments
```r
expand.grid()
```
# Practice 3
Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and expenses for the financial year in quiestion. Your task is to calculate the following financial matrics:
  
- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be negative (in accounting terms, negative tax translates into a deferred tax asset).

Hint 1
Use:
round()
mean()
max()
min()

Data

This is the income data set:
```r
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
```
This is the expense data set:
```r
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```

Solution

Calculate the profit as the difference between income and expenses.
```r
profit <- revenue - expenses
profit
```

Calculate the tax as 30% of profit and round to 2 decimal points
```r
tax <- round(0.30 * profit, 2)
tax 
```

Calculate the remaining profit after deducting taxes
```r
profit.after.tax <- profit - tax
profit.after.tax
```

Calculate the profit margin as profit after tax on income. Round to 2 decimal points, then multiply by 100 to get%
```r
profit.margin <- round(profit.after.tax/ revenue, 2) * 100
profit.margin
```

Calculate the average profit after taxes for the 12 months
```r
mean_pat <- mean(profit.after.tax)
mean_pat
```

Find the months with earnings above the average after taxes
```r
good.months <- profit.after.tax > mean_pat
good.months
```

Bad months are the opposite of good months
```r
bad.months <- profit.after.tax < mean_pat
bad.months
```

The best month is where the after-tax profit was equal to the maximum
```r
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```

The worst month is where the after-tax profit was equal to the minimum
```r
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```

Convert All Calculations To Units Of One Thousand Dollars
```r
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit, 0)
profit.after.tax.1000 <- round(profit.after.tax, 0)
```

Print Results
```r
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```

Preview Of What's Coming In The Next Section
```r
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
```

Print The Matrix
```r
M
barplot(M)
```