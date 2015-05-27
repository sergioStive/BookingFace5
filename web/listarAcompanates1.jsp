<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.personareservaDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<%
if(request.getSession() != null){
    %>
<html>
<head>
    
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">

<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="js/jquery.dataTables.min.css">
<body>
<div class ="contenedor">
<div class="banner"> 
    <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
    <nav>
<ul id="main">
    <li><a href="index1.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Initiation</a></li>
        <li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Bookings</a>
                            <ul class="submain">
                                <li><a href="reserva1.jsp" style="text-decoration: none;">request Booking</a></li>
                                <li><a href="ModificarReservas1.jsp" style="text-decoration: none;">modify Booking</a> </li>                               
                                </ul>
                        </li>
                          <li><a href="menuCliente1.jsp"><span class="glyphicon glyphicon-list-alt"></span> My Account</a>
                        </li>
      
        </ul>

</nav>
<br>
 <%
      HttpSession misesion = request.getSession(false);     
      FacadePersonas facadeP = new FacadePersonas();
      personasDTO reserva = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<personareservaDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) facadeP.listarAcompañantes(Integer.parseInt(request.getParameter("idReserva")));
%>  
<% if(misReservas.isEmpty() ){
%>
<span>vacio</span>
<% }%>
<center>
    <table>      
    <tr>
    <td colspan="2">
                    <% if (request.getParameter("msgSalida") != null) {%>
                    <% if (!request.getParameter("msgSalida").equals("")) {%> 
                    <div class="exito mensajes" role="alert">
                    <%= request.getParameter("msgSalida")%>
                    </div>
                    <%}%>
                    <%}%> 
      </td>
  </tr>
  </table>
 </center>     
      <div class="ba">
      <h1>Modificar Reservas</h1>
      </div>
      <center>
     <table border="1" class="paginated" id="divTabla">
    <tr>
        <th st-ratio="20" st-sort="nombres">Name</th>
        <th st-ratio="20" st-sort="apellidos">Lastname</th>
        <th st-ratio="20" st-sort="telefono">Phone</th>
        <th st-ratio="20" st-sort="fechaNac">Date of Birth</th>
        <th st-ratio="20" st-sort="Modificar">Modify </th>
        
    </tr>
    <%
      for(personareservaDTO so: misReservas){      
    %>
    <tr>
        <td><%=so.getNombres()%></td>       
        <td><%=so.getApellidos()%></td>
        <td><%=so.getTelefono()%></td>
        <td><%=so.getFechaNaci()%></td>
       
         
        <td class="danger"><a href="modificarAcompanantes1.jsp?idreservaPorPersona=<%=so.getIdreservaPorPersona()%>&nombres=<%=so.getNombres()%>&apellidos=<%=so.getApellidos()%>&telefono=<%=so.getTelefono()%>&idReserva=<%=so.getIdReserva()%>&fechaNac=<%=so.getFechaNaci()%>"
        class="btn btn-success" title="Modificar datos de acompañantes">Modificar</a></td>
      
        
    </tr> 
    <%
    }
    %>
</table>
</center>
 <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
       Members :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user"  style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbina
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="CancelarR1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="CancelarR.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
</body>
</html>
<%
}
%>