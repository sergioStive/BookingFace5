
package co.sena.edu.booking.vista;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DTO.personasDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class ppppp {
    public static void main(String[] args)throws SQLException{
    personasDTO p = new personasDTO();
    personasDAO pe = new personasDAO();
    ArrayList<personasDTO> misPersonas= new ArrayList();
    misPersonas= (ArrayList<personasDTO>) pe.listarTodasPersonas(1030623472);
    for(int i=0; i< misPersonas.size();i++){
        System.out.println(misPersonas.get(i).getCiu().getCiudad());   
    }
    } }