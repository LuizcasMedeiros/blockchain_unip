
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <% String name = "Alterar Cliente";%>

    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body class="bg-gradient-primary">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Criar sua Conta!</h1>
                                </div>
                                <form id="cliente" name="cliente" class="user" method="post" action="inserir_endereco.jsp" onsubmit="return validar()">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input class="form-control form-control-user" id="nome" type="text"  placeholder="Nome" name="nome"  required/> 
                                        </div>
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" type="text"  placeholder="Cpf" name="cpf"  id="cpf" OnKeyPress="formatar('###.###.###-##', this)" maxlength="14"  required/> 
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input id="data_nascimento" class="form-control form-control-user" type="date"  placeholder="Informe sua data de nascimento" name="data_nascimento"  required/> 
                                    </div>  


                                    <div class="form-group">
                                        <input id="numero" class="form-control form-control-user" type="text"  placeholder="Informe seu numero de celular" name="celular" OnKeyPress="formatar('## #####-####', this)" minlength="13" maxlength="13" required/> 
                                    </div>

                                    <div class="form-group">
                                        <input id="email" class="form-control form-control-user" type="email"  placeholder="Email" name="email" id="email" maxlength="45" required/> 
                                    </div>

                                    <div class="form-group">
                                        <input id="cemail" class="form-control form-control-user"   type="email"  placeholder="Confirmar Emai"  id="confirmarEmail" maxlength="45" required/> 
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" type="text"  placeholder="Username" name="user"id="user" maxlength="45"  required/>
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input id="senha" class="form-control form-control-user" name="senha" type="password"  placeholder="Senha" minlength="3"  maxlength="16"   required/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 ">
                                            <input type="password" id="confirmarSenha" class="form-control form-control-user"  placeholder="Confirmar Senha" minlength="3"  maxlength="16"  required/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <input class="form-control btn btn-primary btn-user btn-blocky" type="submit" value="Registar" />
                                    </div>
                                    <hr>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="login.html">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="javascript/js/sb-admin-2.min.js"></script>

    </body>

</html>


