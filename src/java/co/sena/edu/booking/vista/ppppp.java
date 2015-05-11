
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
    ArrayList<personareservaDTO> misPersonas= new ArrayList();
    misPersonas= (ArrayList<personareservaDTO>) facadeP.listarReservasPersonas(1023010113);
    for(int i=0; i< misPersonas.size();i++){
        System.out.println(misPersonas.get(i).getIdReserva());   
    }
    } }