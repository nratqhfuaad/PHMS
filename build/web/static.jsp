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
    <script
      src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
      integrity="sha256-t9UJPrESBeG2ojKTIcFLPGF7nHi2vEc7f5A2KpH/UBU="
      crossorigin="anonymous"
    ></script>
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
        <div class="col-md-8 mb-5">
          <h2>Report and Static</h2>
          <hr />
          <canvas id="myChart" width="400" height="400"></canvas>
          <script>
            var ctx = document.getElementById("myChart").getContext("2d");
            var myChart = new Chart(ctx, {
              type: "bar",
              data: {
                labels: [
                  "Johor",
                  "Kedah",
                  "Kelantan",
                  "Melaka",
                  "Negeri Sembilan",
                  "Pahang",
                  "Perak",
                  "Perlis",
                  "Pulau Pinang,",
                  "Sabah",
                  "Sarawak",
                  "Selangor",
                  "Terengganu",
                  "Kuala Lumpur",
                  "Labuan",
                  "Putrajaya",
                ],
                datasets: [
                  {
                    label: "# of Cases",
                    data: [12, 19, 3, 5, 2, 3, 5, 2, 6, 8, 10, 12, 11, 5, 6, 7],
                    backgroundColor: [
                      "rgba(255, 99, 132, 0.2)",
                      "rgba(54, 162, 235, 0.2)",
                      "rgba(255, 206, 86, 0.2)",
                      "rgba(75, 192, 192, 0.2)",
                      "rgba(153, 102, 255, 0.2)",
                      "rgba(255, 159, 64, 0.2)",
                      "rgb(135, 169, 184,0.2)",
                      "rgb(13, 211, 25, 0.2)",
                      "rgba(48, 150, 133, 0.2)",
                      "rgba(102, 73, 97, 0.2)",
                      "rgba(167, 168, 105, 0.2)",
                      "rgba(6, 234, 102, 0.2)",
                      "rgba(143, 45, 156, 0.2)",
                      "rgba(39, 102, 138, 0.2)",
                      "rgba(244, 246, 23, 0.2)",
                      "rgba(54, 150, 206, 0.2)",
                    ],
                    borderColor: [
                      "rgba(255, 99, 132, 1)",
                      "rgba(54, 162, 235, 1)",
                      "rgba(255, 206, 86, 1)",
                      "rgba(75, 192, 192, 1)",
                      "rgba(153, 102, 255, 1)",
                      "rgba(255, 159, 64, 1)",
                      "rgb(135, 169, 184,1)",
                      "rgb(13, 211, 25, 1)",
                      "rgba(48, 150, 133, 1)",
                      "rgba(102, 73, 97, 1)",
                      "rgba(167, 168, 105, 1)",
                      "rgba(6, 234, 102, 1)",
                      "rgba(143, 45, 156, 1)",
                      "rgba(39, 102, 138, 1)",
                      "rgba(244, 246, 23, 1)",
                      "rgba(54, 150, 206, 1)",
                    ],
                    borderWidth: 1,
                  },
                ],
              },
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true,
                      },
                    },
                  ],
                },
              },
            });
          </script>
        </div>
        <div class="col-md-4 mb-5">
          <h2>Contact Us</h2>
          <hr />
          <address>
            <strong>PHMS</strong>
            <br />
          </address>
          <address>
            <abbr title="Phone">P:</abbr>
            (123) 456-7890
            <br />
            <abbr title="Email">E:</abbr>
            <a href="mailto:#">name@example.com</a>
          </address>
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
