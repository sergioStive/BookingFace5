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
<script type="text/javascript">
    function comfirmar()
    {
        if(confirm('Esta seguro que Decea Eliminar Esta Reserva'))
            return true;
        
        else
            return  false;
    }
    
</script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
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
       background-image:url('img/exito.png');
       width: 1200px;
       
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
<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script type="text/javascript">
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 4000); 
});
</script>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
    <p><a href="Index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
    <nav>
<ul id="main">
    <li><a href="Index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</li></a>
        <li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                            <ul class="submain">
                                <li><a href="reserva.jsp" style="text-decoration: none;">Solicita Reserva</a></li>
                                <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reservas</a> </li>
                                <li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva</a> </li>
                                </ul>
                        </li>
                          <li><a href="menuCliente.jsp"><span class="glyphicon glyphicon-list-alt"></span> Mi Cuenta</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos1.jsp" style="text-decoration: none;">Mis Datos</a></li>
                                <li><a href="cambiarContraseña.jsp" style="text-decoration: none;">Cambiar Contraseña</a> </li>
                                </ul>
                        </li>
      
        </ul>

</nav>
<center>
    <%
      HttpSession misesion = request.getSession(false);
        
        reserDTO  per= new reserDTO();
      reserDAO pers = new reserDAO();
      personasDTO persona = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<reserDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) pers.listarReservaPer(persona.getIdPersona());
%> 
<br>
      <td colspan="4">
                    <% if (request.getParameter("msgSalida") != null) {%>
                    <% if (!request.getParameter("msgSalida").equals("")) {%> 
                    <div class="exito mensajes" role="alert">
                        <%= request.getParameter("msgSalida")%>
                    </div>
                    <%}%>
                    <%}%> 
      </td>
      <div class="ba">
      <h1>Reservas</h1>
      </div>
     <table border="6" class="paginated" id="divTabla">
    <tr>
        <th style="background: #0C4391;">idReserva</th>
       
        <th style="background: #0C4391;">idServicio</th>
        <th style="background: #0C4391;">idTrasnporteLlegada</th>
        <th style="background: #0C4391;">responsable</th>
        <th style="background: #0C4391;">fechaReserva</th>
        <th style="background: #0C4391;">horaReserva</th>
        <th style="background: #0C4391;">direccionDestino</th>
        <th style="background: #0C4391;">Eliminar</th>
    </tr>
    <%
      for(reserDTO so: misReservas){
          
      
    %>
    <tr>
        <td><%=so.getIdReserva()%></td>
       
        <td><%=so.getIdServicio()%></td>
        <td><%=so.getIdTransporteLlegada()%></td>
        <td><%=so.getResponsable()%></td>
        <td><%=so.getFechaReserva()%></td>
        <td><%=so.getHoraReserva()%></td>
        <td><%=so.getDireccionDestino()%></td>
        
        <td><a href="Controlador?idReserva=<%=so.getIdReserva()%>"><img src="imagenes/Eliminar.png" align="middle" width="32" height="32" title="Eliminar" onclick="return comfirmar()"></a></td>
    
    </tr>
    <%
    }
    %>
</table>
 <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user"  style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbina
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="CancelarR1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="CancelarR.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>

</table>
</main>

</body>
</html>
