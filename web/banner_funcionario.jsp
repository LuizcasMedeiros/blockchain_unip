<%-- 
    Document   : banner_funcionario
    Created on : 16/11/2020, 22:45:36
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Menu"%>



<%
    Funcionario fLogado = new Funcionario();;
    try {
        fLogado = (Funcionario) session.getAttribute("funcionario");

%>

<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">



    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="listar_cliente_funcionario.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <img src="assets/coivest.png" alt="Logo">
          
        </div>
        <div class="sidebar-brand-text mx-3">Blockchain Controller</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-2">

   
   

    <!-- Heading -->
    <div class="sidebar-heading">
        Menu de acordo com o perfil
    </div>
    <%                for (Menu ma : fLogado.getPerfil().getMenus()) {
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
    <%
        } catch (Exception e) {
            response.sendRedirect("login_funcionario.jsp");
        }

    %>
</ul>
<!-- End of Sidebar -->

