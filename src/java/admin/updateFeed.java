/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.*;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import jdbc.JDBC;
import model.UploadDetail;

@WebServlet(description = "Upload File To The Server", urlPatterns = {"/imgs"})
@MultipartConfig
/**
 *
 * @author iztan
 */
public class updateFeed extends HttpServlet {

    private Connection cnn = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private JDBC db = new JDBC();
    private String sql = null;

    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;

    public void init() {
        cnn = db.db1_connect();
    }

    public static final String UPLOAD_DIR = "imgs";

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
            /* TODO output your page here. You may use following sample code. */

            String uploadPath =  "D:\\xampp\\htdocs\\PHMS\\web\\imgs";

            String newsimg, newstitle, newscontent, newsdate;
            newstitle = request.getParameter("newsTitle");
            newscontent = request.getParameter("newsContent");
            newsdate = request.getParameter("newsDate");

            Part p1 = request.getPart("newsImg");
            String fileName = extractFileName(p1);
            InputStream is = p1.getInputStream();
            File uploads = new File(uploadPath);
            File file = new File(uploads, fileName);
            newsimg = "imgs/"+fileName;
           
            try {
                Files.copy(is, file.toPath());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            try {
                sql = "Insert into news_feed(news_image,news_tittle,news_content,news_date) values(?,?,?,?) ";
                pst = cnn.prepareStatement(sql);
                pst.setString(1, newsimg);
                pst.setString(2, newstitle);
                pst.setString(3, newscontent);
                pst.setString(4, newsdate);

                if (pst.executeUpdate() != 0) {
                    response.sendRedirect("newsFeed");
                } else {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String extractFileName(Part part) {
        String fileName = "",
                contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return fileName;
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
