#1. Initialize the sample size
Xn <- .68
#We assign the sample value to 100
sampleSize <- 100
#2. Initialize the counter to 0 just to ensure it start from the beginning
counter <- 0
#3. Loop for (i in rnorm (size)) it make i worth a value from the distribution function (mean = 0, stdev = 1)
for(i in rnorm(sampleSize))
  {
  #4. Check if iterated variable drops with the if conditional that is between values -1 and 1 
  if(i >= -1 && 1 <= 1){
    #5. Increase the counter if the condition is true
    counter <- counter + 1
  }
  
}
#6. Returns a result <- counter / N
res <- counter/sampleSize
#Now we print the results of the division
res
#And we verified if the results it's equal to Xn (68%)
res == Xn