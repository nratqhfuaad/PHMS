/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;

/**
 *
 * @author iztan
 */
public class report_stat extends HttpServlet {

    private Connection con = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql;
    private JDBC jdbcUtility = new JDBC();

    public void init() throws ServletException {
        con = jdbcUtility.db1_connect();
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
            
            HttpSession session = null;
            int todayC,totalC,recovC,deatC;
            String Todate;
            String msg=null;
            Todate = request.getParameter("rsDate"); 
            todayC = Integer.parseInt(request.getParameter("rstoday"));
            totalC = Integer.parseInt(request.getParameter("rsTotal"));
            recovC = Integer.parseInt(request.getParameter("rsRecov"));
            deatC = Integer.parseInt(request.getParameter("rsDeat"));
            request.setAttribute("msg", msg);
            try {
                sql = "insert into report_static(rs_date,today_c,total_c,rec_c,deat_c) "
                        + "values('"+Todate+"',"+todayC+","+totalC+","+recovC+","+deatC+") ";
                pst = con.prepareStatement(sql);
                
                if(pst.executeUpdate()!=0){
                    msg = "Insert Done";
                    response.sendRedirect("statics");
                }
                else{
                    msg = "Not Insert";
                    response.sendRedirect("statics");
                }
                
            } catch (Exception ex) {
                out.println(ex);
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
