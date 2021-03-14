<%@ page import="model.CovidApt"%>
<%@ page import="model.ClinicApt"%>
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
    <title>PHMS | Booking History</title>

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
                <h2><b>Booking History</b></h2>
                <hr><br><br>
                <h2>COVID-19 Screening Appointment</h2><br>                
                <table class="col-lg-12 table table-bordered table-hover" border="1"> 
                  <thead>
                    <tr>
                      <th scope="col">No.</th>
                      <th scope="col">Booking ID</th>
                      <th scope="col">Details</th>
                      <th scope="col">Appointment Date</th>
                      <th scope="col">Appointment Time Slot</th>                     
                      <th scope="col">Screening Type</th>
                      <th scope="col">Status</th>
                    </tr>
                  </thead>                 
                  <tbody>
                    <%
                        //get covidAptList vector from session           
                        Vector covidAptList = (Vector) session.getAttribute("covidAptList");
                        
                        int count1 = 0;
                        if(covidAptList != null && (covidAptList.size()>0)){
                            for(int index=0; index<covidAptList.size(); index++){
                                count1++;
                                CovidApt apt1 = (CovidApt) covidAptList.elementAt(index);                                 
                    %>
                    
                    <tr>
                        <td scope="row"><%= count1 %></td>
                        <td><%= apt1.getCs_bookingID()%></td>
                        <td><%= apt1.getCs_bookingdesc()%></td>
                        <td><%= apt1.getCs_aptdate()%></td>
                        <td><%= apt1.getCs_apttime()%></td>
                        <td><%= apt1.getCs_screeningtype()%></td>
                        <td><%= apt1.getCs_bookingstatus()%></td>
                    </tr>
                    <%
                            }              
                        }else{ 
                    %>
                        
                        <td colspan="7">No record(s) found.</td>
                        
                    <%    }                       
                    %>                  
                  </tbody>
                </table><br><br>
            </div>
          
            <div class="col-lg-12">
                <h2>Health Clinic Appointment</h2><br>  
                <table class="table table-bordered table-hover" border="1">
                  <thead>
                    <tr>
                      <th scope="col">No.</th>
                      <th scope="col">Booking ID</th>
                      <th scope="col">Details</th>
                      <th scope="col">Appointment Date</th>
                      <th scope="col">Appointment Time Slot</th>
                      <th scope="col">Description</th>
                      <th scope="col">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                      <%
                        //get clinicAptList vector from session           
                        Vector clinicAptList = (Vector) session.getAttribute("clinicAptList");

                        int count2 = 0;
                        if(covidAptList != null && (clinicAptList.size()>0)){
                            for(int index=0; index<clinicAptList.size(); index++){
                                count2++;
                                ClinicApt apt2 = (ClinicApt) clinicAptList.elementAt(index);                                 
                      %>
                    
                    <tr>
                        <td scope="row"><%= count2 %></td>
                        <td><%= apt2.getBookingID()%></td>
                        <td><%= apt2.getBbookingname()%></td>
                        <td><%= apt2.getBDate()%></td>
                        <td><%= apt2.getBTime()%></td>
                        <td><%= apt2.getBDesc()%></td>
                        <td><%= apt2.getBStatus()%></td>
                    </tr>
                    <%
                            }              
                        }else{ 
                    %>
                        
                        <td colspan="7">No record(s) found.</td>
                        
                    <%    }                       
                    %>
                  </tbody>
                </table><br><br>
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