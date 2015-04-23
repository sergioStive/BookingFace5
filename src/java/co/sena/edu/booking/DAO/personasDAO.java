


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DAO;

import cao.sena.edu.booking.util.Conexion;
import cao.sena.edu.booking.util.reserConex;
import co.sena.edu.booking.DTO.ciudadesDTO;
import co.sena.edu.booking.DTO.empresatransportesDTO;
import co.sena.edu.booking.DTO.listarPerDTO;
import co.sena.edu.booking.DTO.listarPersonasDTO;
import co.sena.edu.booking.DTO.nacionalidadesDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import co.sena.edu.booking.DTO.serviciosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fabian
 */
public class personasDAO {

    private Connection cnn = null;
    private PreparedStatement pstmt;
    ResultSet rs = null;
    String msgSalida;
    int per;
        String sqlTemp = "";


    public personasDAO() {
        //cnn = Conexion.getConnection();
     cnn = reserConex.getInstance();

    }

    public String actualizarRegistro(personasDTO personas) {
        try {

            pstmt = cnn.prepareStatement("UPDATE personas SET correoElectronico=?,idCiudad=?,"
                    + "idNacionalidad=?,nombres=?,apellidos=?,fechaNto=?,telefono=?,observaciones=? WHERE idPersona=?");

            pstmt.setString(1, personas.getCorreoElectronico());
            pstmt.setInt(2, personas.getIdCiudad());
            pstmt.setInt(3, personas.getIdNacionalidad());
            pstmt.setString(4, personas.getNombres());
            pstmt.setString(5, personas.getApellidos());
            pstmt.setString(6, personas.getFechaNto());
            pstmt.setInt(7, personas.getTelefono());
//          pstmt.setString(8, personas.getContraseña());
//          pstmt.setInt(9, personas.getIdestadousuarios());
            pstmt.setString(8, personas.getObservaciones());
            pstmt.setLong(9, personas.getIdPersona());
            
            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "Sus datos se modificaron";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

    }

    public String crearPersona(personasDTO newPersona) throws SQLException {
        //String salida = "";
        try {

            int resultado = 0;
            pstmt = cnn.prepareStatement("INSERT INTO personas VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?)");
            pstmt.setLong(1, newPersona.getIdPersona());
            pstmt.setString(2, newPersona.getCorreoElectronico());
            pstmt.setInt(3, newPersona.getIdCiudad());
            pstmt.setInt(4, newPersona.getIdNacionalidad());
            pstmt.setString(5, newPersona.getNombres());
            pstmt.setString(6, newPersona.getApellidos());
            pstmt.setString(7, newPersona.getFechaNto());
            pstmt.setInt(8, newPersona.getTelefono());
            pstmt.setString(9, newPersona.getContraseña());
            pstmt.setInt(10, newPersona.getIdestadousuarios());
            pstmt.setString(11, newPersona.getObservaciones());
            pstmt.setInt(12, newPersona.getSexo());
            pstmt.setInt(13, newPersona.getActivarCorreo());
           
            
            resultado = pstmt.executeUpdate();

            if (resultado != 0) {
               msgSalida = "El usuario a sido registrado exitosamente. ";
            } else {
                // salida = "Ha ocurrido un problema al crear el profesor. Contacte al administrador";

            }
        } catch (SQLException sqle) {
            msgSalida = "Ocurrió la siguiente exception popo : " + sqle.getMessage();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(personasDAO.class.getName()).log(Level.SEVERE, null, ex); // se deja por defecto en este caso
            }
        }

        return msgSalida;

    }

   
    public List<personasDTO> getAll() throws SQLException {
        LinkedList<personasDTO> listaPersonas = new LinkedList<personasDTO>();
        try {

            String query = "SELECT  idPersona, correoElectronico, idCiudad, idNacionalidad, nombres, apellidos, fechaNto, telefono, contraseña, idestadousuarios, observaciones "
                    + " FROM personas ";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                personasDTO newPersona = new personasDTO();
                newPersona.setIdPersona(rs.getLong("idPersona"));
                newPersona.setCorreoElectronico(rs.getString("correoElectronico"));
                newPersona.setIdCiudad(rs.getInt("idCiudad"));
                newPersona.setIdNacionalidad(rs.getInt("idNacionalidad"));
                newPersona.setNombres(rs.getString("nombres"));
                newPersona.setApellidos(rs.getString("apellidos"));
                newPersona.setFechaNto(rs.getString("fechaNto"));
                newPersona.setTelefono(rs.getInt("telefono"));
                newPersona.setContraseña(rs.getString("contraseña"));
                newPersona.setIdestadousuarios(rs.getInt("idestadousuarios"));
                newPersona.setObservaciones(rs.getString("observaciones"));
                listaPersonas.add(newPersona);
            }
        } catch (SQLException ex) {
            msgSalida = "a ocurrido un error" + ex.getMessage();
        } finally {
            pstmt.close();
        }

