
package co.sena.edu.booking.vista;

import Controlador.FacadePersonas;
import co.sena.edu.booking.DAO.personareservaDAO;
import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DTO.personareservaDTO;
import co.sena.edu.booking.DTO.personasDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class ppppp {
    public static void main(String[] args)throws SQLException{
    personareservaDTO p = new personareservaDTO();
    personareservaDAO pe = new personareservaDAO();
    FacadePersonas facadeP = new FacadePersonas();
    int yi = facadeP.contarRegistrosReservas(45);
        System.out.println(yi);
         ArrayList<personareservaDTO> misReservas = new ArrayList();      
     misReservas= (ArrayList<personareservaDTO>) facadeP.listarAcompañantes(45);
      for (personareservaDTO e : misReservas) {
                    System.out.println("\n" + e);
                }
    } 
    
      
}