<%-- 
    Document   : processa_pesquisa
    Created on : 29/10/2020, 20:57:36
    Author     : luizf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try{
    String nome = request.getParameter("nome");
    ClienteDAO cDAO = new ClienteDAO();
    lista = cDAO.pesquisarNome(nome);
    }catch(Exception e){
        out.print("error: "+e);
    }

%>
<table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>NOME</th>
            <th>EMAIL</th>
            <th>USER</th>
            <th>OPÇÕES</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>ID</th>
            <th>NOME</th>
            <th>EMAIL</th>
            <th>USER</th>
            <th>OPÇÕES</th>
        </tr>
    </tfoot>
    <% for (Cliente cc
                : lista) {
    %>
    <tbody>
        <tr>
            <td><%=cc.getId()%></td>
            <td> <%=cc.getNome()%></td>
            <td> <%=cc.getEmail()%></td>
            <td> <%=cc.getUser()%></td>
            <td id="teste">  
                <a onclick="excluir('<%=cc.getNome()%>', <%=cc.getId()%>)"  class="btn btn-danger btn-sm">
                    <i class="fas fa-trash"></i>
                </a>
                <a  href="alterar_cliente.jsp?id=<%=cc.getId()%>" class="btn btn-primary btn-sm">
                    <i class="fas fa-pencil-alt"></i>
                </a>
                <%if (cc.getConta().getId() != 0) {%>
                <a  href="#"class="btn btn-info btn-sm">
                    Cartão adicionado
                </a>
                <%} else {%>
                <a  href="adicionar_cartao.jsp?id_cliente=<%=cc.getId()%>"class="btn btn-info btn-sm">
                    <i class="fas fa-search-dollar"></i>
                    <img src="assets/pag.png" alt="alterar"/>
                </a>
        </tr>

    </tbody> <%}}%>
</table>
