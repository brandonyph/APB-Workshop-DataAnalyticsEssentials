#determine the data type for each of the below
  #Boolean
  #Numeric
  #Interger
  #Complex
  #Character
  #Raw

  v <- TRUE 
  v <- 23.5
  v <- 2L
  v <- 2+5i
  v <- "TRUE"
  v <- charToRaw("Hello")

##########################################
#Data Object / Data Structure  

# Vector, same type in 1dimension
apple <- c('red','green',"yellow")
print(apple)

# Matrices,   same type in 2 dimension
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

#Arrays, multiple type in 2dimensions
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

#Factors 
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object. 1 dimension, multiple levels
factor_apple <- factor(apple_colors)

  # Print the factor.
  print(factor_apple)
  print(nlevels(factor_apple))


#list, many dimensions in many datatypes? combination of all of the above 
# can contain multiple components within the structure
x <- list("a" = c(1,2,3,5,6,7,8), "b" = c(TRUE,"hello"), "c" = 1:3)
print(x)


#Data Frame, 2 dimensional (?), same datatype in the same columns  
# Essential multiple list joined togethed
# Create the data frame.
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)


#S4 Objects
setClass("data1",representation(x1="numeric",x2="numeric",x3="character"))
data1<-new("data1",x1=rnorm(20),x2=rexp(20,1.12),x3=c("TRUE","FALSE"))
data1

setClass("data2",representation(x1="integer",x2="numeric"))
data2<-new("data2",x1=rpois(200,5),x2=rexp(50,1.12))
data2



#Can you write out a use case of each of the data type listed above? 
# Data Type
    # Boolean
    # Numeric
    # Interger
    # Complex
    # Character
    # Raw

# Data Object
    # Vector, same type in 1dimension
    # Matrices
    # Arrays
    # Factors 
    # list
    # Data Frame
    # S4 Objects
