<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.serviciosDTO"%>
<%@page import="co.sena.edu.booking.DTO.empresatransportesDTO"%>
<%@page import="java.sql.Array"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 	 	<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script src="scripts/registro.js" type="text/javascript"></script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />

<title>..::Booking Routers::..</title>
</head>
<body>
    <div class ="contenedor">
<div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
      <nav> 
<ul id="main">
  <li><div align="center"><a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
  <ul class="submain"> 
  <li><a href="reserva.jsp" style="text-decoration: none;">Solicitar Reserva</a></li>
  <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reservas</a></li>
  </ul>
  </li>
  <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a>
  </ul>
  </nav>
<center>
     
    <%
      HttpSession misesion = request.getSession(false);
      empresatransportesDTO t = new empresatransportesDTO();
      serviciosDTO se =new serviciosDTO();  
      reserDTO  per= new reserDTO();
      FacadePersonas facadeP = new FacadePersonas();
      personasDTO persona = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<reserDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) facadeP.listarReservaPer(persona.getIdPersona());
%>    
<div class="ba">
      <h1> Mis Reservas</h1>
</div>
<table border="1" class="paginated" id="divTabla">
    <tr>
        <th st-ratio="20" st-sort="idReserva">NumeroReserva</th>
        <th st-ratio="20" st-sort="idServicio">Servicio</th>
        <th st-ratio="20" st-sort="idTrasnporteLlegada">TransporteLlegada</th>
        <th st-ratio="20" st-sort="responsable">Responsable</th>
        <th st-ratio="20" st-sort="fechaReserva">FechaReserva</th>
        <th st-ratio="20" st-sort="horaReserva">HoraReserva</th>
        <th st-ratio="20" st-sort="direccionDestino">DireccionDestino</th>
        <th st-ratio="20" st-sort="cupo">Acompañantes</th>
        <th st-ratio="20" st-sort="Modificar">Modificar</th>
        <th st-ratio="20" st-sort="Modificar">Acompañantes</th>
    </tr>
    <%
      for(reserDTO so: misReservas){      
    %>
    <tr>
        <td><%=so.getIdReserva()%></td>       
        <td><%=so.getSer().getServicio()%></td>
        <td><%=so.getEmpre().getNombreEmpresaTransporte()%></td>
        <td><%=so.getResponsable()%></td>
        <td><%=so.getFechaReserva()%></td>
        <td><%=so.getHoraReserva()%></td>
        <td><%=so.getDireccionDestino()%></td>
        <td><%=so.getCupo()%></td>
        
        <td><a href="modificarReserva.jsp?idReserva=<%=so.getIdReserva()%>&idServicio=<%=so.getIdServicio()%>&IdTransporteLlegada=<%=so.getIdTransporteLlegada()%>
        &Responsable=<%=so.getResponsable()%>&FechaReserva=<%=so.getFechaReserva()%>&HoraReserva=<%=so.getHoraReserva()%>&DireccionDestino=<%=so.getDireccionDestino()%>&cupo=<%=so.getCupo()%>"> <img src="imagenes/Modificar.png" align="middle" width="32" height="32" title="Verificar"></a></td>
       
        <td class="danger"><a href="listarAcompanates.jsp?idReserva=<%=so.getIdReserva()%>" class="btn btn-success" title="Modificar datos de acompañantes">Modificar</a></td>
    </tr>
    <%
    }
    %>
</table>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="ModificarReservas1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="ModificarReservas.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>

</table>
</main>

</body>
</html>
