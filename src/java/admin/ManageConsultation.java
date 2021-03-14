/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;
import model.Consultation;

/**
 *
 * @author Admin
 */
public class ManageConsultation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private Connection cnn = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private JDBC db = new JDBC();
    private String sql = null;
    public void init(){
        cnn = db.db1_connect();
    } 
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int OCID = Integer.parseInt(request.getParameter("OCID"));
            String OCAnswer = request.getParameter("OCAnswer");
            String Msg;
            try{
                sql = "Update onlineconsultation SET OCAnswer = ? WHERE OCID = ?";
                pst = cnn.prepareStatement(sql);
                pst.setString(1, OCAnswer);
                pst.setInt(2, OCID);
                
                if(pst.executeUpdate()!=0){
                    Msg = "Updated";
                    request.setAttribute("Msg", Msg);
                    response.sendRedirect("Consultation");
                }
                else{
                    Msg = "Not Updated";
                    request.setAttribute("Msg", Msg);
                    response.sendRedirect("admin");
                }                        
            }catch(Exception e){
                out.println(e);
                e.printStackTrace();
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
