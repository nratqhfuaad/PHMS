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
import java.util.ArrayList;
import java.util.Vector;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;
import model.News;

/**
 *
 * @author 0wner
 */
public class NewsFeed extends HttpServlet {

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
        
               
        HttpSession session = request.getSession(true);
        
        try{
            sql = "SELECT * FROM news_feed";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            Vector newsList = new Vector ();   
            
          while(rs.next()){
              News news = new News();
              
              news.setNews_id(rs.getInt("news_id"));
              news.setNews_image(rs.getString("news_image"));
              news.setNews_tittle(rs.getString("news_tittle"));
              news.setNews_content(rs.getString("news_content"));
              news.setNews_date(rs.getString("news_date"));              
              newsList.addElement(news);
              



          }  
              session.setAttribute("newsList",newsList);
              RequestDispatcher rd = request.getRequestDispatcher("/news_feed.jsp");
              rd.include(request,response);
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
