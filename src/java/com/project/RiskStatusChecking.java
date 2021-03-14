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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;
import model.User;

/**
 *
 * @author user
 */
public class RiskStatusChecking extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {           
            
            String selection1 = request.getParameter("selection1");
            String selection2 = request.getParameter("selection2");
            String selection3 = request.getParameter("selection3");
            String selection4 = request.getParameter("selection4");
            String selection5 = request.getParameter("selection5");
            String selection6 = request.getParameter("selection6");
            
            String symptom = null;
            String risk = null;
            
            //determine symptoms based on selection 1-2         
            if (selection1.equals("yes") || selection2.equals("yes")){
                symptom = "Has Symptoms";                
            }
            else{
                symptom = "No Symptom";
            }
                       
            // add selection 3-6 to arraylist
            ArrayList selectionList = new ArrayList();
            selectionList.add(selection3);
            selectionList.add(selection4);
            selectionList.add(selection5);
            selectionList.add(selection6);
            
            //count the number of 'yes' and 'no' for selection 3-6
            int count_yes = 0;
            int count_no = 0;
            for(int i=0; i<selectionList.size(); i++){
                if (selectionList.get(i).equals("yes")){
                    count_yes ++;
                }
                else{
                    count_no ++;
                } 
            }                      
        
            //determine risk based on selection 3-6
            switch (count_yes) {
                case 0:
                    risk = "Low Risk";
                    break;
                    
                case 1:
                case 2:
                    risk = "Medium Risk";
                    break;
                    
                case 3:
                case 4:
                    risk = "High Risk";
                    break;
                    
                default:
                    break;
            }
            
            //get email of current active user from session
            HttpSession session = request.getSession(true);
            String pemail = (String)session.getAttribute("pemail");
                    
            String healthStatus = risk + " " + symptom;
            
            try {                              
                sql = "UPDATE p_user SET phealthstatus=? WHERE pemail=?";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, healthStatus);
                ps.setString(2, pemail);
                ps.executeUpdate();
                            
            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }
            
            response.sendRedirect("Profile");         
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
