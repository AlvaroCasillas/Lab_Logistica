library(readr)
library(plotly)
library(dplyr) 
library(knitr) 
library(tidyr) 
library(hms)

matriz_distancias <- read.csv("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\matriz dist.csv")

for(i in 2:453)
  matriz_distancias[i,i+1] <- 0



vector_estaciones <- c(0,0,0,0,0)
vector_distancias <- c(0,0,0,0,0)
datos_estaciones <- matrix(nrow = 453, ncol = 16)
datos_distancias <- matrix(nrow = 453, ncol = 16)

for(i in 2:453){
  provisional <- matriz_distancias %>% filter(matriz_distancias[i]>0 & matriz_distancias[i]<=0.5)
  provisional
  tam <- dim(provisional)[1]
  seleccion <- provisional[1]
  lol <- provisional[i]
  tam <- dim(provisional)[1]
  if(tam>0){
    for(j in 1:tam){
        datos_estaciones[i,j] <- seleccion[j,1]
        datos_distancias[i,j] <- lol[j,1]
    }
  }
  #if(dim(provisional)[1]>0)
    #cbind(datos_estaciones,vector_estaciones)
    #rbind(datos_estaciones, vector_estaciones)
    #datos_distancias[,i] <- vector_distancias
  #}
}
#for(i in 1:453)
#  for(j in 1:5){
#    if(is.na(datos_estaciones[i,j]))
#      datos_estaciones[i,j]<-as.integer(0)
#    if(is.na(datos_distancias[i,j]))
#      datos_distancias[i,j]<-as.integer(0)
#  }
    
    
    