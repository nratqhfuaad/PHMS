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
    <title>PHMS | Risk Status Self-Checking</title>

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
    <header class="bg-primary py-5 mb-5">
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-lg-12">
            <h1 class="display-4 text-white mt-10 mb-2">
              <b>Risk Status Self-Checking</b>
            </h1>
            <br><br>
            <p class="lead mb-5 text-white">
                <b>Are you a Low Risk person who has started exhibiting COVID-19 symptoms? 
                    <br><br>Or you had travelled overseas, had contact with a positive COVID-19 patient 
                    or attended any mass gathering in the past 14 days?</b>
            </p>                        
          </div>
        </div>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-md-10 mb-5">
            <h2><b>Health Self-Assessment</b></h2>
            <hr /><br>
          <p>
            If your answer is "Yes" to any of the above, kindly update your health status by checking your risk status.
          </p><br>
          <a class="btn btn-primary btn-lg" href="risk_status_form.jsp">Check Risk Status &raquo;</a>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
