<%-- 
    Document   : adicionar_cartao
    Created on : 12/10/2020, 12:27:33
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
        int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
   


%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css_bootsrap//bootstrap.min.css"/>
        <link rel="stylesheet" href="css/styles.css"/>
        <title>Adicionar Cartão</title>
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
                <form method="post" action="inserir_cartao.do">
                    <input class="form-control" type="hidden"  name="id_cliente"  value="<%=id_cliente%>"/> <br>
                    <label>Nome do banco</label>
                    <input class="form-control" type="text" placeholder="Nome do Banco" name="banco"  required/> <br>
                    

                    <input class="btn btn-primary" type="submit" value="Enviar"/>
                 </form>
            </div>    
        </main>
        
        <footer>
               <p>Todos os direitos reservados a &copy;Copyright</p>
        </footer>
    </body>
</html>
