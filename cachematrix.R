## Programming Assignment 2: V2.0

## Write a pair of functions that cache the inverse of a matrix. 

## Compute the inverse of a square matrix can be done with the solve  
## function in R. For example, if X is a square invertible matrix, 
## then solve(X) returns its inverse.

## For this assignment, assume that the matrix supplied is always invertible.


makeCacheMatrix <- function(x = matrix()) {
  ## This function creates a special "matrix" object that can cache   
  ## its inverse.
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


cacheSolve <- function(x, ...) {
  ## This function computes the inverse of the special "matrix" 
  ## returned by makeCacheMatrix above.
  ## If the inverse has already been calculated (and the matrix 
  ## has not changed), then the cachesolve should retrieve the 
  ## inverse from the cache.

  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
