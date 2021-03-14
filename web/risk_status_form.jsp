<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">

        <!-- Title Page-->
        <link rel="icon" href="asset/icon.png" />
        <title>PHMS | Risk Status Checking Form</title>

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
        <link href="css/sb-admin-2.min.css" rel="stylesheet" />
        <link href="css/business-frontpage.css" rel="stylesheet" />

        <style>
            .label,.label-bullet{
                width: 100%!important;
            }
            .btn{
                line-height: 50px!important;
                padding: 0 50px!important;
                -webkit-transition: all 0.4s ease;
                -o-transition: all 0.4s ease;
                -moz-transition: all 0.4s ease;
                transition: all 0.4s ease;
                font-size: 18px!important;
                color: #fff!important;
                background: #ff4d4d!important;
            }
            
            footer{
                background-color:#5a5c69 !important;
            }
        </style>
    </head>

    <body>
        <div class="page-wrapper p-t-130 p-b-100 font-poppins">
            <jsp:include page="navbar.jsp"/>
            <div class="wrapper wrapper--w680">
                <div class="card card-4">
                    <div class="card-body">
<!--                        <img src="asset/logo.png" class="logo-img"/>-->
                        <h2 class="title"><b>Risk Status Checking Form</b></h2>
                        <form action="RiskStatusChecking" method="post">
                            <div class="input-group">
                                <label class="label">1. Are you exhibiting 2 or more symptoms as listed below?</label>
                                <label class="label-bullet">
                                    <ul>
                                        <li>Fever</li>  
                                        <li>Chills</li>
                                        <li>Shivering (rigor)</li>
                                        <li>Body ache</li>
                                        <li>Headache</li>
                                        <li>Sore throat</li>
                                        <li>Nausea or vomiting</li>
                                        <li>Diarrhea</li>
                                        <li>Fatigue</li>
                                        <li>Runny nose or nasal congestion</li>                               
                                    </ul>
                                </label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection1" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection1" value="no">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <br><br>
                                <label class="label">2. Besides the above, are you exhibiting any of the symptoms listed below?</label>
                                <label class="label-bullet">
                                    <ul>
                                        <li>Cough</li>  
                                        <li>Difficulty breathing</li>
                                        <li>Loss of smell</li>
                                        <li>Loss of taste</li>                                                           
                                    </ul>
                                </label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection2" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection2" value="no" >
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <br><br>
                                <label class="label">3. Have you attended any event / areas associated with known COVID-19 cluster?</label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection3" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection3" value="no">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <br><br>
                                <label class="label">4. Have you travelled to any country outside Malaysia within 14 days before onset of symptoms?</label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection4" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection4" value="no">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <br><br>
                                <label class="label">5. Have you had close contact to confirmed or suspected case of COVID-19 within 14 days before onset of illness?</label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection5" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection5" value="no">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <br><br>
                                <label class="label">6. Are you a MOH COVID-19 volunteer in the last 14 days?</label>
                                <div class="p-t-10">
                                    <label class="radio-container m-r-45">Yes
                                        <input type="radio" name="selection6" value="yes" required>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="radio-container">No
                                        <input type="radio" name="selection6" value="no">
                                        <span class="checkmark"></span>
                                    </label>
                                </div><br>
                            </div>
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
    <footer class="footer py-5">
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
        <script src="js/global.js"></script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->