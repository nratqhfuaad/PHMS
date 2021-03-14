<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="adminS.jsp" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/phms" user="root"  password=""/>  

<sql:query dataSource="${db}" var="rs">  
    SELECT * from bookingcovidscreening;  
</sql:query>  

<%    String msg = (String) request.getAttribute("Msg");
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
        <title>PHMS | Admin | COVID-19 Screening Appointment</title>

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
            button{
                background: transparent;
                border: none;
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
                                    <h1 class="m-0">COVID-19 Sampling Screening Appointment List <%= msg%></h1>
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
                                <form class="input-group" action="ManageCovidApt" method="post">
                                    <input placeholder="Booking ID" class="form-control" type="text" id="cs_bookingID" name="cs_bookingID" readonly="">
                                    <input placeholder="Full Name" class="form-control" type="text" id="cs_fullname" name="cs_fullname" readonly="">
                                    <input placeholder="Appointment Date" class="form-control" type="text" id="cs_aptdate" name="cs_aptdate" readonly="">
                                    <input placeholder="Appointment Time " class="form-control" type="text" id="cs_apttime" name="cs_apttime" readonly="">
                                    <select class="form-control" name="cs_bookingstatus"> 
                                        <option disabled="disabled" selected="selected" value="">Select status</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Approved">Approved</option>
                                        <option value="Rejected">Rejected</option>
                                        <option value="Completed">Completed</option>
                                    </select>
                                    <input class="btn btn-primary" type="submit" value="Submit" >
                                </form>
                            </div>
                        </div>
                        <!-- /.row (main row) -->
                        <!--second row-->
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="col-lg-12 table table-responsive" id="tableID">
                                    <thead>
                                        <tr>
                                            <th class="header__item"><button id="bookID" class="filter__link filter__link--number"><b>Booking ID</b></button>
                                                <input type="hidden" id="sort-id" value="SORT_ASC">
                                            </th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>NRIC / Passport No.</th>
                                            <th>Gender</th>
                                            <th>Contact Number</th>
                                            <th>Nationality</th>
                                            <th class="header__item"><button id="bookDate" class="filter__link" ><b>Appointment Date</b></button>
                                            <input type="hidden" id="sort-direction" value="SORT_ASC"></th>
                                            <th>Appointment Time Slot</th>
                                            <th>Screening Type</th>
                                            <th>Status
                                                <input type="text" style="width:110px;" id="myInput" onkeyup="myFunction()" placeholder="Search Status" title="Type in a name">
                                            </th>
                                        </tr>
                                    </thead>                                                            
                                    <tbody class="table-content">
                                        <c:forEach var="table" items="${rs.rows}" >  
                                            <tr class="table-row ">  
                                                <td class="table-data"><c:out value="${table.cs_bookingID}"/></td>  
                                                <td class="table-data"><c:out value="${table.cs_firstname}"/></td>  
                                                <td class="table-data"><c:out value="${table.cs_lastname}"/></td>  
                                                <td class="table-data"><c:out value="${table.cs_ic}"/></td>  
                                                <td class="table-data"><c:out value="${table.cs_gender}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_contactno}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_nationality}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_aptdate}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_apttime}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_screeningtype}"/></td>
                                                <td class="table-data"><c:out value="${table.cs_bookingstatus}"/></td>
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
                    el('cs_bookingID').value = row.cells[0].innerHTML;
                    el('cs_fullname').value = row.cells[1].innerHTML + " " + row.cells[2].innerHTML;
                    el('cs_aptdate').value = row.cells[7].innerHTML;
                    el('cs_apttime').value = row.cells[8].innerHTML;
                }

            }); //end of nested function

        </script>

        <script>

            $("#bookDate").on("click", function (e) {
                e.preventDefault();
                var dir = $("#sort-direction").val() === "SORT_ASC" ? 1 : -1;
                $('#tableID tbody tr').sort(function (a, b) {
                    var aval = new Date($(a).find('td:eq(7)').text()).getTime();
                    var bval = new Date($(b).find('td:eq(7)').text()).getTime();
                    aval = isNaN(aval) ? Infinity : aval;
                    bval = isNaN(bval) ? Infinity : bval;
                    return aval > bval ? dir : -dir;
                    //return aa < bb ? dir : -dir;
                }).appendTo('#tableID tbody');
                $("#sort-direction").val(dir > 0 ? "SORT_DESC" : "SORT_ASC");
            });

        </script>

        <script>
            var properties = [
                'bookID',
            ];

            $.each(properties, function (i, val) {

                var orderClass = '';

                $("#" + val).click(function (e) {
                    e.preventDefault();
                    $('.filter__link.filter__link--active').not(this).removeClass('filter__link--active');
                    $(this).toggleClass('filter__link--active');
                    $('.filter__link').removeClass('asc desc');

                    if (orderClass == 'desc' || orderClass == '') {
                        $(this).addClass('asc');
                        orderClass = 'asc';
                    } else {
                        $(this).addClass('desc');
                        orderClass = 'desc';
                    }

                    var parent = $(this).closest('.header__item');
                    var index = $(".header__item").index(parent);
                    var $table = $('.table-content');
                    var rows = $table.find('.table-row').get();
                    var isSelected = $(this).hasClass('filter__link--active');
                    var isNumber = $(this).hasClass('filter__link--number');

                    rows.sort(function (a, b) {

                        var x = $(a).find('.table-data').eq(index).text();
                        var y = $(b).find('.table-data').eq(index).text();

                        if (isNumber == true) {

                            if (isSelected) {
                                return x - y;
                            } else {
                                return y - x;
                            }

                        } else {

                            if (isSelected) {
                                if (x < y)
                                    return -1;
                                if (x > y)
                                    return 1;
                                return 0;
                            } else {
                                if (x > y)
                                    return -1;
                                if (x < y)
                                    return 1;
                                return 0;
                            }
                        }
                    });

                    $.each(rows, function (index, row) {
                        $table.append(row);
                    });

                    return false;
                });

            });

        </script>
        
        <script>
            function myFunction() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("tableID");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[10];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>

    </body>
</html>
