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
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;
import model.User;

/**
 *
 * @author 0wner
 */
public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Connection con;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql;
    private JDBC jdbcUtility = new JDBC();

    public void init() throws ServletException
    {   
        con = jdbcUtility.db1_connect();
    } 
    
   
  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        
        User user = new User();
        HttpSession session = request.getSession(true);
        String email = (String)session.getAttribute("pemail");
        
        
        try{
            sql = "SELECT * FROM p_user WHERE pemail = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, email);
            rs = pst.executeQuery();
            
          if(rs.next()){
              int pid = rs.getInt("pid");
              String pname = rs.getString("pname");
              String pemail = rs.getString("pemail");
              String ppassword = rs.getString("ppassword");
              String pic = rs.getString("pic");
              String pbirthdate = rs.getString("pbirthdate");
              String pphone = rs.getString("pphone");
              String paddress = rs.getString("paddress");
              String pgender = rs.getString("pgender");
              String poccupation = rs.getString("poccupation");
              String phealthstatus = rs.getString("phealthstatus");


              user.setPid(pid);
              user.setPname(pname);
              user.setPemail(pemail);
              user.setPpassword(ppassword);
              user.setPic(pic);
              user.setPbirthdate(pbirthdate);
              user.setPphone(pphone);
              user.setPaddress(paddress);
              user.setPgender(pgender);
              user.setPoccupation(poccupation);
              user.setPhealthstatus(phealthstatus);
              
              request.setAttribute("data", user);
                
              RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
              rd.include(request,response);
          }  
        }
            
             catch (Exception e) {
             out.println(e);
             e.printStackTrace();
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
