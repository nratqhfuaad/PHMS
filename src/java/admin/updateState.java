/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JDBC;

/**
 *
 * @author iztan
 */
public class updateState extends HttpServlet {
    
    private Connection cnn = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private JDBC db = new JDBC();
    private String sql = null;
    public void init(){
        cnn = db.db1_connect();
    }
    
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String state = request.getParameter("stateName");
           int statC = Integer.parseInt(request.getParameter("stateC"));
           String lastUpdate = request.getParameter("lastUpdate");
            String Msg;
            try{
                sql = "Update state_c set state_cases = ?, last_update = ? where state_name = ?";
                pst = cnn.prepareStatement(sql);
                pst.setInt(1, statC);
                pst.setString(2, lastUpdate);
                pst.setString(3, state);
                
                if(pst.executeUpdate()!=0){
                    Msg = "Updated";
                    request.setAttribute("Msg", Msg);
                    response.sendRedirect("states");
                }
                else{
                    Msg = "Not Updated";
                    request.setAttribute("Msg", Msg);
                    response.sendRedirect("states");
                }
                
                
                
            }
            catch(Exception ex){}
            
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
