# Practice 1
___
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