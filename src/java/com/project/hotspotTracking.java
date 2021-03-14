/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBC;
import model.User;

/**
 *
 * @author iztan
 */
public class hotspotTracking extends HttpServlet {

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
            User user = new User();
            HttpSession session = request.getSession();
            String getName;
            String uname = null, display = null;
            Double lng, lat;

            if (session.getAttribute("data") != null) {
                user = (User) session.getAttribute("data");
                getName = user.getPname();
                request.setAttribute("uname", getName);

                uname = (String) request.getAttribute("uname");
            } else {
                uname = null;
            }

            request.getRequestDispatcher("hotspot_tracker.jsp").include(request, response);
            request.getRequestDispatcher("js_map.jsp").include(request, response);
            out.println("<input name='long' type='hidden' id='long'/>");
            out.println("<input name='lat' type='hidden' id='lat'/>");
            out.println("<script src=\"vendor/jquery/jquery.min.js\"></script>\n"
                    + "<script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>");
                        
            lng = Double.parseDouble(request.getParameter("lng"));
            lat = Double.parseDouble(request.getParameter("lat"));

            if (lng == 0) {
                display = "hide";
            } else {
                display = "";
            }
            request.setAttribute("display", display);
            out.println("");

            request.setAttribute("lat", lat);
            request.setAttribute("lng", lng);

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            String sql;
            JDBC jdbcUtility = new JDBC();

            con = jdbcUtility.db1_connect();
            String states = null, stateName = null;
            int stateC = 0;

            if (lat != 0 && lng != 0) {
                lat = lat;
                lng = lng;
            } else {
                lat = 0.0;
                lng = 0.0;
            }

            if (lat < 2.038310973 && lng < 103.7300402) {
                states = "Johor";
            } else if (lat < 2.206414407 && lng < 102.2464615) {
                states = "Melaka";
            } else if (lat < 6.113307718 && lng < 100.4793343) {
                states = "Kedah";
            } else if (lat < 6.119973978 && lng < 102.2299768) {
                states = "Kelantan";
            } else if (lat < 2.710492166 && lng < 101.9400203) {
                states = "NegeriS";
            } else if (lat < 4.18400112 && lng < 103.3200394) {
                states = "Pahang";
            } else if (lat < 4.864960143 && lng < 100.7199914) {
                states = "Perak";
            } else if (lat < 6.433001991 && lng < 100.1899987) {
                states = "Perlis";
            } else if (lat < 5.417071146 && lng < 100.4000109) {
                states = "PulauP";
            } else if (lat < 5.979982523 && lng < 118.3359704) {
                states = "Sabah";
            } else if (lat < 4.399923929 && lng < 113.9845048) {
                states = "Sarawak";
            } else if (lat < 3.166665872 && lng < 101.701947) {
                states = "Selangor";
            } else {
                states = "Terrenganu";
            }

            try {
                sql = "Select * from state_c where state_name = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, states);
                rs = pst.executeQuery();
                if (rs.next()) {
                    stateC = rs.getInt("state_cases");
                } else {
                }
                request.setAttribute("stateC", stateC);
            } catch (Exception ex) {
                out.println(ex);
            }

            //
            String pname, cases, check, warning;
            cases = String.valueOf(stateC);
            if (uname != null) {
                pname = uname;
            } else {
                pname = "";
            }

            if (cases != null) {
                cases = String.valueOf(stateC);
                check = "none";
                warning = "";
            } else {
                cases = "No";
                check = "";
                warning = "none";
            }
            request.setAttribute("pname", pname);
            request.setAttribute("cases", cases);
            request.setAttribute("check", check);
            request.setAttribute("warning", warning);
            request.getRequestDispatcher("displayHotspot.jsp").include(request, response);
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
