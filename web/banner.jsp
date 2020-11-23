<%-- 
    Document   : banner
    Created on : 22/10/2020, 11:48:39
    Author     : luizf
--%>

<%@page import="modelo.Menu"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String pagebb = "";
    Cliente cLogado = new Cliente();;
    try {
        cLogado = (Cliente) session.getAttribute("cliente");

%>

<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">



    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
            <img src="assets/coivest.png" alt="Logo">
          
        </div>
        <div class="sidebar-brand-text mx-3">Blockchain Controller</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Menu de acordo com o perfil
    </div>
    <%                for (Menu ma : cLogado.getPerfil().getMenus()) {
    %>

    <li class="nav-item">
        <a class="nav-link" href="<%=ma.getLink()%>">
            <i class="fas fa-fw fa-chart-area"></i>
            <span><%=ma.getTitulo()%></span></a>
            <%}%>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <li class="nav-item">
       
    </li>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>
    <%
        } catch (Exception e) {
            pagebb = "login.jsp";
            RequestDispatcher dd=request.getRequestDispatcher(pagebb);
            dd.forward(request, response);
        }

    %>
<!-- End of Sidebar -->
