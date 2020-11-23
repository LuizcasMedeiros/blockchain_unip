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
            <div class="row justify-content-center">
                <p class="text-gray-900 mb-4 p-3">Aumentar texto</p>
                <span class="p-2">


                    <button class=""onClick="fonte('a');">
                        <i class="fas fa-plus"></i>
                    </button>
                    <button onClick="fonte('d');">
                        <i class="fas fa-window-minimize"></i>
                    </button>
                </span>
            </div>

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-2">
                                        <div class="text-center">
                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 8rem;" src="assets/COINVEST.png" alt="">
                                            <h1 class="acessibilidade h4 text-gray-900 mb-4">Bem vindo de volta!</h1>
                                            <h5 class="acessibilidade">Login Funcionario</h5>
                                        </div>
                                        <form class="user" method="post" action="valida_login_funcionario.do">
                                            <div class="form-group">
                                                <input type="text" class="acessibilidade form-control form-control-user" name="email"  aria-describedby="emailHelp" placeholder="Entre com o email">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="acessibilidade form-control form-control-user" name="senha" id="exampleInputPassword" placeholder="Digite a senha">
                                            </div>
                                            <div class="form-group">
                                                <button class="acessibilidade btn btn-primary btn-user btn-block" type="submit">
                                                    Entrar
                                                </button>
                                            </div>
                                            <hr>
                                        </form>
                                        <hr>
                                        <form name="login" action="login.jsp" method="post">
                                                <div class="d-flex justify-content-center mt-3 login_container">
                                                    <input type="submit" name="button" class="acessibilidade btn btn-danger" value="Ir para Login Cliente">
                                                </div>
                                        </form>
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
