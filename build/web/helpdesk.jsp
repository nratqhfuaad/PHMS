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
    <style>
      .help-img {
      }
      .help-img > img {
        width: 50%;
        float: left;
      }
      form {
        width: 50%;
        float: left;
        background-color: #f7f7f7;
        padding: 2%;
        border-radius: 5px;
      }
      .form-control {
        margin-bottom: 10px;
        border: none;
        border-bottom: 1px solid rgb(124, 124, 124);
      }
    </style>
  </head>

  <body>
    <!-- Navigation -->
    <jsp:include page="navbar.jsp"></jsp:include>

    <!-- Header -->
    <header class="bg-primary py-5 mb-5">
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-lg-12">
            <h1 class="display-4 text-white mt-5 mb-2">
              Business Name or Tagline
            </h1>
            <p class="lead mb-5 text-white-50">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non
              possimus ab labore provident mollitia. Id assumenda voluptate
              earum corporis facere quibusdam quisquam iste ipsa cumque unde
              nisi, totam quas ipsam.
            </p>
          </div>
        </div>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-md-12 mb-5">
          <h2>Enter Your Enquiries</h2>
          <hr />

          <div>
            <div>
              <form class="md-form">
                <h4>Name:</h4>
                <input
                  class="form-control"
                  type="text"
                  name="name"
                  required=""
                  placeholder="Your Full Name"
                />
                <h4>Email:</h4>
                <input
                  class="form-control"
                  type="email"
                  name="email"
                  required=""
                  placeholder="Your Email"
                />
                <h4>Title:</h4>
                <select name="title" required class="form-control">
                  <option value="">1</option>
                  <option value="">1</option>
                  <option value="">1</option>
                  <option value="">Others</option>
                </select>
                <h4>Description:</h4>
                <textarea class="form-control" name="description"></textarea>
                <br />
                <input class="btn btn-primary" type="submit" value="Submit" />
              </form>
              <div class="help-img">
                <img src="css/undraw_Accept_request.svg" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">
          Copyright &copy; Your Website 2020
        </p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
