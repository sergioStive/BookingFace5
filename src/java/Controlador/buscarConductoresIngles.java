/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DTO.listarConductoresDTO;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fabian
 */
public class buscarConductoresIngles extends HttpServlet {
FacadePersonas facadeP = new FacadePersonas();
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
         
        HttpSession miseSession = request.getSession(true);
        
        
        if (request.getParameter("buscar") != null) {
            ArrayList<listarConductoresDTO> conduc = new ArrayList();
            personasDAO perdao = new personasDAO();

            String responsable = request.getParameter("responsable");
            String direccionDestino = request.getParameter("direccionDestino");
            String fechaReserva = request.getParameter("fechaReserva");

            conduc = (ArrayList<listarConductoresDTO>) facadeP.filtroConductores(responsable,direccionDestino,fechaReserva);
            miseSession.setAttribute("conductores", conduc);
            response.sendRedirect("filtroConductores1.jsp");
                 
           
           
        }
    if (request.getParameter("generarEcxel") != null) {
            ArrayList<listarConductoresDTO> conduc = new ArrayList();
            personasDAO perdao = new personasDAO();

            String responsable = request.getParameter("responsable");
            String direccionDestino = request.getParameter("direccionDestino");
            String fechaReserva = request.getParameter("fechaReserva");

            conduc = (ArrayList<listarConductoresDTO>) facadeP.filtroConductores(responsable,direccionDestino,fechaReserva);
            request.setAttribute("conductores", conduc);
            RequestDispatcher rd = request.getRequestDispatcher("exportarConductores.jsp");
            rd.forward(request, response); 
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
            Logger.getLogger(buscarPersona.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(buscarPersona.class.getName()).log(Level.SEVERE, null, ex);
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

