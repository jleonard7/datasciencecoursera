## The purpose of these functions are to allow the user to 
## cache the inverse of an invertible matrix. This is useful
## to reduce execution time of programs and calculations

## The function below defines 4 functions which are then 
## stored in a list. The list is used in second function to
## cache inverse of a matrix or retrieve the cached inverse

makeCacheMatrix <- function(x = matrix()) {
        
        i_mat <- NULL
        set_mat <- function(y) {
                x <<- y
                i_mat <<- NULL
        }
        get_mat <- function() x
        
        setInverse<- function(solve) i_mat <<- solve
        getInverse <- function() i_mat
        
        # This list contains 4 functions
        list(set = set_mat, get = get_mat,
             setInverse = setInverse,
             getInverse = getInverse)
}


## This function receives as an input a list that contains
## the necessary functions to set and get a matrix as well 
## as set the inverse and retrieve the inverse value

cacheSolve <- function(x, ...) {
        # References the getInverse function of the list x
        i_mat <- x$getInverse()
        
        # If value is returned then says getting cached result
        if(!is.null(i_mat)) {
                
                message("Getting cached inverse of this matrix")
                
                # This makes it exit the function
                return(i_mat)
        }
        
        # Calls function to retrieve data
        data <- x$get()
        
        # Calls function to get inverse of matrix
        i_mat <- solve(data, ...)
        
        # Stores inverse for future retrieval
        x$setInverse(i_mat)
        
        # Returns value
        i_mat
}
