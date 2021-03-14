/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;

/**
 *
 * @author Admin
 */
public class clinicApt extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Connection con;
    PreparedStatement pst = null;
    PreparedStatement pst2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    String sql; 
    String sql2;
  
    JDBC jdbcUtility = new JDBC();

    public void init() {
        con = jdbcUtility.db1_connect();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String BFName = request.getParameter("BFName");
            String BLName = request.getParameter("BLName");
            String BContactNo = request.getParameter("BContactNo");
            String BIC = request.getParameter("BIC");
            String BGender = request.getParameter("BGender");
            String BDate = request.getParameter("BDate");
            String BTime = request.getParameter("BTime");
            String BDesc = request.getParameter("BDesc");
            String BStatus = "Pending";
            
            //get email of current active user from session
            HttpSession session = request.getSession(true);
            String pemail = (String)session.getAttribute("pemail");
            
            int pid = 0;
            try {
                //get current user ID 
                sql2 = "SELECT pid FROM p_user WHERE pemail = ?";
                pst2 = con.prepareStatement(sql2);
                pst2.setString(1, pemail);
                rs2 = pst2.executeQuery();
                
                if(rs2.next()){
                    pid = rs2.getInt("pid");
                }

            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }
            
            try {
                sql = "INSERT INTO bookingclinic (BFName, BLName, BContactNo, BIC, BGender, BDate, BTime, BDesc, BStatus, BUserID)"
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, BFName);
                ps.setString(2, BLName);
                ps.setString(3, BContactNo);
                ps.setString(4, BIC);
                ps.setString(5, BGender);
                ps.setString(6, BDate);
                ps.setString(7, BTime);
                ps.setString(8, BDesc);
                ps.setString(9, BStatus);
                ps.setInt(10, pid);
                ps.executeUpdate();


            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }
        
            response.sendRedirect("CovidAptHistory");
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
