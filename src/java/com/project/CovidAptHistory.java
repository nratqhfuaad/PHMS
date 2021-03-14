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
import model.CovidApt;
import model.ClinicApt;

/**
 *
 * @author user
 */
public class CovidAptHistory extends HttpServlet {

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
    PreparedStatement pst3 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    String sql;
    String sql2;
    String sql3;

    JDBC jdbcUtility = new JDBC();

    public void init() throws ServletException {
        con = jdbcUtility.db1_connect();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //get email of current active user from session
            HttpSession session = request.getSession(true);
            String pemail = (String) session.getAttribute("pemail");
            Vector clinicAptList = new Vector();
            Vector covidAptList = new Vector();
            int pid = 0;
            try {
                //get current user ID 
                sql2 = "SELECT pid FROM p_user WHERE pemail = ?";
                pst2 = con.prepareStatement(sql2);
                pst2.setString(1, pemail);
                rs2 = pst2.executeQuery();

                if (rs2.next()) {
                    pid = rs2.getInt("pid");
                }

            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }

            //select covid-19 screening appointment history
            try {
                sql = "SELECT * FROM bookingcovidscreening WHERE cs_userID = '" + pid + "'";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();

                while (rs.next()) {
                    CovidApt covidapt = new CovidApt();
                    covidapt.setCs_bookingID(rs.getInt("cs_bookingID"));
                    covidapt.setCs_bookingdesc("Covid-19 Sampling Screening");
                    covidapt.setCs_aptdate(rs.getString("cs_aptdate"));
                    covidapt.setCs_apttime(rs.getString("cs_apttime"));
                    covidapt.setCs_screeningtype(rs.getString("cs_screeningtype"));
                    covidapt.setCs_bookingstatus(rs.getString("cs_bookingstatus"));
                    covidAptList.addElement(covidapt);
                }

            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }

            //select covid-19 screening appointment history
            try {
                sql = "SELECT * FROM bookingclinic WHERE BuserID = '" + pid + "'";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();

                while (rs.next()) {
                    ClinicApt clinicapt = new ClinicApt();
                    clinicapt.setBookingID(rs.getInt("bookingID"));
                    clinicapt.setBbookingname("Hospital Johor Bahru Health Clinic");
                    clinicapt.setBDate(rs.getString("BDate"));
                    clinicapt.setBTime(rs.getString("BTime"));
                    clinicapt.setBDesc(rs.getString("BDesc"));
                    clinicapt.setBStatus(rs.getString("BStatus"));
                    clinicAptList.addElement(clinicapt);
                }

            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }
            session.setAttribute("clinicAptList", clinicAptList);
            session.setAttribute("covidAptList", covidAptList);
            request.getRequestDispatcher("/booking_history.jsp").include(request, response);
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
