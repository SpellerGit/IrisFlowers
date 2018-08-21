# Author : Maciej Karcz
# Date : 02.06.2018r

source("generate.R")
source("grouping.R")
source("quality_check.R")

# Traditional version of algorithm

Kmeans_traditional <- function(no_centroids,  s_lmin,s_lmax,
                                              s_wmin,s_wmax,
                                              p_lmin,p_lmax,
                                              p_wmin,p_wmax,
                                              data, iterations){
  groups <- list()
  
  Losowe_Centroidy <- generate(no_centroids, s_lmin,s_lmax, 
                                             s_wmin,s_wmax,
                                             p_lmin,p_lmax,
                                             p_wmin,p_wmax)
  
  groups <- make_groups(data, Losowe_Centroidy, no_centroids)
# Generating, and calculating first element
  wynik <- vector()
  wynik[1] <- quality(groups, no_centroids)
  
  
  for(i in 2:iterations){
    Losowe_Centroidy <- generate(no_centroids,    s_lmin,s_lmax,
                                                  s_wmin,s_wmax,
                                                  p_lmin,p_lmax,
                                                  p_wmin,p_wmax)
    
    groups <- make_groups(data, Losowe_Centroidy, no_centroids)
    
    wynik[i] <- wynik[i-1] + quality (groups, no_centroids)
  }
  
  for(i in 2:iterations){
    wynik[i]<-wynik[i]/i
  }
  
  
  # ploting :
  
  liczba_iteracji <- c(1:iterations)
  heading = paste("Traditional algorithm")
  plot(liczba_iteracji, wynik, type="n", main=heading)
  lines(liczba_iteracji,wynik, type="o")
}