<%-- 
    Document   : altear_cliente
    Created on : 10/10/2020, 08:52:06
    Author     : luizf
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cliente c = new Cliente();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO cDAO = new ClienteDAO();
        c = cDAO.carregarPorId(id);
        
       
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<%
 SimpleDateFormat df = new SimpleDateFormat("dd/MM/YYYY");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css_bootsrap//bootstrap.min.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <title>Alterar Cliente</title>
    </head>
    <body>
        <header> 
            <nav class="cabecalho">
                <h3 class="titulo" >Blockchain</h3>
            </nav>
        </header>
        <main>
            <div>
                <h4>Inserir Cliente</h4>
                <form method="post" action="alterar_cliente.do?id=<%=c.getId()%>">
                    <input class="form-control" type="text"  placeholder="Nome" name="nome" value="<%=c.getNome()%>" maxlength="100" required/> <br>
                    <input class="form-control" type="text"  placeholder="Cpf" name="cpf" value="<%=c.getCpf()%>"  required/> <br>
                    <input class="form-control" type="email"  placeholder="Email"name="email" value="<%=c.getEmail()%>"  required/> <br>
                    <input class="form-control" type="text"  placeholder="User" name="user" value="<%=c.getUser()%>" /><br>
                    <input class="form-control" type="text"  placeholder="Celular" name="celular" value="<%=c.getCelular()%>"  required/>
                    <input class="form-control" type="date"  placeholder="Data Nascimento" name="data_nascmimento" value="<%=c.getData_nascimento()%>"  required/></br>
                    <input class="form-control" type="password"  placeholder="Nova Senha" name="senha" /> </br>

                    <input class="btn btn-primary" type="submit" value="Enviar"/>
                 </form>
            </div>    
        </main>
        
        <footer>
               <p>Todos os direitos reservados a &copy;Copyright</p>
        </footer>
    </body>
</html>
