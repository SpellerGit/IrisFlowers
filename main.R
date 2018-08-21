# Author : Maciej Karcz
# Date : 02.06.2018r

library(DEoptim)
source("Kmeans_traditional.R")
source("Kmeans_evolutionary.R")
source("show_accuracy.R")

# minmal and maximal values taken from UCI side
sepal_lmin <- 4.3 # minimal length in cm
sepal_lmax <- 7.9 # maximal length in cm

sepal_wmin <- 2.0 # minimal width in cm
sepal_wmax <- 4.4 # maximal width in cm

petal_lmin <- 1.0  
petal_lmax <- 6.9 

petal_wmin <- 0.1 
petal_wmax <- 2.5  

K <- 3                        # number of centroids (minimal 3) <- this is not an experimental object,
                              # (in preliminary documentation we decided to use only 3 centroids)
                              # but the program also works for a different number of centroids

C <- list()                   # list of grouped elements
traditional_iterations <- 200 # number of iterations in traditional alghoritm


population_members <- 50      # number of population members in DEoptim (minimal 5)
evolutionary_iterations <- 10  # number of DEoptim iterations ( minimal 4)


# Warning -> other data sets must have 4 numbers in each row
IrisFlowers <- read.table("IrisFlowers.txt", header=FALSE, sep=",", quote="") # data for grouping

# Traditional version of algorithm. Due to the high execution time
# it is recommended to select one of 2 versions of the algorithm

# Kmeans_traditional(K,sepal_lmin,sepal_lmax,
#                      sepal_wmin,sepal_wmax,
#                      petal_lmin,petal_lmax,
#                      petal_wmin,petal_wmax,
#                      IrisFlowers,
#                      traditional_iterations)


# Evolutionary version of algorithm. Due to the high execution time
# it is recommended to select one of 2 versions of the algorithm

thebest <- Kmeans_evolutionary(K, sepal_lmin,sepal_lmax,
                                      sepal_wmin,sepal_wmax,
                                      petal_lmin,petal_lmax,
                                      petal_wmin,petal_wmax,
                                      IrisFlowers,
                                      population_members,
                                      evolutionary_iterations)

# do not use show_accuracy with another set of data ( where 5th column is not specified)
show_accuracy(thebest)
