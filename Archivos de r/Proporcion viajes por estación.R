library(readr)
library(dplyr)
library(class) 
library(knitr) 
library(tidyr) 
library(hms)




ecobici_enero <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-01_.csv")
ecobici_febrero <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-02_.csv")
ecobici_marzo <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-03_.csv")
ecobici_abril <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-04_.csv")
ecobici_mayo <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-05_.csv")
ecobici_junio <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-06_.csv")
ecobici_julio <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-07_.csv")
ecobici_agosto <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-08_.csv")
ecobici_septiembre <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-09_.csv")
ecobici_octubre <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-10_.csv")
ecobici_noviembre <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-11_.csv")
ecobici_diciembre <- read_csv("C:\\Users\\lablogistica\\Documents\\Ecobici_2016\\2016-12_.csv")


names(ecobici_junio)[12] <-"Mes_Retiro" 

ecobici <- rbind2(ecobici_enero,ecobici_febrero)
ecobici <- rbind2(ecobici, ecobici_marzo)
ecobici <- rbind2(ecobici, ecobici_abril)
ecobici <- rbind2(ecobici, ecobici_mayo)
ecobici <- rbind2(ecobici, ecobici_junio)
ecobici <- rbind2(ecobici, ecobici_julio)
ecobici <- rbind2(ecobici, ecobici_agosto)
ecobici <- rbind2(ecobici, ecobici_septiembre)
ecobici <- rbind2(ecobici, ecobici_octubre)
ecobici <- rbind2(ecobici, ecobici_noviembre)
ecobici <- rbind2(ecobici, ecobici_diciembre)

totales <- dim(ecobici)[1]
totales

ecobici <- ecobici %>% filter(Ciclo_Estacion_Arribo != 1001 && Ciclo_Estacion_Retiro != 1001 && Ciclo_Estacion_Arribo != 1002 && Ciclo_Estacion_Retiro != 1002)


names(ecobici)

#vector_distancias <- matrix (1:9069543)
#lapply(vector_distancias, function(x) vector_distancias[x,1] <- matriz_distancias[ecobici$Ciclo_Estacion_Arribo[x],ecobici$Ciclo_Estacion_Retiro[x]])



#for(i in 1:totales)
#  ifelse(ecobici$Ciclo_Estacion_Arribo[i] !=1001  && ecobici$Ciclo_Estacion_Retiro[i] !=1001 && ecobici$Ciclo_Estacion_Arribo[i] !=1002  && ecobici$Ciclo_Estacion_Retiro[i] !=1002 ,ifelse(ecobici$Ciclo_Estacion_Arribo[i] == ecobici$Ciclo_Estacion_Retiro[i], vector_distancias[i] <- "0", vector_distancias[i] <- matriz_distancias[ecobici$Ciclo_Estacion_Arribo[i],ecobici$Ciclo_Estacion_Retiro[i]]),vector_distancias[i] <- "0" )


#vector_distancias
ecobici$Tiempo_Viaje <- as.double(ecobici$Tiempo_Viaje)

#ecobici_semana <- ecobici %>% filter(Dia_Semana_Retiro ==2 | Dia_Semana_Retiro ==3 | Dia_Semana_Retiro ==4 | Dia_Semana_Retiro ==5 | Dia_Semana_Retiro ==6)

#dim(ecobici_semana)[1]
ecobici_fin <- ecobici %>% filter(Dia_Semana_Retiro ==7 | Dia_Semana_Retiro ==1)


#dim(sin_festivos)[1]



#lunes <- count(ecobici %>% filter(Dia_Semana_Retiro =="2"))
#martes <-count(ecobici %>% filter(Dia_Semana_Retiro =="3"))
#miercoles <-  count(ecobici %>% filter(Dia_Semana_Retiro =="4"))
#jueves <-count(ecobici %>% filter(Dia_Semana_Retiro =="5"))
#viernes <-count(ecobici %>% filter(Dia_Semana_Retiro =="6"))
#sabado <-count(ecobici %>% filter(Dia_Semana_Retiro =="7"))
#domingo <-  count(ecobici %>% filter(Dia_Semana_Retiro =="1"))


#ecobici_martes <- ecobici %>% filter(Dia_Semana_Retiro ==3)
#ecobici_miercoles <- ecobici %>% filter(Dia_Semana_Retiro ==4)
#ecobici_jueves <- ecobici %>% filter(Dia_Semana_Retiro ==5)
#ecobici_viernes <- ecobici %>% filter(Dia_Semana_Retiro ==6)
#ecobici_sabado <- ecobici %>% filter(Dia_Semana_Retiro ==1)
#ecobici_domingo <- ecobici %>% filter(Dia_Semana_Retiro ==7)

ecobici_semana <- ecobici %>% filter(Dia_Semana_Arribo ==2 | Dia_Semana_Arribo ==3 | Dia_Semana_Arribo ==4 | Dia_Semana_Arribo ==5 )


#dim(ecobici_semana)[1]
#ecobici_fin <- ecobici %>% filter(Dia_Semana_Retiro ==7 | Dia_Semana_Retiro ==1)



ecobici_lunes <- ecobici %>% filter(Dia_Semana_Arribo ==2)

ecobici_martes <- ecobici %>% filter(Dia_Semana_Arribo ==3)


ecobici_miercoles <- ecobici %>% filter(Dia_Semana_Arribo ==4)
ecobici_jueves    <- ecobici %>% filter(Dia_Semana_Arribo ==5)
ecobici_viernes   <- ecobici %>% filter(Dia_Semana_Arribo ==6)
ecobici_sabado    <- ecobici %>% filter(Dia_Semana_Arribo ==7)

proporcion <- c(1,423,32)


ecobici_semana <- ecobici_semana %>% filter(Ciclo_Estacion_Retiro <= 452)
tamaño <- dim(ecobici_semana[1])

for (i in 1:452){
  proporcion[i] <- dim(ecobici_semana %>% filter(Ciclo_Estacion_Retiro == i))
}


write.csv(proporcion, file = "Proporcion_viajes_ret", row.names = FALSE)
