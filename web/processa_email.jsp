<%-- 
    Document   : processa_user
    Created on : 17/11/2020, 15:38:23
    Author     : luizf
--%>

<%@page import="modelo.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    
    
    String email = request.getParameter("email");
    boolean resultado;
    FuncionarioDAO fDAO = new FuncionarioDAO();
    resultado = fDAO.pesquisarEmailExiste(email);
   

%>

<%if(resultado == true){%>
    <p style="color:red"><small>Email já cadastrado!</small></p>
   
<%}%>