        return listaPersonas;
    }

    public personasDTO ListarUnaPersona(Long cedula) throws SQLException {
        personasDTO Rdao = null;
        try {
            pstmt = cnn.prepareStatement("select idPersona, correoElectronico, idCiudad, idNacionalidad, "
                    + " nombres, apellidos, fechaNto, telefono, contraseña, idestadousuarios, observaciones from personas where idPersona=?;");
            pstmt.setLong(1, cedula);
            pstmt.executeQuery();

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Rdao = new personasDTO();
                Rdao.setIdPersona(rs.getLong("idPersona"));
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setIdCiudad(rs.getInt("idCiudad"));
                Rdao.setIdNacionalidad(rs.getInt("idNacionalidad"));
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos"));
                Rdao.setFechaNto(rs.getString("fechaNto"));
                Rdao.setTelefono(rs.getInt("telefono"));
                Rdao.setContraseña(rs.getString("contraseña"));
                Rdao.setIdestadousuarios(rs.getInt("idestadousuarios"));
                Rdao.setObservaciones(rs.getString("observaciones"));
            }
        } catch (SQLException ex) {
            msgSalida = "Error " + ex.getMessage() + "Codigo de error" + ex.getErrorCode();
        }
        return Rdao;
    }

    public List<personasDTO> listarPersonas() throws SQLException {
        ArrayList<personasDTO> listarPersonas = new ArrayList();

        try {
            String query = "select idPersona, correoElectronico, idCiudad, idNacionalidad, "
                    + " nombres, apellidos, fechaNto, telefono, contraseña, idestadousuarios, observaciones from personas";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                personasDTO Rdao = new personasDTO();
                Rdao.setIdPersona(rs.getLong("idPersona"));
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setIdCiudad(rs.getInt("idCiudad"));
                Rdao.setIdNacionalidad(rs.getInt("idNacionalidad"));
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos"));
                Rdao.setFechaNto(rs.getString("fechaNto"));
                Rdao.setTelefono(rs.getInt("telefono"));
                Rdao.setContraseña(rs.getString("contraseña"));
                Rdao.setIdestadousuarios(rs.getInt("idestadousuarios"));
                Rdao.setObservaciones(rs.getString("observaciones"));
                listarPersonas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarPersonas;
    }
    
      public List<personasDTO> Paginacion(int pg , int limited) throws SQLException {
        ArrayList<personasDTO> Paginacion = new ArrayList();

        try {
            
            pstmt = cnn.prepareStatement("select p.idPersona,p.nombres,p.apellidos,c.ciudad,n.nacionalidad,p.telefono,p.correoElectronico from personas p \n" +
"inner join ciudades c on p.idCiudad = c.idCiudad\n" +
"inner join nacionalidades n on p.idNacionalidad= n.idNacionalidad where p.idestadousuarios='1' order by Nombres asc limit "+(pg-1)*limited+","+limited+";");
            rs = pstmt.executeQuery();

            while (rs.next()) {
               personasDTO Rdao = new personasDTO(); 
               nacionalidadesDTO nac = new nacionalidadesDTO();
               ciudadesDTO ciudad = new ciudadesDTO();
               Rdao.setIdPersona(rs.getLong("idPersona"));
               Rdao.setNombres(rs.getString("nombres"));
               Rdao.setApellidos(rs.getString("apellidos"));              
               ciudad.setCiudad(rs.getString("ciudad"));             
               nac.setNacionalidad(rs.getString("nacionalidad"));              
               Rdao.setTelefono(rs.getInt("telefono"));
               Rdao.setCorreoElectronico(rs.getString("correoElectronico")); 
               Rdao.setCiu(ciudad);
               Rdao.setNac(nac);               
               Paginacion.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return Paginacion;
    }

    public String eliminar(Long idPersona) {
        try {
            /*
             * Para el ejemplo ilustativo se ha utilizado unicamente actualizar el nombre
             * Sin embargo, en las lineas comentadas se ilustra el codigo completo para actualizar todos los campos
             *
             */
            pstmt = cnn.prepareStatement("DELETE FROM Personas WHERE idPersona = ?; ");
            pstmt.setLong(1, idPersona);

            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "El usuario ha sido eliminado";
            } else {
                msgSalida = "NO se pudo eliminar  el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();
//        } finally {
//            try {
//                if (pstmt != null) {
//                    pstmt.close();
//                }
//                if (cnn != null) {
//                    cnn.close();
//                }
//            } catch (SQLException ex) {
//                msgSalida = "error al cerrar la conexion " + ex.getMessage();
//            }
        }

        return msgSalida;
    }
 public String actualizarContraseña(personasDTO personas) {
        try {

            pstmt = cnn.prepareStatement("UPDATE personas SET contraseña=? WHERE idPersona=?");
            pstmt.setString(1, personas.getContraseña());
            pstmt.setLong(2, personas.getIdPersona());

            per = pstmt.executeUpdate();
            if (per > 0) {
                msgSalida = "Se modifico su clave";
            } else {
                msgSalida = "NO se pudo actualizar el registro";
            }
        } catch (SQLException ex) {
            msgSalida = "Error al ejecutar la operación : " + ex.getSQLState() + " " + ex.getMessage();

        }
        return msgSalida;

    }
public long isAcountExists(String contraseña, Long idPersona) throws SQLException {
       
       long y = 1;
       
       try {

           personasDTO pde = new personasDTO();
           
        
           
           String sql = "select idPersona,contraseña from personas where idPersona = ? and contraseña = ?";        
           pstmt = cnn.prepareStatement(sql);           
           pstmt.setLong(1, idPersona);
           pstmt.setString(2, contraseña);
           rs = pstmt.executeQuery();
           
          
           if (rs != null) {
               
               while (rs.next()) {

                   pde.setIdPersona(rs.getLong("idPersona"));
                   pde.setContraseña(rs.getString("contraseña"));
                 }
               y = pde.getIdPersona();
           }
           else {
               y = 0;
           }
       
       
       } catch (SQLException ex) {

          
           
           
       }
return y;
   }
public String getHTMLAll(String Id) throws SQLException {
     String HTMLTipos = "<option value='0' "+ (Id.equals("0") ? "selected":"") +" > Seleccione Cliente </option>";   
     try {

            String query = "select idPersona as Id, concat(nombres ,'  ', apellidos )  as cliente " +" from personas" ;
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                String idRes = rs.getString("id");
                HTMLTipos =HTMLTipos + " <option value='"+rs.getString("id")+"' "+ (Id.equals(idRes) ? "selected":"") +" >"+ rs.getString("cliente") +"</option>";
            }
        } catch (SQLException ex) {
           msgSalida="a ocurrido un error" +ex.getMessage();
        }finally{
            pstmt.close();
        }
        return   HTMLTipos;
}
public int contarRegistros(){
        int registros = 0;
        try{
            pstmt=cnn.prepareStatement("SELECT * FROM personas where idestadousuarios='1';");
            rs = pstmt.executeQuery();
            
            if (rs!=null) {
                while(rs.next()){
                registros++;
            }
            return registros;
            }
              
            
        }catch(SQLException sqle){
            msgSalida = sqle.getMessage();
        }
        return registros;
    }

public String EnviarCorreo(String correo) {
        String clave = "";
        try {

            pstmt = cnn.prepareStatement("select contraseña as clave from personas where correoElectronico = ?");
            
            pstmt.setString(1, correo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                clave = rs.getString("clave");
            }
        } catch (SQLException sqle) {
           sqle.printStackTrace();
        }
       
        return  clave;
}
public List<listarPersonasDTO> contarPersonas(String  nacionalidad, String nombres) {
        ArrayList<listarPersonasDTO> productos = new ArrayList();
        try {
            StringBuilder sb = new StringBuilder("select p.nombres, p.apellidos, c.nacionalidad "
                    + "from personas p inner join nacionalidades c on p.idNacionalidad = c.idNacionalidad ");

            if (nacionalidad != null) {
                sb.append("AND c.nacionalidad LIKE '").append(nacionalidad).append("%'");
            }
            if (nombres!= null) {
                sb.append("AND p.nombres LIKE '").append(nombres).append("%'");
            }

            sb.append("order by nacionalidad desc limit 0,10");
            pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    listarPersonasDTO producto = new listarPersonasDTO();
                    producto.setNombres(rs.getString("nombres"));
                    producto.setApellidos(rs.getString("apellidos"));
                    producto.setNacionalidad(rs.getString("nacionalidad"));
                    productos.add(producto);
                }
            }
        } catch (SQLException ex) {

        }
        return productos;
    }
