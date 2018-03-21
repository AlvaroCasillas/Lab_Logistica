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
                generadas[i]=Integer.parseInt(fields[4]); //si se generó de divisiones (1 es original, 2 es nueva)
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
                    matriz_dist[i][j]=(Math.acos(Math.sin(latitud[i]*Math.PI/180)*Math.sin(latitud[j]*Math.PI/180)+Math.cos(latitud[i]*Math.PI/180)*Math.cos(latitud[j]*Math.PI/180)*Math.cos((longitud[j]*Math.PI/180)-(longitud[i]*Math.PI/180)))*6371);
                }
                else{
                    matriz_dist[i][j]=0;
                }
                
            }
        }
        
        int index =0;
        int indices_cerc [][]=new int [452][];
        for (int i = 0; i < 452; i++) {
            int [] radio =new int [20];
            for (int j = 0; j < 452; j++) {
                if (matriz_dist[i][j]>0 && matriz_dist[i][j]<=.3) {
                    radio[index] =j;
                    index++;
                }
            }
            index=0;
            indices_cerc[i]=radio;
            for (int j = 0; j < (candados[i]/3); j++) {
                
            }
            
        }
        
        
    }
    
}
