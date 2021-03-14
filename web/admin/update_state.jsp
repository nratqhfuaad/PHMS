<%-- Document : index Created on : 10 Jan 2021, 1:53:44 pm Author : iztan --%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="adminS.jsp" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phms" user="root"  password=""/>  

<sql:query dataSource="${db}" var="rs">  
    SELECT * from state_c;  
</sql:query>  

<%
    String msg = (String) request.getAttribute("Msg");
    if (msg == null) {
        msg = "";
    } else {
        msg = request.getAttribute("Msg").toString();
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>PHMS | Admin | Update States</title>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            .highlighted {
                background-color: black;
                color: #fff;
            }
        </style>
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
                                    <h1 class="m-0">Report & Statistics for States <%= msg%></h1>
                            </div>
                            <!-- /.col -->
<!--                            <div class="col-sm-6">
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
                        <!-- /.row -->
                        <!-- Main row -->
                        <div class="row">
                            <div class="input-group">
                                <form class="input-group" action="updateState" method="post">
                                    <input class="form-control" type="text" placeholder="State" id="stateName" name="stateName" readonly="">
                                    <input class="form-control" type="number" placeholder="Cases" id="stateC" name="stateC" >
                                    <input class="form-control" type="date" id="lastUpdate" name="lastUpdate" >
                                    <input class="btn btn-primary" type="submit" value="Submit" >
                                </form>
                            </div>
                        </div>
                        <!-- /.row (main row) -->
                        <!--second row-->
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="col-lg-12 table" id="tableID">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>State</th>
                                            <th>Cases</th>
                                            <th>Last Update</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="table" items="${rs.rows}">  
                                            <tr>  
                                                <td><c:out value="${table.state_ID}"/></td>  
                                                <td><c:out value="${table.state_name}"/></td>  
                                                <td><c:out value="${table.state_cases}"/></td>  
                                                <td><c:out value="${table.last_update}"/></td>  
                                            </tr>  
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                        </div>

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

        <script>

            $(document).ready(function () {

                var table = document.getElementById("tableID");
                var thead = table.getElementsByTagName("thead")[0];
                var tbody = table.getElementsByTagName("tbody")[0];
                var ishigh;

                tbody.onclick = function (e) {
                    e = e || window.event;
                    var td = e.target || e.srcElement
                    var row = td.parentNode;
                    if (ishigh && ishigh != row) {
                        ishigh.className = '';
                    }
                    row.className = row.className === "highlighted" ? "" : "highlighted";
                    ishigh = row;

                    populateFields(row);
                }

                document.onkeydown = function (e) {
                    e = e || event;
                    var code = e.keyCode,
                            rowslim = table.rows.length - 2,
                            newhigh;
                    if (code === 38) { //up arraow
                        newhigh = rowindex(ishigh) - 2;
                        if (!ishigh || newhigh < 0) {
                            return GoTo('tableID', rowslim);
                        }
                        return GoTo('tableID', newhigh);
                    } else if (code === 40) { //down arrow
                        newhigh = rowindex(ishigh);
                        if (!ishigh || newhigh > rowslim) {
                            return GoTo('tableID', 0);
                        }
                        return GoTo('tableID', newhigh);
                    }
                }

                function GoTo(id, nu) {
                    var obj = document.getElementById(id),
                            trs = obj.getElementsByTagName('TR');
                    nu = nu + 1;
                    if (trs[nu]) {
                        if (ishigh && ishigh != trs[nu]) {
                            ishigh.className = '';
                        }
                        trs[nu].className = trs[nu].className == "highlighted" ? "" : "highlighted";
                        ishigh = trs[nu];
                    }

                    populateFields(trs[nu]);
                }

                function rowindex(row) {
                    var rows = table.rows,
                            i = rows.length;
                    while (--i > -1) {
                        if (rows[i] === row) {
                            return i;
                        }
                    }
                }

                function el(id) {
                    return document.getElementById(id);
                }

                function populateFields(row) {
                    el('stateName').value = row.cells[1].innerHTML;
                    el('stateC').value = row.cells[2].innerHTML;
                    el('lastUpdate').value = row.cells[3].innerHTML;
                }

            }); //end of nested function

        </script>

    </body>
</html>
