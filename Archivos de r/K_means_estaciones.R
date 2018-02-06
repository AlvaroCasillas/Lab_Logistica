library(readr)
library(dplyr)
library(ggplot2)

ubicaciones <- read.csv("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Ubicacion_estaciones.csv")

ubicaciones <- select(ubicaciones, Longitud, Latitud)
summary(ubicaciones)

ggplot(ubicaciones, aes(x=Longitud, y=Latitud)) +  geom_point() +  theme_bw()

ubicaciones_escaladas <- scale(ubicaciones) %>% as.data.frame()
summary(ubicaciones_escaladas)

output_kmeans <- kmeans(ubicaciones_escaladas, centers=30, iter.max=10)

table(output_kmeans$cluster)

output_kmeans$centers

centroides <- as.data.frame(output_kmeans$centers)
centroides$center <- "Y"
centroides$cluster <- "centroide"

ubicaciones_clustered <- ubicaciones_escaladas
ubicaciones_clustered$cluster <- output_kmeans$cluster
ubicaciones_clustered$center <- "N"
ubicaciones_clustered <- rbind(ubicaciones_escaladas, centroides)

ggplot(ubicaciones_clustered, aes(x=Longitud, y=Latitud, color=as.factor(cluster), shape=center)) + geom_point() + scale_color_brewer(palette="Spectral", name="Cluster") +
  theme_bw()
