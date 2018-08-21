# Author : Maciej Karcz
# Date : 02.06.2018r

# This function is grouping data to the closest of the given centroids

make_groups <- function(data, centroids, numberOfCentroids){
  dtc <- vector()                                                           # distance to centorids     
  C <- list()                                                               # list of elements assigned to Centroids (1 ,2 ... K)
  n <- 1
  repeat{                       # initializing elements of the list
    if(n > numberOfCentroids)
      break
    else{
      C[[n]] <-data.frame()     # I needed to define type of stored data 
      n<-n+1
      }
    }     
  
  for(i in 1:nrow(data)){                                         # for each row in data    
    for(j in 1:numberOfCentroids){                                # add this row to the matching group of the closest centroid            
      dtc[j] <- distance4D( data[i,],centroids[(j*4-3):(j*4)] )                                            
    }

  C[[which.min(dtc)]] <- rbind(C[[which.min(dtc)]], data[i,])                                             
  }

  return(C)
}

# calculating distance
#input : 1 row
distance4D <- function(b, c){
  return(sqrt((b[1]-c[1])^2+(b[2]-c[2])^2+(b[3]-c[3])^2+(b[4]-c[4])^2))
}