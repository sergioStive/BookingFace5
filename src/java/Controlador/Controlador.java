/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DAO.reserDAO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.reserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class Controlador extends HttpServlet {
FacadePersonas facadeP = new FacadePersonas();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("registro") != null) {
           
            personasDTO pdto = new personasDTO();
            personasDAO pdao = new personasDAO();

            pdto.setIdPersona(Long.parseLong(request.getParameter("doc")));
            pdto.setNombres(request.getParameter("nombres"));
            pdto.setApellidos(request.getParameter("apellidos"));
            pdto.setCorreoElectronico(request.getParameter("cor"));
            pdto.setFechaNto(request.getParameter("date"));
            pdto.setIdNacionalidad(Integer.parseInt(request.getParameter("paisnac")));
            pdto.setIdCiudad(Integer.parseInt(request.getParameter("ciunac")));
            pdto.setSexo(Integer.parseInt(request.getParameter("pSexo")));
            if (request.getParameter("pActivarCorreo") != null) {
                pdto.setActivarCorreo(1);
            } else {
                pdto.setActivarCorreo(0);
            }
            pdto.setTelefono(Integer.parseInt(request.getParameter("tel")));
            pdto.setContraseña(request.getParameter("con"));
            pdto.setIdestadousuarios(1);
            pdto.setObservaciones("Ninguna");

            String mensaje = facadeP.crearPersona(pdto);
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("logueado", pdto);
            response.sendRedirect("menuCliente.jsp?msgSalida=" + mensaje);
        } else if (request.getParameter("id") != null) {
            personasDAO pdao = new personasDAO();
            String eliminado = facadeP.eliminar(Long.parseLong(request.getParameter("id")));
            response.sendRedirect("verificarRegistro.jsp?msgSalida=" + eliminado);
        } else if (request.getParameter("submit10") != null) {
            personasDAO pert = new personasDAO();

            long x = facadeP.isAcountExists(request.getParameter("contraseña"), Long.parseLong(request.getParameter("idPersona")));

            if (x != 0 && x != 10301023) {
                personasDTO per = new personasDTO();
                
                per = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("idPersona")));
                HttpSession misesion = request.getSession(true);
                misesion.setAttribute("logueado", per);
                response.sendRedirect("menuCliente.jsp");

            } else if (x == 0) {

                response.sendRedirect("ingreso.jsp?invalida=" + x);

            } else if (x == 10301023 && x != 0) {
                personasDTO per = new personasDTO();
                ArrayList<reserDTO> re= new ArrayList();
                reserDAO no= new reserDAO();
                re=(ArrayList)facadeP.listarReservaPer(per.getIdPersona());
                per = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("idPersona")));
                HttpSession misesion = request.getSession(true);
                misesion.setAttribute("logueado", per);
                response.sendRedirect("verificarRegistro.jsp");
            }
        } else if (request.getParameter("idReserva") != null) {
            reserDAO pdao = new reserDAO();
            String eliminado = facadeP.EliminarReseva(Integer.parseInt(request.getParameter("idReserva")));
            response.sendRedirect("CancelarR.jsp?msgSalida=" + eliminado);
        } else if (request.getParameter("idPersona") != null) {
            personasDAO pdao = new personasDAO();
            personasDTO eliminado = new personasDTO();
            eliminado = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("idPersona")));
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("logueado", eliminado);
            response.sendRedirect("asignarRol.jsp?eliminado=" + eliminado);
        } else if (request.getParameter("action") != null) {
            HttpSession sesion = request.getSession(false);
            sesion.removeAttribute("logueado");
            sesion.invalidate();
            response.sendRedirect("Index.html");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
