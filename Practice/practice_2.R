Functions

Practice find 20 more functions in R and make an example of it.

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

#1.- To see help in htpl format
help.start()

#2.-To know which is the directory where you are working
getwd ()

#3.- To change the working directory
setwd ("C: / data")
setwd ("/ home / nomcarpeta / nomcarpeta") 

#4.- This function saves the content of an object in a file
write.table (v)

#5.- To generate a regular sequence of whole numbers
1:30
1: 10-1

#6.- To generate sequences of real numbers
seq (1, 5, 0.5)

#7.- This function creates a vector with identical elements
rep (1, 7)

#8.- Generate regular series of factors.
gl (k, n) where k is the number of levels or classes, and n is the number of replicates in each level

gl (5, 3)

#9.- To view the type and length of an object
v <- c (1,2,3,4,100)
#type
mode(v)

#length
length(v)

#10.- The rev (v) function, returns the value in an inverted way
v <- c (14, 82, 3, 90)
#We show normally
v
#We show using the function
rev (v)

#11.- The function "ls.str ()" shows some details of the objects in memory
ls.str()

#12.- This function removes items from a list
v <- c (14, 82, 3, 90)
rm(v)

#13.- This function calculates the factorial
v <- 3
factorial(v)

#14.- This function compute the exponential value of a number 
v <- 3
exp(v)

#15.- This function converts the text into uppercase
v <- "Hi, I'm Rebeca"
toupper (v)

#16.- This function converts the text to lowercase
tolower (v)

#17.- This function defines the number of decimal places to be used.
r <- 3.1416
round (r, 2)

#18.- This function calculates the absolute value
v <- c (-7,33,8, -45,-16)
abs (v)

#19.- This function   the diagonal of a matrix
diag(2,4,6)

#20.- Creates a data frame with all combinations of vectors or factors supplied as arguments
expand.grid()


