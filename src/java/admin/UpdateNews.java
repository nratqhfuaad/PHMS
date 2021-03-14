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
public class UpdateNews extends HttpServlet {

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

            
            int news_id = Integer.parseInt(request.getParameter("newsID"));
            String news_title = request.getParameter("newsTitle");
            String news_content = request.getParameter("newsContent");
            String news_date = request.getParameter("newsDate");

            
            
            try {
                sql = "UPDATE news_feed SET news_tittle = ?, news_content = ?, news_date = ? WHERE news_id = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                
                pst.setString(1, news_title);
                pst.setString(2, news_content);
                pst.setString(3, news_date);
                pst.setInt(4, news_id);
                pst.executeUpdate();

                out.print("sql");
                
            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }

//            out.print(news_title);
//            out.print(news_content);
//            out.print(news_date);
            RequestDispatcher rd = request.getRequestDispatcher("NewsUpdate");
            rd.forward(request, response);
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
