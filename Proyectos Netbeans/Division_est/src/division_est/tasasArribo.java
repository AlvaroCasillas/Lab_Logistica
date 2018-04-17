/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package division_est;

import static division_est.Division_est.SEPARATOR;
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
 * @author LabLogistica
 */
public class tasasArribo {
static int [] id=new int [452];
static int [] duplicados =new int [452];
static double [][] tasas=new double [452][234];
    /**
     * @param args the command line arguments
     */
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
    }
    
}
