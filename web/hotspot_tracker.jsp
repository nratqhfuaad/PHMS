<%@page import="jdbc.JDBC"%>
<%@page import="java.sql.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <style>
            .hide{
                display: none!important;
            }
        </style>
    </head>

    <body>
        <!-- Navigation -->
        <jsp:include page="navbar.jsp"></jsp:include>

            <br/><br/><br/>
            <!-- Page Content -->
            <div class="container">

                <div class="col-md-13 mb-5">
                    <h2>Hotspot Tracker</h2>
                    <hr /><button id='checklot' class='btn ' >Check </button>
                    <center>

                        <div id="mapholder"></div>


                        <div class="border bg-gray-900 text-white">
                        <%--<jsp:include page="displayHotspot.jsp"/>--%>
                    
