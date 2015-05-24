# To avoid waisting time for calculating inverse matrix each time, caching results can be beneficial.
# The following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) s <<- solve
  getinverse <- function() s
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# The following function returns the inverse of the original matrix input to makeCacheMatrix(). 
# If the inverse has already been computed, get it from the cache and skips the computation.
# the inverse has already been computed. If so, it gets the result and skips thecomputation. 
# Otherwise it computes the inverse of matrix and sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
  s <- x$getinverse()
  if(!is.null(s)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setinverse(s)
  m
}
