<%@page import="jdbc.JDBC"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String sql;
    JDBC jdbcUtility = new JDBC();

    con = jdbcUtility.db1_connect();
    String date = null, todayC = null, totalC = null, recovC = null, deatC = null;
    try {
        sql = "Select * from report_static order by rs_date DESC";
        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();
        if (rs.next()) {
            date = rs.getString("rs_date");
            todayC = rs.getString("today_c");
            totalC = rs.getString("total_c");
            recovC = rs.getString("rec_c");
            deatC = rs.getString("deat_c");
        } else {
        }
    } catch (Exception ex) {
        out.println(ex);
    }
    

    request.setAttribute("date", date);
    request.setAttribute("todayC", todayC);
    request.setAttribute("totalC", totalC);
    request.setAttribute("recovC", recovC);
    request.setAttribute("deatC", deatC);

%>


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
        <title>PHMS | Report & Statistics</title>

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

            <div class="pt-5"></div>

            <!-- statics -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-5">
                        <div class="text-center">
                            <h1>Last Update: <%= request.getAttribute("date")%></h1>
                    </div>
                    <hr />
                    <div class="row text-center">
                        <div class="col">
                            <div class="counter">
                                <i class="fa fa-code fa-2x"></i>
                                <h2
                                    class="timer count-title count-number"
                                    data-to="<%= request.getAttribute("todayC")%>"
                                    data-speed="1500"
                                    ></h2>
                                <p class="count-text">Today's Cases</p>
                            </div>
                        </div>
                        <div class="col">
                            <div class="counter">
                                <i class="fa fa-coffee fa-2x"></i>
                                <h2
                                    class="timer count-title count-number"
                                    data-to="<%= request.getAttribute("totalC")%>"
                                    data-speed="1500"
                                    ></h2>
                                <p class="count-text">Overrall Cases</p>
                            </div>
                        </div>
                        <div class="col">
                            <div class="counter">
                                <i class="fa fa-lightbulb-o fa-2x"></i>
                                <h2
                                    class="timer count-title count-number"
                                    data-to="<%= request.getAttribute("recovC")%>"
                                    data-speed="1500"
                                    ></h2>
                                <p class="count-text">Cases Recovered</p>
                            </div>
                        </div>
                        <div class="col">
                            <div class="counter">
                                <i class="fa fa-bug fa-2x"></i>
                                <h2
                                    class="timer count-title count-number"
                                    data-to="<%= request.getAttribute("deatC")%>"
                                    data-speed="1500"
                                    ></h2>
                                <p class="count-text">Death Cases</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-5">
                    <h2>Report and Statistics</h2>
                    
                    <hr />
                    <canvas id="myChart" width="200" height="100"></canvas>
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
                                    "Putrajaya"
                                ],
                                datasets: [
                                    {
                                        label: "# of Cases",
                                        data: [
                                              //12, 19, 3, 5, 2, 3, 5, 2, 6, 8, 10, 12, 11, 5, 6, 7
                                              <%
                                            try{
                                                sql = "Select * from state_c";
                                                pst = con.prepareStatement(sql);
                                                rs = pst.executeQuery();
                                                while(rs.next()){
                                                    out.println(rs.getInt("state_cases")+","); 
                                                }
                                            }
                                            catch(Exception ee){}
                                              %>
                                        ],
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
                                            "rgba(54, 150, 206, 0.2)"
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
                                            "rgba(54, 150, 206, 1)"
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
        <script src="js/statistics.js"></script>
    </body>
</html>
