## This first function creates, from an input matrix, a special vector that is actually containing 3 functions to 
## get the values of the matrix: get(),
## set the value of the inverse of the matrix in a cache: setinv(), 
## and get the value of the inverse of the matrix from the cache: getinv().

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(get = get,
             setinv = setinv,
             getinv = getinv)
}



## This function returns the inverse of a matrix. 
## It first checks if the inverse has already been calculated and is saved in the cache with getinv
## If that is the case, the inverse is got without computing it again. The message "getting cached data" is printed to inform the user.
## If the inverse has not already been calculated, the function computes it with solve 
## and sets it in the cache thanks to setinv()

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data<-x$get()
        inv<-solve(data,...)
        x$setinv(inv)
        inv
}

