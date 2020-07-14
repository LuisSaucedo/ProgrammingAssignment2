## Hello! You'll see my functions, I used the set-get method just like
## in the original code. My code uses the solve function, you need to input
## an invertible matrix.

## set-get to work with the cache.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) m <<- inverse 
        getinv <- function() m
        list(set = set, get = get, 
             setinv = setinv,
             getinv = getinv)
        
}


## In this I make use of the makeCacheMatrix function and the cache to compute the inverse matrix.

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data,...)
        x$setinv(m)
        m
}

# Examples:
my_matrix <- matrix(1:4, 2, 2)
solve(my_matrix)

my_matrix_fun <- makeCacheMatrix(my_matrix)
cacheSolve(my_matrix_fun)
