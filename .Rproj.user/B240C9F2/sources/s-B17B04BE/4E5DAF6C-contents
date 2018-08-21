# Author : Maciej Karcz
# Date : 02.06.2018r

# This function converts the total distance of points from the mean in each group

quality <- function(data, numberOfCentroids){                 # Grouping quality assessment function
  result <- 0
  n <- 1
  repeat{                      
    if(n > numberOfCentroids)
      break
    else{
      if(ncol(data[[n]])==5){ data[[n]] <- data[[n]][,-5] }   # No numeric data in 5th column 
      center <- colMeans(data[[n]])
        if(!identical(square_error(center, data[[n]]), numeric(0))){    # if table is empty , dont change result
          result <- result + square_error(center, data[[n]])
        }
        else{print("Quality_check: one of tables is empty")}      # if you add a number and numeric(0), you will get numeric(0) ( not desired)
      n<-n+1
    }
  }
  
  return(result)
  
}

# Square error <- distant points have a worse impact on the whole

square_error <- function(aver,data){
  wynik <- 0
  for(i in 1:nrow(data)){                                             
    wynik <- wynik +  ( (aver[1]-data[i,1])^2+(aver[2]-data[i,2])^2+(aver[3]-data[i,3])^2+(aver[4]-data[i,4])^2 )                                        
  }
  return(wynik)
}