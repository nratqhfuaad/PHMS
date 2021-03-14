<%-- Document : index Created on : 10 Jan 2021, 1:53:44 pm Author : iztan --%>
<%@page import="jdbc.JDBC"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="adminS.jsp" %>
<%
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String sql;
    JDBC jdbcUtility = new JDBC();
    
    con = jdbcUtility.db1_connect();
    String date=null,todayC=null,totalC=null,recovC=null,deatC=null;
    try{
        sql = "Select * from report_static order by rs_id DESC";
        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();
        if(rs.next()){
            date = rs.getString("rs_date");
            todayC = rs.getString("today_c");
            totalC = rs.getString("total_c");
            recovC = rs.getString("rec_c");
            deatC = rs.getString("deat_c");
        }
        else{}
    }
    catch(Exception ex){out.println(ex);}
    
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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>PHMS | Admin | Update Cases</title>

    <!-- Google Font: Source Sans Pro -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"
    />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css"/>
    <!-- Tempusdominus Bootstrap 4 -->
    <link
      rel="stylesheet"
      href="https://zealous-wiles-173c86.netlify.app/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"
    />
    <!-- iCheck -->
    <link
      rel="stylesheet"
      href="https://zealous-wiles-173c86.netlify.app/plugins/icheck-bootstrap/icheck-bootstrap.min.css"
    />
    <!-- JQVMap -->
    <link rel="stylesheet" href="https://zealous-wiles-173c86.netlify.app/plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="https://zealous-wiles-173c86.netlify.app/dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link
      rel="stylesheet"
      href="https://zealous-wiles-173c86.netlify.app/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"
    />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="https://zealous-wiles-173c86.netlify.app/plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="https://zealous-wiles-173c86.netlify.app/plugins/summernote/summernote-bs4.min.css" />
  </head>
  <body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"
              ><i class="fas fa-bars"></i
            ></a>
          </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
       
          <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
              <i class="fas fa-expand-arrows-alt"></i>
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              data-widget="control-sidebar"
              data-slide="true"
              href="#"
              role="button"
            >
              <i class="fas fa-th-large"></i>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.navbar -->

      <jsp:include page="sidebar.jsp"></jsp:include>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1 class="m-0">Daily Report <%= request.getAttribute("date")%></h1>
              </div>
              <!-- /.col -->
<!--              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                </ol>
              </div>-->
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        
        <!-- Main content -->
        <section class="content">
          <div class="container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-info">
                  <div class="inner">
                    <h3><%= request.getAttribute("todayC")%></h3>

                    <p>Today Cases</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-bag"></i>
                  </div>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-warning">
                  <div class="inner">
                    <h3><%= request.getAttribute("totalC")%></h3>

                    <p>Total Confirmed Cases</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                  </div>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                  <div class="inner">
                    <h3><%= request.getAttribute("recovC")%></h3>

                    <p>Recovered Cases</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-person-add"></i>
                  </div>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                  <div class="inner">
                    <h3><%= request.getAttribute("deatC")%></h3>

                    <p>Death Cases</p>
                  </div>
                  <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                  </div>
                </div>
              </div>
              <!-- ./col -->
            </div>
            <!-- /.row -->
            <!-- Main row -->
            <div class="row">
                <div class="input-group">
                    <form class="input-group" action="report_stat" method="post">
                        <input placeholder="Date" class="form-control" type="date" name="rsDate" >
                        <input placeholder="Today Cases" class="form-control" type="number" name="rstoday" >
                        <input placeholder="Total Confirmed Cases" class="form-control" type="number" name="rsTotal" >
                        <input placeholder="Recovered Cases" class="form-control" type="number" name="rsRecov" >
                        <input placeholder="Death Cases" class="form-control" type="number" name="rsDeat" >
                        <input class="btn btn-primary" type="submit" value="Submit" >
                    </form>
                </div>
            </div>
            <!-- /.row (main row) -->
          </div>
          <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
      <footer class="main-footer">
        <strong
          >Copyright &copy; PHMS 2020
          </strong
        >
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
        </div>
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <jsp:include page="foot.jsp"/>
  </body>
</html>
