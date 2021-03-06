#Scenario: You are a Data Scientist working for a consulting firm.
#One of your colleagues from the Auditing Department has asked you
#to help them assess the financial statement of organization X.

#You have been supplied with two vector of data: mounthly revenue and
#expenses for the financial year in quiestion. Your task is to calculate
#the following financial matrics:
  
#- profit for each mounth
#- profit after tax for each month (the tax rate is 30%)
#- profit margin for each month - equal to profit after tax divided by revenue
#- good months - where the profit after tax was greater than the mean for the year
#- bad months - where the profit after tax was less then the mean for years
#- the best month - where the profit after tax was max for the year
#- the worst month - where the profit after tax was min for the year

#All results need to be presented as vectors.

#Results for dollar values need to be calculate with $0.01 precision, but need to be
#presented in Units of $1,000(i.e. 1k) with no decimal point.

#Results for the profit margin ratio needed to be presented in units of % with no
#decimal points.

#Note: Your collegue has warned you that it is okay for tax for any given month to be
#negative (in accounting terms, negative tax translates into a deferred tax asset).

#Hint 1
#Use:
#round()
#mean()
#max()
#min()

#Data
#This is the income data set:
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
#This is the expense data set:
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

#Calculate the profit as the difference between income and expenses.
profit <- revenue - expenses
profit

#Calculate the tax as 30% of profit and round to 2 decimal points
tax <- round(0.30 * profit, 2)
tax 

#Calculate the remaining profit after deducting taxes
profit.after.tax <- profit - tax
profit.after.tax

#Calculate the profit margin as profit after tax on income. Round to 2 decimal points, then multiply by 100 to get%
profit.margin <- round(profit.after.tax/ revenue, 2) * 100
profit.margin

#Calculate the average profit after taxes for the 12 months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find the months with earnings above the average after taxes
good.months <- profit.after.tax > mean_pat
good.months

#Bad months are the opposite of good months
bad.months <- profit.after.tax < mean_pat
bad.months

#The best month is where the after-tax profit was equal to the maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The worst month is where the after-tax profit was equal to the minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit, 0)
profit.after.tax.1000 <- round(profit.after.tax, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#Preview Of What's Coming In The Next Section
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

#Print The Matrix
M
barplot(M)
