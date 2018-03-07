library(readr)
library(dplyr)
library(ggplot2)


ubicaciones <- read.csv("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Ubicacion_uso.csv")


summary(ubicaciones)
ggplot(ubicaciones, aes(x=Longitud, y=Latitud , color=ubicaciones$Cluster)) +  geom_point() +  theme_bw()
         