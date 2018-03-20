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
    
    static int [] estacion;
    static double [] latitud;
    static double [] longitud;
    static int [] candados;
    static int [] generadas;
    static int [] pareto;
    static final String SEPARATOR=",";
            
    public static void main(String[] args) {
        // TODO code application logic here
        
       BufferedReader br = null;
       try {
         br =new BufferedReader(new FileReader("C:\\Users\\acasillama\\Desktop\\Lab_Logistica\\Archivos de excel\\Datos_algoritm.csv"));
         String line = br.readLine();
         while (null!=line) {
             for (int i = 0; i < 452; i++) {
                String [] fields = line.split(SEPARATOR);
                //estacion[i]=Integer.parseInt(fields[0]); //estacion;
                /* e2=Integer.parseInt(fields[1]); //capacidad;
                e3=Integer.parseInt(fields[2]); //bicicletas;
                e4=Integer.parseInt(fields[3]); //latitud
                e5=Integer.parseInt(fields[4]); //longitud
                e6=Integer.parseInt(fields[5]); //tiempo a la misma estación
                e7=Integer.parseInt(fields[6]); //tiempo entre llegadas*/
                line = br.readLine();
             }
            
         }
         
      } catch (Exception e) {
         System.err.println("Error! "+e.getMessage());
      }
        
        
    }
    
}
