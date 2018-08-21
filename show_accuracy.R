# Author : Maciej Karcz
# Date : 02.06.2018r


# This function is used to show the accuracy in grouping of the best centroids from the evolutionary version of algorithm
# WARNING -> in this function I use the flower names given from the UCI site just to show how good my algorithm is
# -> do not use for other sets of data (without 5th column with names)
# it is made only for the evolutionary version of algorithm
show_accuracy <- function(evo_grouped){
  print("In percents:", quote = FALSE)
  for ( j in 1:K){
    i_set <- 0
    i_ver <- 0
    i_vir <- 0
    for ( i in 1:nrow(evo_grouped[[j]])){             # 
      if(evo_grouped[[j]][i,5]=="Iris-setosa"){
        i_set <- i_set + 1
      }
      else if(evo_grouped[[j]][i,5]=="Iris-versicolor"){
        i_ver <- i_ver + 1
      }
      else if(evo_grouped[[j]][i,5]=="Iris-virginica")
        i_vir <- i_vir + 1
    }
    print(c("Table", j), quote = FALSE)
    print(c("Iris setosa =",round(i_set/(i_set+i_ver+i_vir)*100,digits=2) ), quote = FALSE)
    print(c("Iris versicolor =",round(i_ver/(i_set+i_ver+i_vir)*100,digits=2) ), quote = FALSE)
    print(c("Iris virginica =",round(i_vir/(i_set+i_ver+i_vir)*100,digits=2) ), quote = FALSE)
  }
}