<%@page import="co.sena.edu.booking.DAO.personareservaDAO"%>
<%@page import="co.sena.edu.booking.DTO.personareservaDTO"%>
<%@page import="co.sena.edu.booking.DTO.empresatransportesDTO"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DTO.nacionalidadesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.nacionalidadesDAO"%>
<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
	<script  src="jquery/jquery.js"></script>
	<script src="jquery/jquery.validate.js"></script>
	<script src="jquery/additional-methods.js"></script>
        <script src="scripts/reserPersona.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>   
        <link rel="shortcut icon" href="img/br.ico" />
<script type="text/javascript">
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 4000); 
});
</script>
<meta charset="utf-8">
<link rel="shortcut icon" href="img/br.ico" />
<title>..::Booking Routers::..</title>
</head>
<body>
      <style type="text/css">
    .info, .exito, .alerta, .error {
       font-family:Arial, Helvetica, sans-serif; 
       font-size:13px;
       border: 1px solid;
       margin: 10px 0px;
       padding:15px 10px 15px 50px;
       background-repeat: no-repeat;
       background-position: 10px center;
}
.info {
       color: #00529B;
       background-color: #BDE5F8;
       background-image: url('img/alerta.png');
}
.exito {
       color: #4F8A10;
       background-color: #DFF2BF;
       background-image: url('img/exito.png');
       width: 1050px;
}
.alerta {
       color: #9F6000;
       background-color: #FEEFB3;
       background-image: url('img/alerta.png');
}
.error{
       color: #D8000C;
       background-color: #FFBABA;
       background-image: url('img/error.png');
}
</style>
<div class ="contenedor">
<div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav> 
<ul id="main">
    <li><div align="center"><a href="index1.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> initiation</a></li>
            <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Bookings</a>
                            <ul class="submain">
                                <li><a href="CancelarR1.jsp" style="text-decoration: none;">Cancel Reservation</a></li>
                                <li><a href="ModificarReservas1.jsp" style="text-decoration: none;">modify Booking</a> </li>
                                </ul>
                        </li>
                        <li><div align="center"><a href="menuCliente1.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a>
                        
        </ul>
    </nav> 
    <center>
               <table>
                   <tr>
                <td colspan="2">
                    <% if (request.getParameter("msgSalida") != null) {%>
                    <% if (!request.getParameter("msgSalida").equals("")) {%> 
                    <div class="alert exito mensajes" role="alert">
                        <%= request.getParameter("msgSalida")%>
                    </div>
                    <%}%>
                    <%}%> 
                </td>
                   </tr>
               </table>
         </center>
    <%
            HttpSession misesion = request.getSession(false);

            if (misesion.getAttribute("logueado") != null) {
                personasDTO pdto = null;                
                
                personareservaDTO per = new personareservaDTO();                
                FacadePersonas facadeP = new FacadePersonas();
                personasDAO pdao = new personasDAO();
                pdto =(personasDTO) misesion.getAttribute("logueado");
                ArrayList<personareservaDTO> p = new ArrayList();
                p= (ArrayList)facadeP.listarReservasPersonas(pdto.getIdPersona(),Integer.parseInt(request.getParameter("idReserva")));
          
                pdto = facadeP.ListarUnaPersona(pdto.getIdPersona());
                for(personareservaDTO prv : p){
    
                         
                
        %>
       
<div class="ba">
    <center> <h1>Add Person to reserve</h1></center>
</div>
<br>
 <center>
    <%
                        if(request.getParameter("noo") != null) {
                        %>
                        <div>
                            <div class="alert alert-danger mensajes" role="alert"><b>You have reached the maximum quota.</b>
                      </div>
                        <%
                         }
                        %>  
                        </center>
<div class="col2" style="border:#AB9C9D solid; border-radius:15px; box-shadow: 2px  3px 3px#332727">  
    
 <form name="add" id="add" role="form" action="registroReservas">
<table width="744" align="center" id="registro">
     <tr>
    <td><label for="registro" class="labele">Reservation number</label><br></td>
    <td><input name="registro" type="text" id="registro" style="width:250px; height:25px" value="<%=prv.getRe().getIdReserva()%>" readonly="readonly" class="form-control" required/></td>
   </tr>
     <tr>
    <td><label for="doc" class="labele">Associated Registration Number</label><br></td>
    <td><input name="doc" type="text" id="doc" style="width:250px; height:25px" value="<%=prv.getPer().getIdPersona()%>" readonly="readonly" class="form-control" required/></td>
      
    <td><label for="tel" class="labele">phone</label><br></td>
    <td><input type="text" id="tel" name="tel" style="width:250px; height:25px" class="form-control" required onChange="requisitos(tel)"/></td>
</tr>
<tr>
    <td><label for="nombrePer" class="labele">Names</label><br></td>
    <td><input type="text" id="nombrePer" name="nombrePer" style="width:250px; height:25px" class="form-control" required onChange="requisitos(nombrePer)"/></td>

    <td><label for="apellidoPer" class="labele">Lastnames</label><br></td>
    <td><input type="text" id="apellidoPer" name="apellidoPer" style="width:250px; height:25px" class="form-control" required onChange="requisitos(apellidoPer)" /></td>
</tr>
<tr>
<td><label for="ser" class="labele">Nationality</label></td>
<td><select id="nacio" name="nacio" id="ser" autofocus required class="form-control inputtext" list="servis" style="width:250px; height:35px" onChange="requisitos(nacio)">
<option value="">Select your nationality</option>      
      <option value="1">Colombia</option>
      <option value="2">España</option>
      <option value="3">Peru</option>
      <option value="4">Japon</option>
      <option value="5">Ecuador</option>
      <option value="6">Alemania</option>      
      </select> 
 </td>
    <td><label for="fechNac" class="labele">Date of birth</label></td>
    <td><input type="date" name="fechNac" style="width:250px; height:25px" id="fechNac" class="form-control" required onChange="requisitos(fechNac)"></td>
</tr>
<tr>
   
<td><input type="submit" name="registroR"  id="registro" class="btn btn-success"  value="Add Person" onclick="validar(registro)"style="position:relative; left:200px"></td>

</tr>
</table>
</form>
                               <%
                }//fin del for
            }
                        %>
</div>
</body>
</html>
