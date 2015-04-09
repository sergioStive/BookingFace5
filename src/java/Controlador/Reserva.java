/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;


import co.sena.edu.booking.DAO.reserDAO;

import co.sena.edu.booking.DTO.reserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fabian
 */
@WebServlet(name = "Reserva", urlPatterns = {"/Reserva"})
public class Reserva extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException, SQLException {
           response.setContentType("text/html;charset=UTF-8");
           if (request.getParameter("registroR") != null) {

           reserDTO to = new reserDTO();
           reserDAO dao = new reserDAO();
           long t =dao.validarReservas(Integer.parseInt(request.getParameter("doc")));
           if(t>=5){
            response.sendRedirect("reserva.jsp?noo="+ t);  
           }else if(t<5){
           to.setIdpersona(Integer.parseInt(request.getParameter("doc")));
           to.setIdEstadoReserva(1);
           to.setIdServicio(Integer.parseInt(request.getParameter("ser")));
           to.setIdTransporteLlegada(Integer.parseInt(request.getParameter("aer")));
           to.setResponsable(request.getParameter("res"));
           to.setFechaReserva(request.getParameter("fecNac"));
           to.setHoraReserva(request.getParameter("hora"));
           to.setDireccionDestino(request.getParameter("aerop"));
            
            String mensaje = dao.insertar(to);
            
            response.sendRedirect("menuCliente.jsp?msgSalida="+mensaje);
        }
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
            Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
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
