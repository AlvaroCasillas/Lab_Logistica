library(readr)
library(dplyr)
library(ggplot2)


lol <- read.csv("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\tasasArribos_.csv")

summary(lol)
arribos <- matrix(nrow = 4067, ncol = 4067)