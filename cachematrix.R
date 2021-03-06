## Below are two functions that are used to create a special object that
## stores a matrix and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix",
## which is really a list containing three functions to
##  1. get the value of the matrix
##  2. set the value of the inverse
##  3. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list( get = get, 
          setinverse = setinverse,
          getinverse = getinverse)
}

## The cacheSolve function calculates the inverse of the special "matrix" 
## created with makeCacheMatrix. However, it first checks to see if the inverse 
## has already been calculated. If so, it gets the inverse from the cache and 
## skips the computation. Otherwise, it calculates the inverse of the data and 
## sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
