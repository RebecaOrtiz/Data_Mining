# Table and scale functions

### Table 
The table function is used to construct one-way frequency tables, then the structure of the function.
table(..., exclude, useNA)
The parameters of the function are:

```r
... space to locate the names of the objects (variables or vectors) for which you want to construct the table.
```        
```r
exclude: vector with the levels to be removed from the table. If exclude-NULL implies that you want to see NNs, which is equivalent to useNA - 'always'.
``` 
```r
useNA: Instruction of what you want with NA. There are three possible values for this parameter: 'no' if you do not want to use it, 'ifany' and 'always' if you want to include it.
``` 


### Scale
scale is a generic function whose default method centers and/or scales columns in a numeric array.

```r
scale(x, center - TRUE, scale - TRUE)
``` 

Arguments
```r
X
a numeric matrix (similar object).
``` 
```r
Center
either a logical value or a numeric-similar vector of length equal to the number of columns, where 'numeric-alike' means that it will be applied correctly if it is not true.xas.numeric(.) is.numeric(.)
``` 
```r
Scale
a logical value or a numeric-similar vector of length equal to the number of columns in .x
``` 
