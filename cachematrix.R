## makeCacheMatrix function is used to hold the values of the matrix and the inverse of the matrix in the global env
## cacheSolve function is used to fetch the inverse of a matrix by fetching the value from global variable

## this function is a simple POJO object that has been declared in the global env. it keeps the matrix 
##and the inverse of the matrix in the global env

makeCacheMatrix <- function(x = matrix()) {

  
  mat <- NULL
  m <- NULL
  set <- function(y) {
    print("setting")
    mat <<- y
    # m <<- NULL
  }
  get <- function() {
    print("getting")
    mat
  }
  setinv <- function(inv)
  {m <<- inv
  
  
  print("setting inv")
  }
  getinv <- function()
  {
    print("getting inv")
    m
    
  }
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}
cachematrix<- makeCacheMatrix()

## This function first checks if the input is NULL or not then it checks if the matrix in the global variable has been 
## initialized if not then it initializes the matrix and sets the global variable of inverse of matrix, in the same condition 
## it checks if the input matrix is same as the matrix that has been saved in the global variable if yes then it only fetches the 
## cache value of the inverse of the matrix instead of performing entire operation

cacheSolve <- function(x, ...) {

    mat1 <- cachematrix$getinv()
  print(1)
  print(mat1)
  if(!is.null(mat1)) {
    message("getting cached data")
    
    return(mat1)
  }
  print(2)
  cachematrix$set(x)
 data <- cachematrix$get()
  mat2 <- solve(data)
  cachematrix$setinv(mat2)
   mat3<- cachematrix$getinv()
  print(4)
  print(mat3)
  mat3
  
}

a<- matrix(data= 1:4, nrow=2,ncol=2)
cacheSolve(a)
