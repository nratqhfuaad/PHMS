<nav class="navbar navbar-expand-lg navbar-dark bg-white fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/PHMS">
            <img src="asset/logo.png" />
        </a>
        <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarResponsive"
            aria-controls="navbarResponsive"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <svg
                class="ham hamRotate ham1"
                viewBox="0 0 100 100"
                width="80"
                onclick="this.classList.toggle('active')"
                >
            <path
                class="line top"
                d="m 30,33 h 40 c 0,0 9.044436,-0.654587 9.044436,-8.508902 0,-7.854315 -8.024349,-11.958003 -14.89975,-10.85914 -6.875401,1.098863 -13.637059,4.171617 -13.637059,16.368042 v 40"
                ></path>
            <path class="line middle" d="m 30,50 h 40"></path>
            <path
                class="line bottom"
                d="m 30,67 h 40 c 12.796276,0 15.357889,-11.717785 15.357889,-26.851538 0,-15.133752 -4.786586,-27.274118 -16.667516,-27.274118 -11.88093,0 -18.499247,6.994427 -18.435284,17.125656 l 0.252538,40"
                ></path>
            </svg>
        </button>
        <!--  -->
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/PHMS"
                       >HOME
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="navbarDropdownMenuLink"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        SERVICES
                    </a>
                    <div
                        class="dropdown-menu animated--grow-in"
                        aria-labelledby="navbarDropdownMenuLink"
                        >
                        <a class="dropdown-item" href="covid_screening.jsp">COVID-19 Screening Appointment</a>
                        <a class="dropdown-item" href="clinic_apt_form.jsp">Health Clinic Appointment</a>                       
                        <a class="dropdown-item" href="health_facilities.jsp">Locate Health Facilities</a>
                        <a class="dropdown-item" href="hotspotTracking">Hotspot Tracking</a>
                        <a class="dropdown-item" href="risk_status_checking.jsp">Risk Status Self-Checking </a>
                        <a class="dropdown-item" href="online_consultation_form.jsp">Online Consultation</a>
                        <a class="dropdown-item" href="ReportStat">Report & Statistics</a>
                        <a class="dropdown-item" href="FAQ.jsp">FAQ</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="NewsFeed">NEWS FEED</a>
                </li>
                
                <%
                    String email = (String)session.getAttribute("pemail");
                    if(email!=null){
                        request.setAttribute("hide", "d-none");
                    }
                    else{
                        request.setAttribute("hide", "");
                    }
                %>
                <li class="nav-item <%=request.getAttribute("hide")%>">
                    <a class="nav-link" href="LogIn">LOGIN</a>
                </li>
                <%
                    if(email==null){
                        request.setAttribute("show", "d-none");
                    }
                    else{
                        request.setAttribute("show", "");
                    }
                %>
                <li class="nav-item dropdown no-arrow <%=request.getAttribute("show")%>">
                    <a
                        class="nav-link dropdown-toggle"
                        href="javascript:void(0)"
                        id="userDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                        >
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                            <img
                                class="img-profile rounded-circle"
                                src="asset/undraw_profile.svg"
                                />
                        </span>
                    </a>
                    <!-- Dropdown - User Information -->
                    <div
                        class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="userDropdown"
                        >
                        <a class="dropdown-item" href="Profile">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Profile
                        </a>
                        <a class="dropdown-item" href="CovidAptHistory">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            My Booking
                        </a>
                        <a class="dropdown-item" href="ConsultationAnswer">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            My Consultation
                        </a>
<!--                        <a class="dropdown-item" href="javascript:void(0)">
                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                            Activity Log
                        </a>-->
                        <div class="dropdown-divider"></div>
                        <form action="LogOut" method="post">
                            <input type="submit"
                                   class="dropdown-item"
                                   data-toggle="modal"
                                   data-target="#logoutModal"
                                   value="Log Out"
                                   ><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        </form>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
