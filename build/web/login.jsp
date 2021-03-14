<%@page import="jdbc.JDBC"%>
<%@ page language="java" %>
<%@ page import ="java.sql.*;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="asset/icon.png" />
        <title>
            PHMS | Pandemic Healthcare Management System
        </title>
        <link href="css/login.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="vendor/bootstrap.js"></script>

        <style>
            .col-lg-5{
                width: 50%;
                float: left;
            }
            input[type=radio]{
                width: auto;
                min-width: auto;
            }
            .genders{
                display: inline-flex;
            }
            .input-error{
                font-size: 12px;
                color: #ea3737;
                padding-left: 5px;
                display: none;
            }
            select {
                display: block;
                width: 100%;
                font-size: 14pt;
                line-height: 28pt;
                font-family: "Fjalla One";
                margin-bottom: 28pt;
                border: none;
                border-bottom: 5px solid black;
                background: #f8f4e5;
                min-width: 250px;
                padding-left: 5px;
                outline: none;
                color: black;
            }
            
            label{
                font-family: "Fjalla One";
            }
        </style>
    </head>
    <body>
        <!-- LOGIN -->
        <div class="login active">
            <form autocomplete="off" action="LogIn" method="POST">
                <h3><label for="email" class="label label-default">Email</label></h3>  
                <input type="email" placeholder="Enter your email" name="pemail" required />

                <h3><label for="password" class="label label-default">Password</label></h3> 
                <input type="password" placeholder="Enter your password" name="ppassword" required/>
                <input type="submit" value="LOGIN" />
            </form>
            <div class="signup-btn">
                <a href="javascript:void(0)" id="signup">SIGN UP</a>
            </div>
        </div>

        <!-- SIGNUP -->
        <div class="signup">
            <form autocomplete="off" action="SignUp" method="POST">
                <div class="col-lg-5">
                    <h3><label for="pemail" class="label label-default">Email</label></h3>  
                    <input type="email" placeholder="Enter your email" name="pemail" value=""required />        
                </div>

                <div class="col-lg-5">
                    <h3><label for="ppassword" class="label label-default">Password</label></h3>    
                    <input id="ppass" type="password" placeholder="Enter your password" name="ppassword" value="" required />
                    <span class="input-error" id="password_alert"></span>
                </div>

                <div class="col-lg-5">
                    <h3><label for="pname" class="label label-default">Name</label></h3>  
                    <input type="text" placeholder="Enter your full name" name="pname" value="" required />
                </div>

                <div class="col-lg-5">
                    <h3><label for="pic" class="label label-default">I/C</label></h3> 
                    <input id="pic" type="number" placeholder="Enter your I/C (No '-' needed)" name="pic" value=""/>
                    <span class="input-error" id="ic_alert"></span>
                </div>

                <div class="col-lg-5">
                    <h3><label for="pgender" class="label label-default">Gender</label></h3> 
                    <div class="genders">
                        <input id="female" type="radio" name="pgender" value="Female" required="">
                        <label class="radio-inline" for="female">Female</label>
                    </div>
                    <div class="genders">
                        <input id="male" type="radio" name="pgender" value="Male" required="">
                        <label for="male" class="radio-inline">Male</label>    
                    </div>
                </div>

                <div class="col-lg-5">
                    <h3><label for="pname" class="label label-default">Birth Date</label></h3> 
                    <input id="pbirthdate" type="date" placeholder="Date" name="pbirthdate" value="" required />    
                </div>

                <div class="col-lg-5">
                    <h3><label for="pphone" class="label label-default">Phone</label></h3> 
                    <input type="text" placeholder="Enter your phone number" name="pphone" value="" required />    
                </div>

                <div class="col-lg-5">
                    <h3><label for="paddress" class="label label-default">Address</label></h3> 
                    <input id="paddress" type="text" placeholder="Enter your address" name="paddress" value="" required />
                </div>

                <div class="col-lg-5">
                    <h3><label for="poccupation" class="label label-default">Occupation</label></h3>
                    <!--<input type="text" placeholder="Occupation" name="poccupation" value="" required >-->
                    <select name="poccupation" required="" class="">
                        <option disabled="disabled" selected="selected" value="">Select occupation</option>
                        <option value="Government Sector">Government Sector</option>
                        <option value="Private Sector">Private Sector</option>
                        <option value="Self-Employed">Self-Employed</option>
                        <option value="Student">Student</option>
                        <option value="Others">Others</option>
                    </select>
                </div>

                <input type="submit" value="SIGN UP" />
            </form>

            <div class="signup-btn">
                <a href="javascript:void(0)" id="login">LOGIN</a>
            </div>
        </div>

        <!-- END -->

        <script>
            // password validation
            function isValidPassword(selector) {
                var field = $(selector);
                var pw = field.val();
                var isValid = true;

                if (pw.length < 5) {
                    isValid = false;
                }
                return isValid;
            }

            $(document).on("input", "#ppass", function () {
                var alert = $("#password_alert");
                var pw = $(this).val();

                if (!isValidPassword("#ppass")) {
                    alert.css("display", "block");
                    alert.text("Password must be more than 5 letters");
                } else {
                    alert.css("display", "none");
                    alert.text("");
                }

                if (pw === null) {
                    $("#password1_alert").css("display", "none");
                    $("#password1_alert").text("");
                }
            });

            function getIcBirthDate(selector) {
                var birthDate = $(selector);
                var dd = birthDate.val().substring(4,6);
                var mm = birthDate.val().substring(2,4);
                var yyyy = "19" + birthDate.val().substring(0,2);
                return yyyy+"-"+mm+"-"+dd;
            }
            
            function iclength(selector){
                var icL = $(selector).val();
                var icbool = true;
                if(icL.length < 12){
                    icbool = false;
                }
                else{
                    icbool = true;
                }
                return icbool;
            }

            $(document).on("input", "#pic", function () {
                
                //pbirthdate
                var icdate = getIcBirthDate("#pic");
                $("#pbirthdate").val(icdate);
                var icalert = $("#ic_alert");
                if(!iclength("#pic")){
                    icalert.text("IC length is incorrent");
                    icalert.css("display", "block");
                }
                else{
                    icalert.text("");
                    icalert.css("display", "none");
                }

            });

        </script>
    </body>
</html>

