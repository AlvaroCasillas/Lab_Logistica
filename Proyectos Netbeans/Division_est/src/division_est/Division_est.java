/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package division_est;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.io.FileWriter;
/**
 *
 * @author acasillama
 */
public class Division_est {

    /**
     * @param args the command line arguments
     */
    
    static int [] estacion = new int[452];
    static double [] latitud = new double[452];
    static double [] longitud = new double[452];
    static int [] candados = new int[452];
    static int [] generadas = new int[452];
    static int [] pareto = new int[452];
    static final String SEPARATOR=",";
    static double [][] matriz_dist = new double [452][452];
    static int [] cercana = new int [452];
    FileWriter writer = null;
    
    public static String calc(int indice, int indice2){
        if (matriz_dist[indice][indice2]<0.5) {
            if (latitud[indice2]<latitud[indice]) {
                if (latitud[indice2]-latitud[indice]< longitud [indice2]-longitud[indice]) {
                    if (longitud [indice2]<longitud[indice]) {
                        return "izq";
                    }
                    else
                        return "der";

                }
                else{
                    return "abajo";
                }
            }
            else{
               if (latitud[indice2]-latitud[indice]< longitud [indice2]-longitud[indice]) {
                    if (longitud [indice2]<longitud[indice]) {
                        return "izq";
                    }
                    else
                        return "der";

                }
                else{
                    return "arriba";
                } 
            }
        }

       return "cualquiera";
       
    }
    
    public static double distancia(int or, int dest){
        return (Math.acos(Math.sin(latitud[or]*Math.PI/180)*Math.sin(latitud[dest]*Math.PI/180)+Math.cos(latitud[or]*Math.PI/180)*Math.cos(latitud[dest]*Math.PI/180)*Math.cos((longitud[dest]*Math.PI/180)-(longitud[or]*Math.PI/180)))*6371);
    }
    public static void main(String[] args) {
        // TODO code application logic here
        
       
       
       BufferedReader br = null;
       try {
         br =new BufferedReader(new FileReader("C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Datos_algoritm.csv"));
         String line = br.readLine();
         while (null!=line) {
             for (int i = 0; i < 452; i++) {
                String [] fields = line.split(SEPARATOR);
                estacion[i]=Integer.parseInt(fields[0]); //estacion;
                longitud [i]=Double.parseDouble(fields[1]); //longitud;
                latitud [i]=Double.parseDouble(fields[2]); //latitud;
                candados[i]=Integer.parseInt(fields[3]); //número de candados
                generadas[i]=Integer.parseInt(fields[4]); //si era original (1 es original, 2 es nueva)
                pareto[i]=Integer.parseInt(fields[5]); //Si está dentro de las que cubren el 75% de los viajes es 1, 2 si no está ahí dentro
                line = br.readLine();
             }
            
         }
         
      } catch (Exception e) {
         System.err.println("Error! "+e.getMessage());
      }
       
        for (int i = 0; i < 452; i++) {
            for (int j = 0; j < 452; j++) {
                if (i!=j) {
                    matriz_dist[i][j]= distancia(i,j);
                }
                else{
                    matriz_dist[i][j]=0;
                }
                
            }
        }
        double [] nuevas_lat = new double [4050];
        double [] nuevas_long = new double [4050];
        int l=0;
        for (int i = 0; i < 452; i++) {
            for (int j = 0; j < (candados[i]/3)-1; j++) {
                Random r = new Random();
                double randomValue1 = .0006 + (.0012 - .0006) * r.nextDouble();
                double randomValue2 = .0006 + (.0012 - .0006) * r.nextDouble();
                nuevas_lat[l]=latitud[i]+randomValue1;
                nuevas_long[l]=longitud[i]+randomValue2;
                l++;
            }
            
        }
        
        String csv2= "C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Nuevas.csv";
        FileWriter w = null;
        
        try{
                w = new FileWriter(csv2);
                for (int m = 0; m < nuevas_lat.length; m++)
                        w.append(""+nuevas_lat[m]).append("\n");
            } catch (Exception e) {
               System.err.println("Error! "+e.getMessage());
            } finally {
               if (null!=w){
                  try {
                     w.flush();
                  } catch (IOException e) {
                     System.err.println("Error flushing file !! "+e.getMessage());
                  }
                  try {
                     w.close();
                  } catch (IOException e) {
                     System.err.println("Error closing file !! "+e.getMessage());
                  }
               }
            }
        
        String csv3= "C:\\Users\\lablogistica\\Documents\\Laboratorio\\Lab_Logistica\\Archivos de excel\\Nuevas_long.csv";
        FileWriter w2 = null;
        
        try{
                w2 = new FileWriter(csv3);
                for (int m = 0; m < nuevas_lat.length; m++)
                        w2.append(""+nuevas_long[m]).append("\n");
            } catch (Exception e) {
               System.err.println("Error! "+e.getMessage());
            } finally {
               if (null!=w){
                  try {
                     w2.flush();
                  } catch (IOException e) {
                     System.err.println("Error flushing file !! "+e.getMessage());
                  }
                  try {
                     w2.close();
                  } catch (IOException e) {
                     System.err.println("Error closing file !! "+e.getMessage());
                  }
               }
            }
    }
    
}
