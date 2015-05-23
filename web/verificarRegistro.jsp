
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.nacionalidadesDTO"%>
<%@page import="co.sena.edu.booking.DTO.ciudadesDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<!doctype html>
<html>
<head>
      <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>

    
    <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">

	 <link rel="shortcut icon" href="imagenes/br.ico" />
         <script src="scripts/registro.js" type="text/javascript"></script>
         <script src="scripts/ingreso.js" type="text/javascript"></script>
         <script src="scripts/paginacion.js" type="text/javascript"></script>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
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
<script type="text/javascript">
			$(document).ready(function() {
				$('#divTabla').buscoloquemesaledelospeones('inputFiltro');
			});
		</script>
                <script type="text/javascript">
    function comfirmar()
    {
        if(confirm('Esta seguro que desea eliminar este Usuario?'))
            return true;
        
        else
            return  false;
    }
    
</script>
         <script src="scripts/jquery_table.js" type="text/javascript"></script>

         <script src="scripts/bookasp.js" type="text/javascript"></script>
         <script src="scripts/smart-table.debug.js" type="text/javascript"></script>
         
<meta charset="utf-8">
<title>..::Booking Routers::..</title>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
    <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav>
  <ul id="main">
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Gestion Rutas</a>
  <ul class="submain">
  <li><a href="CreaRuta.jsp?msj=" style="text-decoration: none;">Creaci�n de Rutas</a></li>
  <li><a href="ModRuta.jsp?msj=" style="text-decoration: none;">Modificaci�n de Rutas</a> </li>
  </ul>
  </div>  
  </li>  
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-folder-open"></span> Reportes</a> 
  <ul class="submain">  
  <li><div align="center"><a href="Filtro.jsp" style="text-decoration: none;">Clientes</a></div></li>
  <li><div align="center"><a href="filtroConductores.jsp" style="text-decoration: none;">Conductores</a></div></li>
  <li><div align="center"><a href="EnvioCorreoMasivo.jsp" style="text-decoration: none;">Envio de correos masivos</a></div></li>

  </ul>
</li>
  <li><a href="Controlador?action=logout" style="text-decoration: none;">Cerrar sesion</a> </li> 
 </ul>
  </nav>
<center>
    <%
     ciudadesDTO ciudad = new ciudadesDTO();
     nacionalidadesDTO nac = new nacionalidadesDTO();
     FacadePersonas facadeP = new FacadePersonas();
     personasDTO  per= new personasDTO();
     personasDAO pers = new personasDAO();
     ArrayList<personasDTO> misPersonas= new ArrayList();     
     misPersonas = (ArrayList) facadeP.listarTodasPersonas(per.getIdPersona());                                       
     int numreg = facadeP.contarRegistros();
     int numpg = numreg/5;   
     int pg =0; //pagona a mostrar
     if(request.getParameter("pg")==null){
     pg=1;
     }else{
     pg=Integer.valueOf(request.getParameter("pg"));
     }
     misPersonas =(ArrayList<personasDTO>) facadeP.Paginacion(pg,3);      
     %>     

     
<div class="ba">
<h1><center>Registrados</center></h1>
</div>
 <br>     
 <div class="lateral">
 <h4>Bienvenido</h4>
<div class="nombre">
<td><input type="text" value="Yilber Fabian" style="width:166px; height:25px; text-align:center; text-transform:uppercase;"  autofocus disabled  class="form-control inputtext">
</td>
</div>
<div class="foto">
<img id="foto" src="imagenes/user.jpg">
</div>
<div class="nombre">
<td><input type="text" value="ADMINISTRADOR" style="width:166px; height:25px; text-align:center; text-transform:uppercase;"  autofocus disabled  class="form-control inputtext">
</td>
</div>
</div>
 <div class="busqueda">
 <span style="font-weight:bold;">B�squeda:&nbsp;</span>
 <input id="inputFiltro" type="text" />
 </div>
      <table border="1" border="6" class="paginated" id="divTabla" >
        <thead>
        <tr id="titulo">
        <th st-ratio="20" st-sort="cedula">CEDULA</th>
        <th st-ratio="20" st-sort="nombres">NOMBRES</th>
        <th st-ratio="20" st-sort="apellidos">APELLIDOS</th>
        <th st-ratio="20" st-sort="ciudad">CIUDAD</th>
        <th st-ratio="20" st-sort="pais">PAIS</th>
        <th st-ratio="20" st-sort="telefono">TELEFONO</th>
        <th st-ratio="20" st-sort="correo">CORREO</th>
        <th>ELIMINAR REGISTRO</th>
        <th>VERIFICAR REGISTRO</th>
    </tr>
    </thead>
    <%
      for(personasDTO so: misPersonas){
          
      
    %>
    <tbody>
    <tr>
        <td data-sortable="true"><%=so.getIdPersona()%></td>
        <td data-sortable="true"><%=so.getNombres()%></td>
        <td data-sortable="true"><%=so.getApellidos()%></td>
        <td data-sortable="true"><%=so.getCiu().getCiudad()%></td>
        <td data-sortable="true"><%=so.getNac().getNacionalidad()%></td>
        <td data-sortable="true"><%=so.getTelefono()%></td>
        <td data-sortable="true"><%=so.getCorreoElectronico()%></td>
        <td><a href="Controlador?id=<%=so.getIdPersona()%>"><img src="imagenes/Eliminar.png"   onclick="return Eliminar()" align="middle" width="32" height="32" title="Eliminar"></a></td>
        <td><a href="Controlador?idPersona=<%=so.getIdPersona()%>"class="btn btn-success" title="Modificar datos de acompa�antes"><img src="imagenes/user.jpg" align="middle" width="32" height="32" title="Verificar" onclick="contrase()"></a></td>
    </tr>
     </tbody>
<%
}
%>
      </table>
      
      <center>
  <table>  
  <td colspan="4">
  <% if (request.getParameter("msgSalida") != null) {%>
  <% if (!request.getParameter("msgSalida").equals("")) {%> 
  <div class="exito mensajes" role="alert">
  <%= request.getParameter("msgSalida")%>
  </div>
  <%}%>
  <%}%>  
  </table>
  </center>
      
<div class="pagination" id="">
     <%
     int adelanteA;
     if (request.getParameter("pg")==null) {
             adelanteA =1;
         }else{
     adelanteA =Integer.parseInt(request.getParameter("pg"));
     }
         
     %> 
    <a href="?pg=<%=adelanteA-1%>">&laquo</a>
    
    <%      
       for(int j=0;j<numpg+1;j++){
       %>  
       <a href="?pg=<%=j+1%>"><%=j+1 %></a>
 <%
     }
 %>

<a href="?pg=<%=adelanteA+1%>">&raquo</a>
  
</div>
</center>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="verificarRegistro1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="verificarRegistro.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
</body>
</html>