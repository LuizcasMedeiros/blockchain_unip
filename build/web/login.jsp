<%-- 
    Document   : login
    Created on : 21/10/2020, 09:25:22
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String name = "login";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <body class="bg-gradient-primary">
        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Bem vindo de volta!</h1>
                                        </div>
                                        <form class="user" method="post" action="valida_login.do">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" name="user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Entre com o usuario">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" name="senha" id="exampleInputPassword" placeholder="Digite a senha">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Lembre me</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                     <input class="form-control btn btn-primary btn-user btn-blocky" type="submit" value="Entrar" />
                                                </div>
                                            </div>
                                            <hr>
                                        </form>
                                        <hr>
                                        <form name="login" action="login_funcionario.jsp" method="post">
                                                <div class="d-flex justify-content-center mt-3 login_container">
                                                    <input type="submit" name="button" class="btn btn-danger" value="Ir para Login Funcionario">
                                                </div>
                                        </form>
                                        <div class="text-center">
                                            <a class="small" href="forgot-password.html">Esqueceu a senha?</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="form_inserir_cliente.jsp">Criar uma conta!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>


    </body>
</html>
