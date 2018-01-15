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

vector_horas <- c("05:00:00", "05:05:00", "05:10:00", "05:15:00", "05:20:00", "05:25:00","05:30:00","05:35:00", "05:40:00", "05:45:00", "05:50:00","05:55:00","06:00:00","06:05:00", "06:10:00","06:15:00", "06:20:00", "06:25:00","06:30:00","06:35:00", "06:40:00", "06:45:00", "06:50:00","06:55:00", "07:00:00","07:05:00", "07:10:00","07:15:00", "07:20:00", "07:25:00","07:30:00","07:35:00", "07:40:00", "07:45:00", "07:50:00","07:55:00", "08:00:00","08:05:00", "08:10:00","08:15:00", "08:20:00", "08:25:00","08:30:00","08:35:00", "08:40:00", "08:45:00", "08:50:00","08:55:00", "09:00:00","09:05:00", "09:10:00","09:15:00", "09:20:00", "09:25:00","09:30:00","09:35:00", "09:40:00", "09:45:00", "09:50:00","09:55:00", "10:00:00","10:05:00", "10:10:00","10:15:00", "10:20:00", "10:25:00","10:30:00","10:35:00", "10:40:00", "10:45:00", "10:50:00","10:55:00", "11:00:00", "11:05:00", "11:10:00","11:15:00", "11:20:00", "11:25:00","11:30:00","11:35:00", "11:40:00", "11:45:00", "11:50:00","11:55:00", "12:00:00","12:05:00", "12:10:00","12:15:00", "12:20:00", "12:25:00","12:30:00","12:35:00", "12:40:00", "12:45:00", "12:50:00","12:55:00", "13:00:00","13:05:00", "13:10:00","13:15:00", "13:20:00", "13:25:00","13:30:00","13:35:00", "13:40:00", "13:45:00", "13:50:00","13:55:00", "14:00:00","14:05:00", "14:10:00","14:15:00", "14:20:00", "14:25:00","14:30:00","14:35:00", "14:40:00", "14:45:00", "14:50:00","14:55:00", "15:00:00","15:05:00", "15:10:00","15:15:00", "15:20:00", "15:25:00","15:30:00","15:35:00", "15:40:00", "15:45:00", "15:50:00","15:55:00", "16:00:00","16:05:00", "16:10:00","16:15:00", "16:20:00", "16:25:00","16:30:00","16:35:00", "16:40:00", "16:45:00", "16:50:00","16:55:00", "17:00:00","17:05:00", "17:10:00","17:15:00", "17:20:00", "17:25:00","17:30:00","17:35:00", "17:40:00", "17:45:00", "17:50:00","17:55:00", "18:00:00","18:05:00", "18:10:00","18:15:00", "18:20:00", "18:25:00","18:30:00","18:35:00", "18:40:00", "18:45:00", "18:50:00","18:55:00", "19:00:00","19:05:00", "19:10:00","19:15:00", "19:20:00", "19:25:00","19:30:00","19:35:00", "19:40:00", "19:45:00", "19:50:00","19:55:00", "20:00:00","20:05:00", "20:10:00","20:15:00", "20:20:00", "20:25:00","20:30:00","20:35:00", "20:40:00", "20:45:00", "20:50:00","20:55:00", "21:00:00","21:05:00", "21:10:00","21:15:00", "21:20:00", "21:25:00","21:30:00","21:35:00", "21:40:00", "21:45:00", "21:50:00","21:55:00", "22:00:00","22:05:00", "22:10:00","22:15:00", "22:20:00", "22:25:00","22:30:00","22:35:00", "22:40:00", "22:45:00", "22:50:00","22:55:00", "23:00:00","23:05:00", "23:10:00","23:15:00", "23:20:00", "23:25:00","23:30:00","23:35:00", "23:40:00", "23:45:00", "23:50:00","23:55:00", "23:59:59")

vector_madrugada <- c("00:00:00","00:05:00","00:10:00","00:15:00","00:20:00","00:25:00","00:30:00")
#length(vector_lunes_horas)
viajes_estacion <- c()
for (j in 1:452) {
  vector_lunes <- c()
  lunes   <- ecobici_semana %>% filter(Ciclo_Estacion_Arribo == j)
  martes  <- ecobici_viernes %>% filter(Ciclo_Estacion_Arribo == j)
  
  for (i in 1:(length(vector_horas)-1)) {
    vector_lunes[i] <- dim(lunes %>% filter( Hora_Arribo > as.hms(vector_horas[i]) & Hora_Arribo <= as.hms(vector_horas[i+1])))[1]
  }
  
  
  vector_madrugada_lunes <- c()
  for (i in 1:(length(vector_madrugada)-1)) {
    vector_madrugada_lunes[i] <- dim(martes %>% filter( Hora_Arribo > as.hms(vector_madrugada[i]) & Hora_Arribo <= as.hms(vector_madrugada[i+1])))[1]
  }
  
  viajes_tot1 <- c(vector_lunes,vector_madrugada_lunes)
  viajes_estacion <-cbind2(viajes_estacion,viajes_tot1)
  viajes_tot1 <- c()
}
viajes_estacion <-as.data.frame(viajes_estacion) 
