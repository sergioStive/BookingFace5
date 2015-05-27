<%@page import="co.sena.edu.booking.DAO.personareservaDAO"%>
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.personareservaDTO"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
	<script  src="jquery/jquery.js"></script>
	<script src="jquery/jquery.validate.js"></script>
	<script src="jquery/additional-methods.js"></script>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>        
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
    <li><div align="center"><a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> initiation</a></li>
            <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span>Bookings</a>
                            <ul class="submain">
                                <li><a href="CancelarR1.jsp" style="text-decoration: none;">Cancel Reservation</a></li>
                                <li><a href="ModificarReservas1.jsp" style="text-decoration: none;">modify Booking</a> </li>
                                </ul>
                        </li>
                        <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a>
                        
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

        %>
        <div class="ba">
            <center><h1>modify Reservations</h1></center>
        </div>
        
        <%
            personareservaDAO queryReser = new personareservaDAO();
            personareservaDTO miReserva = new personareservaDTO();
            FacadePersonas facadeP = new FacadePersonas();
            miReserva = facadeP.ListarUnaReservaAcompanante(Integer.parseInt(request.getParameter("idreservaPorPersona")));
        %>
     <form name="form1" action="modificarAcompanantes" method="post" > 
     <table width="744" align="center" id="registro"> 
    <input type="hidden" id="apellidoPer" name="id" value="<%=miReserva.getIdreservaPorPersona() %>"</input>
   
     <tr>
    <td><label for="tel" class="labele">Phone</label><br></td>
    <td><input type="text" id="apellidoPer" name="tel" value="<%=miReserva.getTelefono()%>" style="width:250px; height:25px" class="form-control" required/></td>
          </tr>
          <tr>
    <td><label for="nombrePer" class="labele">Names</label><br></td>
    <td><input type="text" id="nombrePer" name="nombrePer" value="<%=miReserva.getNombres() %>" style="width:250px; height:25px" class="form-control" required/></td>
          </tr>
          <tr>
    <td><label for="apellidoPer" class="labele">Lastnames</label><br></td>
    <td><input type="text" id="nombrePer" name="apellidoPer"  value="<%=miReserva.getApellidos()%>" style="width:250px; height:25px" class="form-control" required/></td>
          </tr>
          <tr>
    <td><label for="fechNac" class="labele">Date of Birth</label></td>
    <td><input type="date" name="fechNac" value="<%=miReserva.getFechaNaci()%>" style="width:250px; height:25px" id="fechNac" class="form-control" required></td>
    </tr>
<td><input type="submit" name="registroR"  id="registro" class="btn btn-success"  value="Modificar" onclick="validar(registro)"style="position:relative; left:200px"></td>



            </table>
            
            <%
                } else {
                misesion.removeAttribute("logueado");
                misesion.invalidate();
                response.sendRedirect("index.jsp?msg= Sesion cerrada");
            }
            %>
        </form>
    </div>

<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
    <span>Booking Routers &copy; 2015</span><br>
    members :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
    <img src="imagenes/dddd.png"><a href="modificarReserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="cambiarContrase�a.jsp"><a href="modificarReserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
</body>
</html>


