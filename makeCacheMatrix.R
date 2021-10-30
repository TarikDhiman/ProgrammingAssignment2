
R version 4.1.1 (2021-08-10) -- "Kick Things"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> makeCacheMatrix <- function(x = matrix()){
+       inv <- NULL
+       set <- function(y){
+             x <<- y
+             inv <<- NULL
+       }
+       get <- function() {x}
+       setInverse <- function(inverse) {inv <<- inverse}
+       getInverse <- function() {inv}
+       list(set = set, get, setInverse = setInverse, getInverse = getInverse)
+ }
> 
> cachesolve <- function(x, ...){
+       inv <- x$getInverse()
+       if(!is.null(inv)){
+             message("getting cached data")
+             return(inv)
+       }
+       mat <- x$get()
+       inv <- solve(mat, ...)
+       x$setInverse(inv)
+       inv
+ }
> 
