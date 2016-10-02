## This function creates a special "matrix" object that can cache its inverse.

# The first function, makeCacheMatrix creates a special "matrix", 
# a list containing a function to
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse
# get the value of the inverse

makeCacheMatrix <- function(m = matrix()) {
        inver <- NULL
        set <- function(i) {
                m <<- i
                inver <<- NULL
        }
        get <- function() m
        setInverse <- function(inverse) inver <<- inverse
        getInverse <- function() inver
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inver <- x$getInverse()
        if (!is.null(inver)) {
                message("Using cached data")
                return(inver)
        }

        if (nrow(x$get())!=ncol(x$get())) {
                message("Matrix is singular")
        }
        m <- x$get()
        inver <- solve(m, ...)
        x$setInverse(inver)
        inver
}       
        
        
}
