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
import model.User;

/**
 *
 * @author 0wner
 */
public class LogIn extends HttpServlet {

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
            User user = new User();
            HttpSession session = request.getSession();

            String pemail = request.getParameter("pemail");
            String ppassword = request.getParameter("ppassword");

            try {
                sql = "SELECT * FROM p_user WHERE pemail=?";

                pst = con.prepareStatement(sql);
                pst.setString(1, pemail);
                rs = pst.executeQuery();

                if (rs.next()) {

                    if (rs.getString("poccupation").equals("admin")) {
                        if (rs.getString("pemail").equals(pemail) && rs.getString("ppassword").equals(ppassword)) {
                            
                            int pid = rs.getInt("pid");
                            String pname = rs.getString("pname");
                            pemail = rs.getString("pemail");
                            ppassword = rs.getString("ppassword");
                            String pic = rs.getString("pic");
                            String pbirthdate = rs.getString("pbirthdate");
                            String pphone = rs.getString("pphone");
                            String paddress = rs.getString("paddress");
                            String pgender = rs.getString("pgender");
                            String poccupation = rs.getString("poccupation");

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

                            session.setAttribute("data", user);
                            session.setAttribute("pemail", pemail);

                            response.sendRedirect("admin/");

                        } else {
                            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                            rd.include(request, response);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Wrong email or password !');");
                            out.println("</script>");
                        }
                    } else {
                        if (rs.getString("pemail").equals(pemail) && rs.getString("ppassword").equals(ppassword)) {

                            int pid = rs.getInt("pid");
                            String pname = rs.getString("pname");
                            pemail = rs.getString("pemail");
                            ppassword = rs.getString("ppassword");
                            String pic = rs.getString("pic");
                            String pbirthdate = rs.getString("pbirthdate");
                            String pphone = rs.getString("pphone");
                            String paddress = rs.getString("paddress");
                            String pgender = rs.getString("pgender");
                            String poccupation = rs.getString("poccupation");

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

                            session.setAttribute("data", user);
                            session.setAttribute("pemail", user.getPemail());

                            response.sendRedirect("Profile");

                        } else {
                            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                            rd.include(request, response);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Wrong email or password !');");
                            out.println("</script>");
                        }
                    }

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.include(request, response);
//                    out.println("<script type=\"text/javascript\">");  
//                    out.println("alert('Wrong email or password !');");  
//                    out.println("</script>");
                }

            } catch (Exception e) {
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
