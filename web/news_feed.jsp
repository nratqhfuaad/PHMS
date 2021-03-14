<%@ page import="jdbc.JDBC"%>
<%@ page language="java" %>
<%@ page import ="java.sql.*;"%>
<%@ page import="model.News"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% News news = (News) session.getAttribute("news"); %> 


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
        <title>PHMS | News Feed</title>

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
        <style>
            div {
                text-align: justify;
                text-justify: inter-word;
            }
        </style>
    </head>

    <body>
        <!-- Navigation -->
        <jsp:include page="navbar.jsp"></jsp:include>

            <br/><br/><br/>
            <!-- Page Content -->
            <div class="container">
                <div class="row">


                    <div class="col-lg-12">
                        <h2><b>News Feed</b></h2>
                    <%
                        Vector newsList = (Vector) session.getAttribute("newsList"); //call session vector
                        if (newsList != null && (newsList.size() > 0)) {
                            for (int index = 0; index < newsList.size(); index++) { //looping session vector
                                News n = (News) newsList.elementAt(index);
                    %>

                    <br><br><h4><%= n.getNews_tittle()%> (<%= n.getNews_date()%>)</h4>
                    <hr/><center><img src="<%= n.getNews_image()%>" width="500" height="500"/></center>
                    <br>
                    <%= n.getNews_content()%><br>
                    <!--          <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModalCenter">Read More</button>
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle"><b><%= n.getNews_tittle()%> <br>(<%= n.getNews_date()%>)</b></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                               
                                            <div class="modal-body">
                                            <center> <img src="<%= n.getNews_image()%>" width="500" height="500"/></center><br>     
                                            <p><%= n.getNews_content()%></p>
                                            </div>
                                            
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>   
                                    </div>
                                </div>           
                    -->
                    <%
                            }
                        }
                    %>


                </div>

            </div>
        </div>
        <!-- /.container -->

        <!-- Footer -->
        <br>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">
                    Copyright &copy; PHMS 2020
                </p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script>
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus');
            });
        </script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
