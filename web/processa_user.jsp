<%-- 
    Document   : processa_user
    Created on : 17/11/2020, 15:38:23
    Author     : luizf
--%>

<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    
    
    String user = request.getParameter("user");
    boolean resultado;
    ClienteDAO cDAO = new ClienteDAO();
    resultado = cDAO.pesquisarUserExiste(user);
   

%>

<%if(resultado == true){%>
    <p style="color:red"><small>Usuario Indisponivel!</small></p>
   
<%}%>