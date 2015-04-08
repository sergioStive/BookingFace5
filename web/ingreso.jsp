<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Booking Routers</title>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css" />
<link rel="shortcut icon" href="imagenes/br.ico" />
</head>
<body>
<div class ="contenedor"></div>
 <div class="banner">
     <p><a href="Index.jsp"><img src="imagenes/Logo.png" alt="Bookin Routers" width="1360" height="126" title="Forget the rest, call the best" /></a></p>
 </div>
<nav> 
<ul id="main"> 
    <li> <div align="center"> <a href="Index.jsp" style="text-decoration:none;"><span class="glyphicon glyphicon-home"></span> Inicio</a>
 </div>
</li>
<li>
    <div align="center"> <a href="RecuperarContra.jsp" style="text-decoration:none;">¡Olvido contraseña!</a>
</div>
</li>
</ul>
    </nav> 
<center>

<table id="registro">
<div class="ba">
<h1>Ingreso Usuarios Registrados</h1>
</div>
     <div style=" background:#DDDDDD;  text-align: center; border-radius: 15; padding-top: 5px; border-radius: 15px; ">
                                  <a href="Index.html" style="color:black; text-decoration: none;">Inicio</a>
                                  -->
                                  <a href="registro.jsp" style="color: black; text-decoration: none;">Ingreso</a>
     </div><br>
<form name="form1" action="Controlador" method="post" >      
<label for="usu" class="labele"><strong>Cedúla<font color="#FF0000">*</strong></label></font>
<input name="idPersona" type="text" style="width:250px; height:25px " autofocus id="usu" placeholder="usuario" required class="form-control inputtext"  onChange="requisitos(nombre)" minlenght=3>

<br>

<label for="con" class="labele"><strong>Contraseña<font color="#FF0000">*</strong></label></font>
<input name="contraseña" type="password" style="width:250px; height:25px " required id="con" placeholder="*******" required class="form-control inputtext"  minlenght=3>
<br>
<input name="submit10" class="btn btn-success"  type="submit" id="submit10" onClick= "rol()" value="Ingresar">
</form>
     </table>
</center>
<br>

   <center>
   <table>
    <tr>
    <td colspan="2">
    <%
     if(request.getParameter("invalida") != null  ) {
     %>
     <div  class="alert alert-danger"  role="alert">
       <b> sus datos no son validos</b>
    </div>
     <%
     }
     %>
     </tr>
     </table>
    </center>
 <div class="idioma">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        
       <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
       <img src="imagenes/dddd.png"><a href="ingreso1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="ingreso.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>
   
 </div>
</body>
</html>