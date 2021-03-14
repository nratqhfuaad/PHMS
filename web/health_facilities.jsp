
<%@page import="jdbc.JDBC"%>
<%@ page language="java" %>
<%@ page import ="java.sql.*;"%>

<% 
Connection con;
PreparedStatement pst = null;
ResultSet rs = null;
String sql;
JDBC jdbcUtility = new JDBC();
con = jdbcUtility.db1_connect();

int cID = 0;
String cName = null;
String cDesc = null;
String cPhoneNo  = null;
String cPic = null;

        try{
            sql = "SELECT * FROM clinic";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            
          while(rs.next()){
              cID = rs.getInt("cID");
              cName = rs.getString("cName");
              cDesc = rs.getString("cDesc");
              cPhoneNo = rs.getString("cPhoneNo");
              cPic = rs.getString("cPic");
          }  
        }
            
             catch (Exception e) {
             out.println(e);
             e.printStackTrace();
        }
        
        request.setAttribute("cID", cID);
        request.setAttribute("cName", cName);
        request.setAttribute("cDesc", cDesc);
        request.setAttribute("cPhoneNo", cPhoneNo);
        request.setAttribute("cPic", cPic);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="asset/icon.png" />
    <title>Pandemic Health Care Management System | PHCMS | Health Care</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/business-frontpage.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@700&display=swap"
      rel="stylesheet"
    />
    <link href="css/ham.css" rel="stylesheet" />
  </head>

  <body>
    <!-- Navigation -->
    <jsp:include page="navbar.jsp"></jsp:include>

    <!-- Header -->
    <br><br>
    <!-- Page Content -->
    <div class="container">
      
      <!-- /.row -->

      <br>
      <div class="col-lg-12">
          <h1><b>
              Find health facilities near you!
              </b></h1><hr>
            <p >
              Too far from our facility? Don't worry, you can search the nearest health facilities from your location.
            </p>
      </div><br><br>
      
       <center>
          <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d63815.9622624933!2d103.73430338364248!3d1.4742518329590786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1shealth%20facilities%20near%20me!5e0!3m2!1sen!2smy!4v1606402401617!5m2!1sen!2smy" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe><br></br>   
          <br/>
          <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 50%;
            }



          </style>
          </center>  
      <div class="row">
          
          <%
              try{
            sql = "SELECT * FROM clinic";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            
          while(rs.next()){
              out.println("<div class=\"col-md-4 mb-5\">"+
          "<div class=\"card h-100\">"+
            "<img "+
              "class=\"card-img-top\""+
              "src='"+rs.getString("cPic")+"'"+
            "/>"+
          
            "<div class=\"card-body\">"+
              "<h4><b cid=\"1\">" + rs.getString("cName") + "</b></h4>"+
              "<p class=\"card-text\">" + rs.getString("cDesc")+"</p>"+
              "<p class=\"card-text\"> " +rs.getString("cPhoneNo") + "</p>"+
            "</div>"+
//            "<div class=\"card-footer\">"+
//              "<a href=\"clinic_apt_1.jsp\" class=\"btn btn-primary\">Book now!</a>"+
//            "</div>"+
          "</div>"+
        "</div>");
              
              
              cID = rs.getInt("cID");
              cName = rs.getString("cName");
              cDesc = rs.getString("cDesc");
              cPhoneNo = rs.getString("cPhoneNo");
              cPic = rs.getString("cPic");
          }  
        }
            
             catch (Exception e) {
             out.println(e);
             e.printStackTrace();
        }
           %>

      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">
          Copyright &copy; PHMS 2020
        </p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery/jquery.easing.min.js"></script>
  </body>
</html>

