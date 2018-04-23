library(readr)
library(dplyr)
library(ggplot2)


lol <- read.csv("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Estaciones_.csv")

summary(lol)

#lol[1,]
contador <- 0
dim(lol)[1]

for (i in 1:452) {
  for (j in 1:(lol[i,2]-1)) {
    lol <- rbind(lol, lol[i,])
    #lol[dim(lol)[1],1] <- (i*1000)+j 
  }
}

#write.csv(lol, file = "Datos_",row.names=FALSE, col.names = FALSE)

lol_a <- lol[3701:4075,3:236]
