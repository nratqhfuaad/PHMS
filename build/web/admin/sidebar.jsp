<%-- 
    Document   : sidebar
    Created on : 10 Jan 2021, 8:01:29 pm
    Author     : iztan
--%>
<%@page import="model.User"%>
<%User user = new User();
    String name = null;
    if (session.getAttribute("data") != null) {
        user = (User) session.getAttribute("data");
        name = user.getPname();
    } else {
        name = "";
    }

%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/PHMS/admin/" class="brand-link">
        <img
            src="https://zealous-wiles-173c86.netlify.app/dist/img/AdminLTELogo.png"
            alt="AdminLTE Logo"
            class="brand-image img-circle elevation-3"
            style="opacity: 0.8"
            />
        <span class="brand-text font-weight-light">PHMS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img
                    src="https://zealous-wiles-173c86.netlify.app/dist/img/user2-160x160.jpg"
                    class="img-circle elevation-2"
                    alt="User Image"
                    />
            </div>
            <div class="info">
                <a href="javasript:void(0)" class="d-block">PHMS Admin - <%=name%></a>
            </div>
        </div>


        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul
                class="nav nav-pills nav-sidebar flex-column"
                data-widget="treeview"
                role="menu"
                data-accordion="false"
                >
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                            General
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/PHMS/statics" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Update Cases</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/PHMS/states" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Update State</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-edit"></i>
                        <p>
                            Appointment
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/PHMS/ClinicAptt" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Health Clinic</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/PHMS/CovidAptt" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>COVID-19 Screening </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/PHMS/Consultation" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Consultation</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/PHMS/newsFeed" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>News Feed</p>
                    </a>
                    <!--                    <a href="#" class="nav-link">
                                            <i class="nav-icon fas fa-table"></i>
                                            <p>
                                                Tables
                                                <i class="fas fa-angle-left right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                
                                            </li>
                    
                    
                                        </ul>-->
                </li>
                <li class="nav-header">MISCELLANEOUS</li>
                <li class="nav-item">
                    <a href="/PHMS/LogOut" class="nav-link">
                        <i class="nav-icon fas fa-ellipsis-h"></i>
                        <p>Log Out</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>