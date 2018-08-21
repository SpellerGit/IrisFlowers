# Author : Maciej Karcz
# Date : 02.06.2018r

source("grouping.R")
source("quality_check.R")

# Evolutionary version of the algorithm. Uses DEoptim

Kmeans_evolutionary <- function(no_centroids,  s_lmin,s_lmax,
                                               s_wmin,s_wmax,
                                               p_lmin,p_lmax,
                                               p_wmin,p_wmax,
                                               data, no_members,
                                               no_iterations){
  
  
  # This function exists only, so DEoptim can run properly
  # To run minimalizowana_funkcja  no_centroids and data must be specyfied
  
  minimalizowana_funkcja <- function(Centroids){     # the function to be optimized by DEoptim algorithm
    # centroids -> set of centroids, data -> set of data(iris flowers),no_centroids -> number of centroids
    tmp <- make_groups(data, Centroids, no_centroids)                  
    wynik <- quality(tmp, K)
  }
  
  
  lower <- vector()
  upper <- vector()
  # DEoptim needs vector of minimal and maximal values
  for( i in 1:no_centroids){
    
    lower[i*4-3] <- s_lmin
    lower[i*4-2] <- s_wmin
    lower[i*4-1] <- p_lmin
    lower[i*4]   <- p_wmin
    
    upper[i*4-3] <- s_lmax
    upper[i*4-2] <- s_wmax
    upper[i*4-1] <- p_lmax
    upper[i*4]   <- p_wmax
  }
  

  outDEoptim <- DEoptim(minimalizowana_funkcja, lower, upper,
                        DEoptim.control(NP = no_members, itermax = no_iterations,
                                        storepopfrom = 1, storepopfreq = 2))
  
  summary(outDEoptim)
  plot(outDEoptim, plot.type = "bestvalit", type ='b', col ='blue')
  najlepszy <-outDEoptim[["member"]][["bestmemit"]][no_iterations,] # find the best member and make groups for him
  return (make_groups(data, najlepszy, no_centroids))
}