public List<listarPerDTO> filtroPersonas(String nacionalidad, String nombres, String ciudad ) throws SQLException{
        ArrayList<listarPerDTO> filtroPersonas = new ArrayList();

        try {
         StringBuilder sb = new StringBuilder("select p.nombres, p.apellidos, p.correoElectronico, a.Ciudad, c.nacionalidad,c.idioma "
                    + "from personas p inner join "
                    + "nacionalidades c on p.idNacionalidad = c.idNacionalidad "
                    + "inner join ciudades a on p.idCiudad = a.idCiudad where 1=1 ");

            if (nacionalidad != null) {
                sb.append("AND c.nacionalidad LIKE '").append(nacionalidad).append("%'");
            }
            if (nombres!= null) {
                sb.append("AND p.nombres LIKE '").append(nombres).append("%'");
            }
            
            if (ciudad != null) {
                sb.append("AND a.Ciudad LIKE '").append(ciudad).append("%'");
            }
         
         
         
         pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                listarPerDTO Rdao = new listarPerDTO();
                
                
                Rdao.setNombres(rs.getString("nombres"));
                Rdao.setApellidos(rs.getString("apellidos")); 
                Rdao.setCorreoElectronico(rs.getString("correoElectronico"));
                Rdao.setCiudad(rs.getString("Ciudad"));
                Rdao.setNacionalidad(rs.getString("nacionalidad"));
                Rdao.setIdioma(rs.getString("idioma"));
                filtroPersonas.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return filtroPersonas;
    }
public int contarNumerosdeRegistros(){
        int registros = 0;
        try{
            pstmt=cnn.prepareStatement("select p.nombres, p.apellidos, p.correoElectronico, "
                    + "a.Ciudad, c.nacionalidad,c.idioma from personas p inner join nacionalidades c on "
                    + "p.idNacionalidad = c.idNacionalidad inner join ciudades a on p.idCiudad = a.idCiudad;");
            rs = pstmt.executeQuery();
            
            if (rs!=null) {
                while(rs.next()){
                registros++;
            }
            return registros;
            }
              
            
        }catch(SQLException sqle){
            msgSalida = sqle.getMessage();
        }
        return registros;
    }

public List<listarPerDTO> Paginacion2(int pg , int limited) throws SQLException {
        ArrayList<listarPerDTO> Paginacion2 = new ArrayList();

        try {
            
            pstmt = cnn.prepareStatement("select p.nombres, p.apellidos, p.correoElectronico, "
                    + "a.Ciudad, c.nacionalidad,c.idioma from personas p inner join "
                    + "nacionalidades c on p.idNacionalidad = c.idNacionalidad "
                    + "inner join ciudades a on p.idCiudad = a.idCiudad limit "+(pg-1)*limited+","+limited+";");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                listarPerDTO Rdao = new listarPerDTO();
                Rdao.setNombres(rs.getString("idPersona"));
                Rdao.setApellidos(rs.getString("correoElectronico"));
                Rdao.setCorreoElectronico(rs.getString("idCiudad"));
                Rdao.setNacionalidad(rs.getString("idNacionalidad"));
                Rdao.setIdioma(rs.getString("nombres"));
                Paginacion2.add(Rdao);

            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return Paginacion2;
    }
    public List<String> obtenerCorreoPorId() throws SQLException{
         ArrayList<String> listarcorreos = new ArrayList();        
        try {
            String query = "SELECT correoElectronico FROM personas;";
            pstmt = cnn.prepareStatement(query);          
            rs = pstmt.executeQuery();

               while (rs.next()) {              
               String correo= new String(rs.getString("correoElectronico")); 
               listarcorreos.add(correo);
               }
        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarcorreos;    
    
    }
  public List<personasDTO> listarTodasPersonas(long cedula) throws SQLException {
        ArrayList<personasDTO> listarPersonas = new ArrayList();

        try {
            String query = "select p.idPersona,p.nombres,p.apellidos,c.ciudad,n.nacionalidad,p.telefono,p.correoElectronico from personas p \n" +
"inner join ciudades c on p.idCiudad = c.idCiudad\n" +
"inner join nacionalidades n on p.idNacionalidad= n.idNacionalidad where p.idestadousuarios='1';";
            pstmt = cnn.prepareStatement(query);
            pstmt.setLong(1, cedula);
            rs = pstmt.executeQuery();

               while (rs.next()) {
               personasDTO Rdao = new personasDTO(); 
               nacionalidadesDTO nac = new nacionalidadesDTO();
               ciudadesDTO ciudad = new ciudadesDTO();
               Rdao.setIdPersona(rs.getLong("idPersona"));
               Rdao.setNombres(rs.getString("nombres"));
               Rdao.setApellidos(rs.getString("apellidos"));              
               ciudad.setCiudad(rs.getString("ciudad"));             
               nac.setNacionalidad(rs.getString("nacionalidad"));              
               Rdao.setTelefono(rs.getInt("telefono"));
               Rdao.setCorreoElectronico(rs.getString("correoElectronico")); 
               Rdao.setCiu(ciudad);
               Rdao.setNac(nac);
               listarPersonas.add(Rdao);
            }

        } catch (SQLException slqE) {
            System.out.println("Ocurrio un error" + slqE.getMessage());
        } finally {

        }
        return listarPersonas;
    }
}
