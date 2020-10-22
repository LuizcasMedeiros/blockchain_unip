<%-- 
    Document   : logoff
    Created on : 22/10/2020, 12:27:07
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
session.removeAttribute("cliente");
response.sendRedirect("login.jsp");
%>

