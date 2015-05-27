<%-- 
    Document   : exportarPDFServicios
    Created on : 26/05/2015, 04:12:00 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exportar PDF Servisios</title>
    </head>
    <body>
        
        <h1>Reporte de PDF Conductores</h1>
    <center>
        <%
         HttpSession miSession = request.getSession(false); 
         if (miSession.getAttribute("servicios") != null) {
    %>
     
    <object type="application/pdf" data="PDFServicios" width="1000" height="650">
            </object>
    
         <%
         }
      %>
    </center>
         
         
    </body>
</html>
