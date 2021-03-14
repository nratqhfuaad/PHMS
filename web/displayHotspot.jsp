<%-- 
    Document   : displayHotspot
    Created on : 28 Jan 2021, 5:23:59 pm
    Author     : iztan
--%>

<div>
    <div>
        <img style="width: 8%; display: <%=request.getAttribute("check")%>" src="asset/greencheck.png" alt=""/>
        <img style="width: 8%; display: <%=request.getAttribute("warning")%>" src="asset/yellowwarning.png" alt=""/>
    </div>
    <div>
        <div>
            <p>Hi <%=request.getAttribute("pname")%>, there have been <%=request.getAttribute("cases")%> reported case(s) of COVID-19 within your area. </p>
        </div>
    </div>
</div>

</div>
<!--                    <img src="css/radiuslocation.jpg"> </br>   -->
<p>
    Reported case is based on the source & potential spread of COVID-19 after detailed investigation by MOH.
</p>
</center>   


</div>
<!-- /.container -->
</div>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright &copy; Your Website 2020
        </p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript 
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->

</script>
</body>
</html>