## makeCacheMatrix function is used to hold the values of the matrix and the inverse of the matrix in the global env
## cacheSolve function is used to fetch the inverse of a matrix by fetching the value from global variable

## this function is a simple POJO object that has been declared in the global env. it keeps the matrix 
##and the inverse of the matrix in the global env

makeCacheMatrix <- function(x = matrix()) {

    inverseMat<- NULL
    mat<- NULL
    get<- function()
    {
       print("get")
        mat
    }
    set<- function(input)
    {
        print("set")
        mat<<- input
        inverseMat<<- NULL
        
    }
    
    getInverse<- function(){
       print("getInverse")
        inverseMat  
    }
    setInverse<- function(input){
        print("setInverse")
        inverseMat<<- solve(mat)   
    }
   
  list(get=get, set=set, getInverse= getInverse, setInverse=setInverse )  
}
cacheFunction<- makeCacheMatrix()

## This function first checks if the input is NULL or not then it checks if the matrix in the global variable has been 
## initialized if not then it initializes the matrix and sets the global variable of inverse of matrix, in the same condition 
## it checks if the input matrix is same as the matrix that has been saved in the global variable if yes then it only fetches the 
## cache value of the inverse of the matrix instead of performing entire operation

cacheSolve <- function(x, ...) {
   
  result<- NULL
  if(is.null(x)){
     print("matrix is null")
      return 
  }
 
  mat<- cacheFunction$get()
  if(is.null(mat) | !identical(x, mat)){
      cacheFunction$set(x)
      cacheFunction$setInverse(cacheFunction$get())
     
  }
  cacheFunction$getInverse()
 
}

a<- matrix(data= 1:4, nrow=2,ncol=2)
cacheSolve(a)
