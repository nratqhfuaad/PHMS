<%@ page import="model.Consultation"%>
<%@ page import="model.User"%>
<%@ page import="java.util.Vector" %>
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
    <title>PHMS | Consultation History</title>

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
    <br><br><br>
    
    <!-- Page Content -->
    <div class="container min-vh-100">
        <div class="row">
            <div class="col-lg-12">
                <h2><b>Online Consultation History</b></h2>
                <hr><br><br>
                <table class="col-lg-12 table table-bordered table-hover" border="1"> 
                  <thead>
                    <tr>
                      <th scope="col">No.</th>
                      <th scope="col">Consultation ID</th>
                      <th scope="col">Question</th>
                      <th scope="col">Answer</th>
                    </tr>
                  </thead>                 
                  <tbody>
                    <%
                        //get ConsultationList vector from session           
                        Vector ConsultationList = (Vector) session.getAttribute("ConsultationList");
                        
                        int count1 = 0;
                        if(ConsultationList != null && (ConsultationList.size()>0)){
                            for(int index=0; index<ConsultationList.size(); index++){
                                count1++;
                                Consultation consult = (Consultation) ConsultationList.elementAt(index);                                 
                    %>
                    
                    <tr>
                        <td scope="row"><%= count1 %></td>
                        <td><%= consult.getOCID()%></td>
                        <td><%= consult.getOCQuestion()%></td>
                        <td><%= consult.getOCAnswer()%></td>
                    </tr>
                    <%
                            }              
                        }else{ 
                    %>
                        
                        <td colspan="3">No record(s) found.</td>
                        
                    <%    }                       
                    %>                  
                  </tbody>
                </table><br>
            </div>
        </div>
    </div>

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
  </body>
</html>