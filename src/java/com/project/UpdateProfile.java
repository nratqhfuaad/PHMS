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
import jdbc.JDBC;
/**
 *
 * @author 0wner
 */
public class UpdateProfile extends HttpServlet {

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
    ResultSet rs = null;
    String sql;
    JDBC jdbcUtility = new JDBC();

    public void init() {
        con = jdbcUtility.db1_connect();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

            
            String pname = request.getParameter("pname");
            String ppassword = request.getParameter("ppassword");
            String pemail = request.getParameter("pemail");
            String pic = request.getParameter("pic");
            String pbirthdate = request.getParameter("pbirthdate");
            String pphone = request.getParameter("pphone");
            String paddress = request.getParameter("paddress");
            String pgender = request.getParameter("pgender");
            String poccupation = request.getParameter("poccupation");
            String pid = request.getParameter("pid");
            
            
            try {
                sql = "UPDATE p_user SET pname = ? , pemail = ?, ppassword  = ?, pic= ?, pbirthdate = ?, pphone = ?, pgender = ?, paddress = ?, poccupation = ? WHERE pid = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                
                pst.setString(1, pname);
                pst.setString(2, pemail);
                pst.setString(3, ppassword);
                pst.setString(4, pic);
                pst.setString(5, pbirthdate);
                pst.setString(6, pphone);
                pst.setString(7, pgender);
                pst.setString(8, paddress);
                pst.setString(9, poccupation);
                pst.setString(10, pid);
                pst.executeUpdate();

                
                
                
            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Update Successful');");
            out.println("location='Profile'");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Profile");
            rd.include(request, response);
//response.sendRedirect("Profile");
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
