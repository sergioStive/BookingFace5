/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;
// private Connection cnn = null;

import co.sena.edu.booking.DTO.personareservaDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class personareservaDAO {

    private PreparedStatement pstm;
    ResultSet rs = null;

    String mgSalida; // almacena el msg de salida al usuario
    int ciu; // almacena el resultado de la ejecución en la BD

    // public ciudadesDAO() {
    //cnn = Conexion.getConnection();
    //cnn = Conexion.getConnection();
    //}
    public String creaReser(personareservaDTO reseper, Connection cnn) throws SQLException {
        String salida = "";
        try {

            int resultado = 0;
            pstm = cnn.prepareStatement("INSERT INTO reservaporpersona VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);");
            pstm.setInt(1, reseper.getIdreservaPorPersona());
            pstm.setString(2, reseper.getNombres());
            pstm.setString(3, reseper.getApellidos());
            pstm.setString(4, reseper.getTelefono());
            pstm.setLong(5, reseper.getIdPersona());
            pstm.setInt(6, reseper.getIdReserva());
            pstm.setString(7, reseper.getNacionalidad());
            pstm.setString(8, reseper.getFechaNaci());

            resultado = pstm.executeUpdate();

            if (resultado != 0) {
                salida = "La reserva ha sido registrada exitosamente. " + resultado + "filas afectadas";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            salida = "Ocurrió la siguiente exception : " + sqle.getMessage();
        } finally {
            try {
                pstm.close();
            } catch (SQLException ex) {
                Logger.getLogger(personareservaDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return salida;

    }

    public List<personareservaDTO> listarReservasPersonas(long p,int idReserva, Connection cnn) throws SQLException {
        ArrayList<personareservaDTO> listarReservas = new ArrayList();

        try {
            String query = "select p.idPersona, r.idReserva from reservas r\n"
                    + "inner join personas p\n"
                    + "on r.idpersona=p.idpersona where p.idPersona=? and r.idReserva = ?";
            pstm = cnn.prepareStatement(query);
            pstm.setLong(1, p);
            pstm.setInt(2, idReserva);
            rs = pstm.executeQuery();

            while (rs.next()) {
                personareservaDTO Rdao = new personareservaDTO();
                reserDTO r = new reserDTO();
                personasDTO pe = new personasDTO();
                r.setIdReserva(rs.getInt("idReserva"));
                pe.setIdPersona(rs.getLong("idPersona"));
                Rdao.setPer(pe);
                Rdao.setRe(r);
                listarReservas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarReservas;
    }

    public int obtenerUltimaReserva(long p, Connection cnn) throws SQLException {        
        int idReserva = 0;
        try {
            String query = "select p.idPersona, r.idReserva from reservas r \n"
                    + "inner join personas p\n"
                    + "on r.idpersona=p.idpersona where p.idPersona= ? order by r.idReserva desc limit 1;";
            pstm = cnn.prepareStatement(query);
            pstm.setLong(1, p);
            rs = pstm.executeQuery();

            while (rs.next()) {
                personareservaDTO Rdao = new personareservaDTO();
                idReserva = rs.getInt("idReserva");

                

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return idReserva;
    }
}
