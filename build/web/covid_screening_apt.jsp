
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
    <title>PHMS | COVID-19 Sampling Screening Appointment Form</title>

<!--     Bootstrap core CSS 
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />-->

    <!-- Custom styles for this template -->
    <link href="css/business-frontpage.css" rel="stylesheet" />
<!--    <link rel="preconnect" href="https://fonts.gstatic.com" />-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
<!--    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@700&display=swap"
      rel="stylesheet"
    />-->
<!--    <link href="css/ham.css" rel="stylesheet" />-->
    
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
  </head>
  
  <style>
    .input-group {
        display: block!important;
        position: relative;
        margin-bottom: 22px;
    }
    
    .col-2 {
        width: -webkit-calc((100% - 30px) / 2);
        width: -moz-calc((100% - 30px) / 2);
        width: calc((100% - 30px) / 2);
        flex: none!important;
        max-width: none!important;
    }
  </style>

  <body>
    <!-- Navigation -->
    <jsp:include page="navbar.jsp"></jsp:include>
    
    <!-- Page Content -->
    <div class="page-wrapper p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
<!--                    <img src="asset/logo.png" class="logo-img"/>-->
                    <h2 class="title"><b>COVID-19 Sampling Screening Appointment</b></h2>
                    <form action="CovidScreeningApt" method="post">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">First Name</label>
                                    <input class="input--style-4" type="text" name="cs_firstname" placeholder="Enter your first name" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Last Name</label>
                                    <input class="input--style-4" type="text" name="cs_lastname" placeholder="Enter your last name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">NRIC / Passport No.</label>
                                    <input class="input--style-4" type="text" name="cs_ic" placeholder="Enter your IC" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" name="cs_gender" value="Male" required>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="cs_gender" value="Female">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Contact Number</label>
                                    <input class="input--style-4" type="text" name="cs_contactno" placeholder="Enter your phone number" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Nationality</label>
                                    <input class="input--style-4" type="text" name="cs_nationality" placeholder="Enter your nationality" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Preferred Appointment Date</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4" type="date" name="cs_aptdate" required>
<!--                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <label class="label">Preferred Appointment Time Slot</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="cs_apttime" required> 
                                        <option disabled="disabled" selected="selected" value="">Select time slot</option>
                                        <option value="8:00am - 9:00am">8:00am - 9:00am</option>
                                        <option value="9:00am - 10:00am">9:00am - 10:00am</option>
                                        <option value="10:00am - 11:00am">10:00am - 11:00am</option>
                                        <option value="11:00am - 12:00noon">11:00am - 12:00noon</option>
                                        <option value="12:00noon - 1:00pm">12:00noon - 1:00pm</option>
                                        <option value="1:00pm - 2:00pm">1:00pm - 2:00pm</option>
                                        <option value="2:00pm - 3:00pm">2:00pm - 3:00pm</option>
                                        <option value="3:00pm - 4:00pm">3:00pm - 4:00pm</option>
                                        <option value="4:00pm - 5:00pm">4:00pm - 5:00pm</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>                                                      
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Screening Type</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Drive-Thru
                                            <input type="radio" name="cs_screeningtype" value="Drive-Thru" required>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Walk-In
                                            <input type="radio" name="cs_screeningtype" value="Walk-In">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--red" type="reset">Reset</button>
                            <button class="btn2 btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
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
    
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global_1.js"></script>
  </body>
</html>