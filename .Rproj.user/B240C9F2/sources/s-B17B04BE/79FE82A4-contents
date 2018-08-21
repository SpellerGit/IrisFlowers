# Author : Maciej Karcz
# Date : 02.06.2018r

# The function generate centroids in the given ranges

generate <- function(ile, x_min, x_max, y_min, y_max, z_min, z_max, t_min, t_max){
  i<-1
  centroidy <- c(runif(1, x_min, x_max), runif(1, y_min, y_max), runif(1, z_min, z_max), runif(1, t_min, t_max))
  # generate one , then extend vector
  # this form is the need for the DEoptim to work properly ( it needs one VECTOR(not matrix of centroids)
  while(i < ile){
    centroidy <- append(centroidy, c(runif(1, x_min, x_max), runif(1, y_min, y_max), runif(1, z_min, z_max), runif(1, t_min, t_max)))
    i <- i+1
  }
  return(centroidy)
}
