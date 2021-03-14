<%@ page import="jdbc.JDBC"%>
<%@ page language="java" %>
<%@ page import ="java.sql.*;"%>
<%@ page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) request.getAttribute("data");%>

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
        <title>PHMS | Profile</title>

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
            <div class="container">
                <div class="row">
                    <div class="col-md-8 mb-5">
                        <h2>Profile</h2>
                        <hr />
                        <form>
                            <div class="form-group row">
                                <label for="Name" class="col-sm-2 col-form-label">Name</label>
                                <label for="BirthDate" class="col-sm-8 col-form-label"><%=user.getPname()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="BirthDate" class="col-sm-2 col-form-label">Birth Date</label>
                            <label for="BirthDate" class="col-sm-8 col-form-label"><%=user.getPbirthdate()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="PHMSID" class="col-sm-2 col-form-label">PHMS ID</label>
                            <label for="PHMSID" class="col-sm-8 col-form-label"><%=user.getPid()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="ICNo" class="col-sm-2 col-form-label">IC No.</label>
                            <label for="ICNo" class="col-sm-8 col-form-label"><%=user.getPic()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="EmailAddress" class="col-sm-2 col-form-label">Email Address</label>
                            <label for="EmailAddress" class="col-sm-8 col-form-label"><%=user.getPemail()%></label>                    
                        </div>
                        <div class="form-group row">
                            <label for="HomeAddress" class="col-sm-2 col-form-label">Home Address</label>
                            <label for="HomeAddress" class="col-sm-8 col-form-label"><%=user.getPaddress()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="PhoneNo" class="col-sm-2 col-form-label">Phone No</label>
                            <label for="PhoneNo" class="col-sm-8 col-form-label"><%=user.getPphone()%></label>
                        </div>
                        <div class="form-group row">
                            <label for="Gender" class="col-sm-2 col-form-label">Gender</label>
                            <label for="Gender" class="col-sm-8 col-form-label"><%=user.getPgender()%></label>
                        </div>   
                        <div class="form-group row">
                            <label for="Occupation" class="col-sm-2 col-form-label">Occupation</label>
                            <label for="Occupation" class="col-sm-8 col-form-label"><%=user.getPoccupation()%></label>
                        </div>                     
                    </form>

                    <center>
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Update Profile</button>
                    </center>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Update Profile</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                </form>

                                <div class="modal-body">
                                    <form action="UpdateProfile" method="POST">
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Name:</label>
                                            <input type="text" class="form-control" id="pname" name="pname"  placeholder="" value="<%=user.getPname()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Birth Date:</label>
                                            <input type="date" class="form-control" id="pbirthdate" name="pbirthdate" placeholder="" value="<%=user.getPbirthdate()%>">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" id="pid" name="pid" placeholder="" value="<%=user.getPid()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">IC No:</label>
                                            <input type="text" class="form-control" id="pic" name="pic" placeholder="" value="<%=user.getPic()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Email Address:</label>
                                            <input type="text" class="form-control" id="pemail" name="pemail" placeholder="" value="<%=user.getPemail()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Password:</label>
                                            <input type="password" class="form-control" id="myInput" name="ppassword"  placeholder="" value="<%=user.getPpassword()%>">
                                            &nbsp;<input type="checkbox" onclick="myFunction()">&nbsp;Show Password 
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Home Address:</label>
                                            <input type="text" class="form-control" id="paddress" name="paddress" placeholder="" value="<%=user.getPaddress()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Phone No:</label>
                                            <input type="text" class="form-control" id="pphone" name="pphone" placeholder="" value="<%=user.getPphone()%>">
                                        </div>
                                        <label for="recipient-name" class="col-form-label">Gender:</label><br>  
                                        <div class="form-check form-check-inline">
                                            <input <%=user.getPgender().equals("Female") ? "checked='checked'" : ""%> class="form-check-input" type="radio" name="pgender" id="Female" value="Female">
                                            <label class="form-check-label" for="pgender">Female</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input <%=user.getPgender().equals("Male") ? "checked='checked'" : ""%> class="form-check-input" type="radio" name="pgender" id="Male" value="Male">
                                            <label class="form-check-label" for="pgender">Male</label>
                                        </div><br>
                                        &nbsp;
                                        <!--                              <div class="form-group">
                                                                        <label for="recipient-name" class="col-form-label">Occupation:</label>
                                                                        <input type="text" class="form-control" id="poccupation" name="poccupation"  value="<%=user.getPoccupation()%>">
                                                                      </div>-->
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Occupation:</label>
                                            <select class="form-control" name="poccupation" id="exampleFormControlSelect1">
                                                <option <%=user.getPoccupation().equals("Government Sector") ? "selected='selected'" : ""%> value="Government Sector">Government Sector</option>
                                                <option <%=user.getPoccupation().equals("Private Sector") ? "selected='selected'" : ""%> value="Private Sector">Private Sector</option>
                                                <option <%=user.getPoccupation().equals("Self-Employed") ? "selected='selected'" : ""%> value="Self-Employed">Self-Employed</option>
                                                <option <%=user.getPoccupation().equals("Student") ? "selected='selected'" : ""%> value="Student">Student</option>
                                                <option <%=user.getPoccupation().equals("Others") ? "selected='selected'" : ""%> value="Others">Others</option>
                                            </select>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-warning">Save Changes</button>
                                        </div>

                                    </form>
                                </div>


                            </div>
                        </div>
                    </div>
                    <br></br>



                </div>
                <div class="col-md-4 mb-5">
                    <h2></h2>
                    <center><img class="img-profile rounded-circle" src="css/dp.png"  width="150" height="150"/>
                        <strong></strong>
                        <br><br />
                        <%=user.getPname()%><br />
                        
                        <%
                            String healthstatus = (String) user.getPhealthstatus();
                            if (healthstatus.equals("Not Updated")) {
                                out.println("<a href=\"risk_status_checking.jsp\" style=\"color:red;\">Update Your Health Status</a><br><br>");
                            } else {
                                out.println(healthstatus + "<br><br>");
                            }
                        %>   

                    </center>
                </div>
            </div>
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
        <script>
            function myFunction() {
                var x = document.getElementById("myInput");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
