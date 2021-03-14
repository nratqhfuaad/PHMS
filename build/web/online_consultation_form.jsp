
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
    <title>PHMS | Online Consultation</title>

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
                    <h2 class="title"><b>Quick Question? Talk to a doctor now!</b></h2>
                    <h5>This free chat session will help you answer your health concerns quickly. <br>
                        Our online healthcare providers will answers all of your questions.</h5><br><br>
                    <form action="OnlineConsultation" method="post">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Name</label>
                                    <input class="input--style-4" type="text" name="OCName" placeholder="Enter your name" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email Address</label>
                                    <input class="input--style-4" type="text" name="OCEmail" placeholder="Enter your email address" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-12">
                                <div class="input-group">
                                    <label class="label">Question</label>
                                    <textarea class="input--style-4" style="border:none;" rows="3" cols="87" type="text" name="OCQuestion" placeholder="Write your question..." required></textarea>
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