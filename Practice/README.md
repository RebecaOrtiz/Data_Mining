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