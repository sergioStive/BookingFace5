 



<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%> 	 	

<html>
<head>
     <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script src="scripts/registro.js" type="text/javascript"></script>
<script src="js/Funciones.js" type="text/javascript">
    
    function validarFecha() {
    var temp = document.getElementById("fecNac").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
     var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);

    if (fechaSolicitud < fechaActual){
        document.getElementById("result").innerHTML="Esta seleccionando una fecha anterior a la actual";
        document.getElementById("fecNac").focus();
    } else if (fechaSolicitud >= fechaActual && fechaSolicitud <fechaMinima){
        document.getElementById("result").innerHTML="En ese tiempo no se alcanzaa tenr el pedido";
        document.getElementById("fecNac").focus();
    }else if(fechaSolicitud >=fechaMaxima){
       document.getElementById("result").innerHTML="NO hacemos pedidos con tanta Anticipacicion";
       document.getElementById("fecNac").focus();
    }else{
        document.getElementById("result").innerHTML="ok";
    }

}
</script>
<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script type="text/javascript">
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 3500); 
});
</script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav> 
<ul id="main">
    <li><div align="center"><a href="Index.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</li></a>
            <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                            <ul class="submain">
                                <li><a href="reserva.jsp" style="text-decoration: none;">Solicitar Reserva</a></li>
                                <li><a href="CancelarR.jsp" style="text-decoration: none;">Mis Reservas</a> </li>
                                </ul>
                        </li>
                        <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos1.jsp" style="text-decoration: none;">Mis Datos</a></li>
                                <li><a href="cambiarContraseña.jsp" style="text-decoration: none;">Cambiar Contraseña</a> </li>
                                </ul>
                        
        </ul>
    </nav> 
<%
            HttpSession misesion = request.getSession(false);

            if (misesion.getAttribute("logueado") != null) {
                personasDTO pdto = null;
                personasDTO persona = null;
                personasDAO pdao = new personasDAO();
                pdto =(personasDTO) misesion.getAttribute("logueado");
               //String mgs =misesion.getAttribute("logueado").toString();
                persona = pdao.ListarUnaPersona(pdto.getIdPersona());


        %>


<form name="form1" action="Reserva" method="post" > 
<table width="744" align="center" id="registro">
<div class="ba">
    <h1><center>Generar Reservas</center></h1>
</div>
    <br>
    <center>
    <%
                        if(request.getParameter("noo") != null) {
                        %>
                        <div>
                            <b <div class="alert alert-danger mensajes" role="alert">Usted no puede realizar mas de 3 reservas.</b>
                      </div>
                        <%
                         }
                        %>  
                        </center>
                        <br>
<tr>    
<td><label for="doc" class="labele"><strong>Documento<font color="#FF0000">*</strong></label></font></td>
<td><input name="doc" type="text" id="res" style="width:250px; height:25px" placeholder="Cedula" autofocus  required class="form-control inputtext"></td>
</tr>
<tr>
<td><label for="ser" class="labele"><strong>Servicio<font color="#FF0000">*</strong></label></font></td>
<td>   
      <select  id="servis" name="ser" id="ser" autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px">     
      <option value="1">Airport and Jet Aviation Centers</option>
      <option value="2">Port and Cruise Ship Transportation</option>
      <option value="3">Transfer</option>
      <option value="4">By the Hour</option>
      <option value="5">Events</option>
      <option value="6">Tours</option>
      <option value="7">Atraccions Vacation Ideas</option>
      </select> 
 </td>
</select>                                        
<td><label for="aer" class="labele"><strong>Aerolineas<font color="#FF0000">*</strong></label></font></td>
<td>   
      <select name="aer" id="aer" style="width:250px; height:35px" id="aero" autofocus required class="form-control inputtext" list="aero">
      <option value="1">Avianca</option>
      <option value="2">LAN</option>
      <option value="3">US Airways</option>
      <option value="4">American Airline</option>
      </select> 
 </td>
</tr>

<tr>    
<td><label for="res" class="labele"><strong>Responsable<font color="#FF0000">*</strong></label></font></td>
<td><input name="res" type="text" id="res" style="width:250px; height:25px" placeholder="Responsable" autofocus  required class="form-control inputtext"></td>   
<td><label for="fecNac"><strong>Fecha Reserva<font color="#FF0000">*</strong></label></td>
<td><input type="date" id="fecNac" name="fecNac" style="width:250px; height:25px"  required="" value="30-12-1900" class="form-control inputtext" tabindex="4" onblur="javascript:validarFecha()"><br></td>
<div id="result" class="mensajegError"></div>
</tr> 
<tr>
<td><label for="hora" class="labele">Hora de Vuelo</label></td>
<td><input type="time" name="hora" id="hora" style="width:250px; height:25px" class="form-control" required></td>
<td><label for="aerop" class="labele">Aeropuesto Destino</label></td>
<td><select type="time" name="aerop" id="aerop" style="width:250px; height:30px"  autofocus  required class="form-control inputtext">
<option>Fort Louderdale</option>
    </select>

</td>
</tr>
<tr>
<td><input type="submit" name="registroR"  id="registro" class="btn btn-success"  value="Generar Reserva" onclick="validar(registro)" style="position:relative; left:330px">
</table>
</form>
</div>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                <span>Booking Routers &copy; 2015</span><br>
                                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                <img src="imagenes/dddd.png"><a href="reserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="reserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                            </div>
</main>
<%
            } else {
                misesion.removeAttribute("logueado");
                misesion.invalidate();
                response.sendRedirect("Index.html?msg= Sesion cerrada");
            }
        %>
</body>
</html>
