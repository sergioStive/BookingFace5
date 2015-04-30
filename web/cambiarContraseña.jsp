<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
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
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav> 
    <ul id="main">
<li><div align="center"><a href="Index.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</li></a>
<li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
<ul class="submain">
<li><a href="reserva.jsp" style="text-decoration: none;">Solicitar Reserva </a></li>
<li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reserva </a></li>
<li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva </a></li>
</ul>
</li>
<li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Mi Cuenta</a>
    
<ul class="submain">
<li><a href="actualizarDatos1.jsp" style="text-decoration: none;">Mis Datos</a></li>
</ul>
</li> 
<li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list"></span> Menu</a></li>
</ul>
    </nav> 
     <%
                                    HttpSession misesion = request.getSession(false);

                                    if (misesion.getAttribute("logueado") != null) {
                                        personasDTO pdto = null;
                                        personasDTO persona = null;
                                        FacadePersonas facadeP = new FacadePersonas();
                                        pdto = (personasDTO) misesion.getAttribute("logueado");
                                        persona = facadeP.ListarUnaPersona(pdto.getIdPersona());                                       
                                                

                                %>
                                <div class="table">
                                <form id="registro" action="cambiarClave?id=<%=persona.getIdPersona()%>" method="post"> 
                                    <table align="center" id="registro" >
                                        <div class="ba">
                                        <h1>Cambiar Contrase�a</h1>
                                        </div>                                 
                                        <center>                                   
                                                <label for="con" class="labele"><strong>Contrase�a<font color="#FF0000">*</font></strong></label>
                                                <input name="con" type="password" id="con" value="<%=persona.getContrase�a()%>" style="width:250px; height:25px" tabindex="17" autofocus required class="form-control inputtext">
                                                <br>
                                                <label for="con" class="labele"><strong>Confirmar<font color="#FF0000">*</font></strong></label>
                                                <input name="vcon" type="password" id="vcon" value="<%=persona.getContrase�a()%>" style="width:250px; height:25px" tabindex="18" autofocus required class="form-control inputtext">
                                                <br>
                                                <br>
                                                <input name="submit11" class="btn btn-success" type="button" id="ccon" tabindex="19" onClick="contrase()" value="Validar contrase�a"style="position:relative; left:30px">
                                                <input name="submit10" class="btn btn-success" type="submit" id="submit10" tabindex="20"  value="Guardar Cambios" onClick="validar(registro)" style="position:relative; left:50px">                                            
                                        </center>                                   
                                        </table>
                                    </form>
                                </div>
                                   
                                    <%
                                        }
                                    %>

</div>
                                      
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                         <span>Booking Routers &copy; 2015</span><br>
                                         Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                         <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                         <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                         <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                         <img src="imagenes/dddd.png"><a href="cambiarContrase�a1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="cambiarContrase�a.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                                     </div>
</body>
</html>