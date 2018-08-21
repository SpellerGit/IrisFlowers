# Author : Maciej Karcz
# Date : 02.06.2018r

source("generate.R")
source("grouping.R")
source("quality_check.R")

# Testing the most-used functions in the program

# distance4D from grouping.R
x1<- c(1,1,1,4)
x2<- c(1,1,1,3)
stopifnot(distance4D(x1,x2)==1)

# make_groups form grouping.R
# With this data and centroids we should get in return 3 matrixes 3x3
dane <- matrix(c(1,1,2,1, 1,2,2,1, 2,3,2,1,
                 5,6,7,6, 7,8,7,8, 7,6,8,7,
                 12,19,16,15, 13,14,11,20, 15,16,20,10),byrow = TRUE, nrow = 9, ncol = 4)
centroidy <- c(1,1,1,1,5,5,5,5,12,12,12,12)
l_centroidow <- 3
grupy <- make_groups(dane,centroidy,l_centroidow)
stopifnot(nrow(grupy[[1]])==3,nrow(grupy[[2]])==3,nrow(grupy[[3]])==3)

# generate from generate.R
# Output vector consists of centroids in one vector (1 row). Each centroid have consists of 4 numbers
liczba_losowych <- 5
losowe <- generate(liczba_losowych, 1,2, 3,4, 1,2, 3,4 )
stopifnot(length(losowe)==liczba_losowych*4)

# square_error from quality_check.R
# (6-4)^2 + (2-4)^2 = 8 
x3 <- matrix(c(1,1,1,6,1,1,1,2),byrow = TRUE, nrow =2, ncol = 4)
x4<- c(1,1,1,4)
stopifnot(square_error(x4,x3)==8)

# quality from quality_check.R
# in the beginning, the function counts colMeans and then calls square_error
# output should be 4
m1 <- data.frame(1,1,1,5,"class1")
names(m1) <- c("V1","V2","V3","V4","V5")
m2 <- data.frame(1,1,1,3,"class1")
names(m2) <- c("V1","V2","V3","V4","V5")
m3 <- data.frame(1,1,1,1,"class2")
names(m3) <- c("V1","V2","V3","V4","V5")

m1 <- rbind(m1,m2) # 1 1 1 5 class1
                   # 1 1 1 3 class1 -> mean : 1 1 1 4 ; from square_error we will get = 2
m2 <- rbind(m2,m3) # 1 1 1 3 class1                                                       -> sum = 2 + 2 =4
                   # 1 1 1 1 class2 -> mean : 1 1 1 2 ; from square_error we will get = 2

dane2 <- list(m1,m2)
liczba_centroidow <- 2
stopifnot(quality(dane2,liczba_centroidow)==4)