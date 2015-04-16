<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Booking Routers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.min.css">        
        <link rel="shortcut icon" type="image/x-icon" href="img/code.ico">
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
            function enviarFormularios() {
                document.formsubmit();
            }
        </script>
    </head>
    <body>
        <div class="banner"> 
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav nav-tabs">
                        <li role="presentation"><a href="verificarRegistro.jsp">Inicio</a></li>

                        <li role="presentation" class="active"><a href="personas.jsp">Enviar Correos</a></li>

                    </ul>
                </div>
            </div>
            <br>
            <form method="get" action="GestionCorreos">
                <div class="row">                
                    <div class="col-md-4">
                        <legend class="text-center">Correo másivo</legend>
                        <div class="form-group">
                            <label for="cAsunto">Asunto:</label>
                            <input type="text" name="cAsunto" id="cAsunto" 
                                   class="form-control" placeholder="Asunto del correo" value="" required>
                        </div>
                        <div class="form-group">
                            <label for="cCuerpo">Mensaje:</label>
                            <textarea type="text" name="cCuerpo" id="cCuerpo" class="form-control" required placeholder="Mensaje para las personas"></textarea>
                        </div>                        
                        <button type="submit" class="btn btn-success">Enviar Correo</button>
                    </div>
                    <div class="col-md-8">

                        <table class="table table-striped table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Correo</th>                                    
                                    <th>Seleccionar</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    personasDAO pdao = new personasDAO();

                                    ArrayList<personasDTO> misPersonas;
                                    misPersonas = (ArrayList<personasDTO>) pdao.listarPersonas();
                                    int i = 0;
                                    for (personasDTO p : misPersonas) {

                                %>
                                <tr>
                                    <td><%= p.getIdPersona()%></td>
                                    <td><%= p.getNombres()%></td>
                                    <td><%= p.getApellidos()%></td>
                                    <td><%= p.getCorreoElectronico()%></td>                                  
                                    <td class="text-center">
                                        <div class="checkbox <% if (p.getIdestadousuarios()== 0 || p.getActivarCorreo() == 0) { out.print("disabled");} %>">
                                            <label>
                                                <input type="checkbox"  <% if (p.getIdestadousuarios()== 0 || p.getActivarCorreo() == 0) { out.print(" "); out.print("value='" + 0 +"'"); } else { %> value='<%= p.getIdPersona()%>' <%}%>name="idPersona[<%= i%>]">
                                            </label>
                                        </div>
                                    </td>
                                </tr>                        
                                <%
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>                
                    </div>
                </div>
                <input type="hidden" name="contador" value="<%= i%>">                
            </form>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <%
                        if (request.getParameter("info") != null) {
                    %>
                    <div class="alert alert-info text-center">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <p><%= request.getParameter("info")%></p>
                    </div>
                    <%
                        }
                    %>
                    <div class="col-md-4"></div>
                </div>
            </div>
    </body>
</html>
