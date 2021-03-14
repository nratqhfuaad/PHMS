<%-- 
    Document   : adminS
    Created on : 1 Feb 2021, 6:27:04 pm
    Author     : iztan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("data")==null){
        response.sendRedirect("../LogIn");
    }
%>