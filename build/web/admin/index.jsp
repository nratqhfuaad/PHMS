<%-- Document : index Created on : 10 Jan 2021, 1:53:44 pm Author : iztan --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jdbc.JDBC"%>
<%@page import="java.sql.*"%>

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
    <title>PHMS | Admin</title>

    <!-- Google Font: Source Sans Pro -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"
    />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css"/>
    
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
                <h1 class="m-0">Dashboard</h1>
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

                    <p>Total Cases</p>
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
              <!-- Left col -->
              <section class="col-lg-7 connectedSortable">
                <!-- Custom tabs (Charts with tabs)-->
                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="fas fa-chart-pie mr-1"></i>
                      Total Cases
                    </h3>
                    <div class="card-tools">
                      <ul class="nav nav-pills ml-auto">
                        <li class="nav-item">
                          <a
                            class="nav-link active"
                            href="#revenue-chart"
                            data-toggle="tab"
                            >Area</a
                          >
                        </li>
                        <li class="nav-item">
                          <a
                            class="nav-link"
                            href="#sales-chart"
                            data-toggle="tab"
                            >Donut</a
                          >
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <div class="tab-content p-0">
                      <!-- Morris chart - Sales -->
                      <div
                        class="chart tab-pane active"
                        id="revenue-chart"
                        style="position: relative; height: 300px"
                      >
                        <canvas
                          id="revenue-chart-canvas"
                          height="300"
                          style="height: 300px"
                        ></canvas>
                      </div>
                      <div
                        class="chart tab-pane"
                        id="sales-chart"
                        style="position: relative; height: 300px"
                      >
                        <canvas
                          id="sales-chart-canvas"
                          height="300"
                          style="height: 300px"
                        ></canvas>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->

                <!-- TO DO List -->
                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="ion ion-clipboard mr-1"></i>
                      To Do List
                    </h3>

                    <div class="card-tools">
                      <ul class="pagination pagination-sm">
                        <li class="page-item">
                          <a href="#" class="page-link">&laquo;</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">1</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">2</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">3</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">&raquo;</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <ul class="todo-list" data-widget="todo-list">
                      <li>
                        <!-- drag handle -->
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <!-- checkbox -->
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo1"
                            id="todoCheck1"
                          />
                          <label for="todoCheck1"></label>
                        </div>
                        <!-- todo text -->
                        <span class="text">Update Daily Cases</span>
                        <!-- Emphasis label -->
                        <small class="badge badge-danger"
                          ><i class="far fa-clock"></i> 2 mins</small
                        >
                        <!-- General tools such as edit or delete-->
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                      <li>
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo2"
                            id="todoCheck2"
                            checked
                          />
                          <label for="todoCheck2"></label>
                        </div>
                        <span class="text">Update State Cases</span>
                        <small class="badge badge-info"
                          ><i class="far fa-clock"></i> 4 hours</small
                        >
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                      <li>
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo3"
                            id="todoCheck3"
                          />
                          <label for="todoCheck3"></label>
                        </div>
                        <span class="text">Update Health Clinic Appointment Status</span>
                        <small class="badge badge-warning"
                          ><i class="far fa-clock"></i> 1 day</small
                        >
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                      <li>
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo4"
                            id="todoCheck4"
                          />
                          <label for="todoCheck4"></label>
                        </div>
                        <span class="text">Update COVID-19 Screening Appointment Status</span>
                        <small class="badge badge-success"
                          ><i class="far fa-clock"></i> 3 days</small
                        >
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                      <li>
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo5"
                            id="todoCheck5"
                          />
                          <label for="todoCheck5"></label>
                        </div>
                        <span class="text"
                          >Check and update consultation list</span
                        >
                        <small class="badge badge-primary"
                          ><i class="far fa-clock"></i> 1 week</small
                        >
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                      <li>
                        <span class="handle">
                          <i class="fas fa-ellipsis-v"></i>
                          <i class="fas fa-ellipsis-v"></i>
                        </span>
                        <div class="icheck-primary d-inline ml-2">
                          <input
                            type="checkbox"
                            value=""
                            name="todo6"
                            id="todoCheck6"
                          />
                          <label for="todoCheck6"></label>
                        </div>
                        <span class="text">Update today's news feed</span>
                        <small class="badge badge-secondary"
                          ><i class="far fa-clock"></i> 1 month</small
                        >
                        <div class="tools">
                          <i class="fas fa-edit"></i>
                          <i class="fas fa-trash-o"></i>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer clearfix">
                    <button type="button" class="btn btn-info float-right">
                      <i class="fas fa-plus"></i> Add item
                    </button>
                  </div>
                </div>
                <!-- /.card -->
              </section>
              <!-- /.Left col -->
              <!-- right col (We are only adding the ID to make the widgets sortable)-->
              <section class="col-lg-5 connectedSortable">
                <!-- Map card -->
                <div class="card bg-gradient-primary">
                  <div class="card-header border-0">
                    <h3 class="card-title">
                      <i class="fas fa-map-marker-alt mr-1"></i>
                      Map
                    </h3>
                    <!-- card tools -->
                    <div class="card-tools">
                      <button
                        type="button"
                        class="btn btn-primary btn-sm daterange"
                        title="Date range"
                      >
                        <i class="far fa-calendar-alt"></i>
                      </button>
                      <button
                        type="button"
                        class="btn btn-primary btn-sm"
                        data-card-widget="collapse"
                        title="Collapse"
                      >
                        <i class="fas fa-minus"></i>
                      </button>
                    </div>
                    <!-- /.card-tools -->
                  </div>
                  <div class="card-body">
                    <div
                      id="world-map"
                      style="height: 250px; width: 100%"
                    ></div>
                  </div>
                  <!-- /.card-body-->
                  <div class="card-footer bg-transparent">
                    <div class="row">
                      <div class="col-4 text-center">
                        <div id="sparkline-1"></div>
                        <div class="text-white">New Cases</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <div id="sparkline-2"></div>
                        <div class="text-white">Recovered Cases</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <div id="sparkline-3"></div>
                        <div class="text-white">Death Cases</div>
                      </div>
                      <!-- ./col -->
                    </div>
                    <!-- /.row -->
                  </div>
                </div>
                <!-- /.card -->

                <!-- Calendar -->
                <div class="card bg-gradient-success">
                  <div class="card-header border-0">
                    <h3 class="card-title">
                      <i class="far fa-calendar-alt"></i>
                      Calendar
                    </h3>
                    <!-- tools card -->
                    <div class="card-tools">
                      <!-- button with a dropdown -->
                      <div class="btn-group">
                        <button
                          type="button"
                          class="btn btn-success btn-sm dropdown-toggle"
                          data-toggle="dropdown"
                          data-offset="-52"
                        >
                          <i class="fas fa-bars"></i>
                        </button>
                        <div class="dropdown-menu" role="menu">
                          <a href="#" class="dropdown-item">Add new event</a>
                          <a href="#" class="dropdown-item">Clear events</a>
                          <div class="dropdown-divider"></div>
                          <a href="#" class="dropdown-item">View calendar</a>
                        </div>
                      </div>
                      <button
                        type="button"
                        class="btn btn-success btn-sm"
                        data-card-widget="collapse"
                      >
                        <i class="fas fa-minus"></i>
                      </button>
                      <button
                        type="button"
                        class="btn btn-success btn-sm"
                        data-card-widget="remove"
                      >
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                    <!-- /. tools -->
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body pt-0">
                    <!--The calendar -->
                    <div id="calendar" style="width: 100%"></div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </section>
              <!-- right col -->
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
