library(magrittr)

# Basic use:
iris %>% head()

# Use with lhs as first argument
iris %>% head(10)

# Using the dot place-holder
"Ceci n'est pas une pipe" %>% gsub("une", "un", .)

# When dot is nested, lhs is still placed first:
sample(1:10) %>% paste0(LETTERS[.])
# essentially, paste0(sample(1:10),LETTERS[sample(1:10)])
#>  [1] "6F"  "1A"  "5E"  "7G"  "8H"  "4D"  "10J" "2B"  "9I"  "3C" 

# This can be avoided:
rnorm(100) %>% 
  {c(min(.), mean(.), max(.))} %>% 
  floor()
#> [1] -3 -1  2

# Lambda expressions: 
## Simply put, a lambda function is just like any normal python function, 
## except that it has no name when defining it, and it is contained in one line of code
iris %>%
  {
    size <- sample(1:10, size = 1)
    rbind(head(., size), tail(., size))
  }
#>     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
#> 1            5.1         3.5          1.4         0.2    setosa
#> 2            4.9         3.0          1.4         0.2    setosa
#> 3            4.7         3.2          1.3         0.2    setosa
#> 4            4.6         3.1          1.5         0.2    setosa
#> 5            5.0         3.6          1.4         0.2    setosa
#> 6            5.4         3.9          1.7         0.4    setosa
#> 7            4.6         3.4          1.4         0.3    setosa
#> 8            5.0         3.4          1.5         0.2    setosa
#> 143          5.8         2.7          5.1         1.9 virginica
#> 144          6.8         3.2          5.9         2.3 virginica
#> 145          6.7         3.3          5.7         2.5 virginica
#> 146          6.7         3.0          5.2         2.3 virginica
#> 147          6.3         2.5          5.0         1.9 virginica
#> 148          6.5         3.0          5.2         2.0 virginica
#> 149          6.2         3.4          5.4         2.3 virginica
#> 150          5.9         3.0          5.1         1.8 virginica

# renaming in lambdas:
iris %>%
  {
    my_data <- .
    size <- sample(1:10, size = 1)
    rbind(head(my_data, size), tail(my_data, size))
  }


# Building unary functions with %>%
## A unary function is a function that takes one argument. 

trig_fest <- . %>% tan

1:10 %>% trig_fest
#>  [1]  0.0133878 -0.5449592  0.8359477  0.3906486 -0.8257855  0.8180174
#>  [7]  0.6001744  0.7640323  0.7829771  0.7153150
trig_fest(1:10)
#>  [1]  0.0133878 -0.5449592  0.8359477  0.3906486 -0.8257855  0.8180174
#>  [7]  0.6001744  0.7640323  0.7829771  0.7153150


################################################################################
## Iteration 
################################################################################
name <- c("Donald", "Joe", "Hillary")
age <- c(74, 78, 65)
city <- c("New york", "Denver", "Dallas")

df <- data.frame(name, age, city)

for (i in names(df)) {
  print(df[i])
}


################################################
for (i in seq(0, 20, 5)) {
  print(i)
}

################################################
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}


################################################
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "banana") {
    next
  }
  print(x)
}

################################################
adj <- list("red", "big", "tasty")

fruits <- list("apple", "banana", "cherry")
for (x in adj) {
  for (y in fruits) {
    print(paste(x, y))
  }
}

################################################
mtrx <- matrix(nrow = 30, ncol = 30)

# For each row and for each column, assign values 
# based on position: product of two indexes
for (i in 1:dim(mtrx)[1]) {
  for (j in 1:dim(mtrx)[2]) {
    mtrx[i, j] = i * j
  }
}

# Display the upper left 5x5 chunk
mtrx[1:5, 1:5]

#############################################################
# Apply a functino over the rows or columns in a matrix
#############################################################
##https://www.guru99.com/r-apply-sapply-tapply.html

m1 <- matrix(C<-(1:10),nrow=5, ncol=6)
m1
a_m1 <- apply(m1, 2, sum)
a_m1

b_m1 <- apply(m1, 1, sum)
b_m1
#############################################################
#tapply apply the function to two list
#############################################################
iris$Sepal.Length
iris$Species

tapply(iris$Sepal.Length, iris$Species, mean)

#############################################################
# Using Lapply (list apply), sapply(vector/matrix apply), 
#############################################################
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")

#output as a list
movies_lower <-lapply(movies, tolower)
movies_lower

#output as a vector/matrix
movies_lower <- sapply(movies, tolower)
movies_lower


########################################################
# Workshop Exercise
########################################################
library(parathyroidSE)
data(parathyroidExonsSE)

cm <- assay(parathyroidExonsSE)[1:5000,]

#1. Construct a histogram plot of the first sample in the matrix 
#    to visualized the overall distribution of expressions
#    p/s: you might need some normalization process for this, try log10()

#2. Use a loop function, construct the same plot over all 27 sample individually 
#    save the plot to a local drive as a PNG. Try chaining all command into a single chunk
#    can you try to compare the expression histogram before and after normalization?

#3. Using pheatmap, identify possible cluster of samples and separate the sample 
#    into a minimal of 2 cluster 

#4. Construct the heatmap of expression of each cluster (cluster 1, cluster 2) 
#     save the plot to a local drive as a PNG. 
#     Try chaining all command into a single chunk if you want a challenge

#5. Create a script that would allow the saving of images from individual columns
#     apply this function to the matrix using the apply() functions 

#6. Attach the colname name to the matrix using colData(parathyroidExonsSE)
#    Write the code that would allow you do separate the sample based on 
#       a. Treatment,
#       b. Time
#    construct a new object that contains the expression value of only those samples 



