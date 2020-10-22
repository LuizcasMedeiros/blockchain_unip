<%-- 
    Document   : inserir_endereco
    Created on : 20/10/2020, 08:19:21
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String user = request.getParameter("user");
    String senha = request.getParameter("senha");
    String celular = request.getParameter("celular");
    String data_nascimento = request.getParameter("data_nascimento");
    String perfil = request.getParameter("perfil");

%>
<html>
    <% String name = "Inserir endereço";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    
    <body>
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
                                <form id="cliente" name="cliente" class="user" method="post" action="inserir_cliente.do">
                                    <input type="hidden" name="nome" value="<%=nome%>">
                                    <input type="hidden" name="email" value="<%=email%>">
                                    <input type="hidden" name="user" value="<%=user%>">
                                    <input type="hidden" name="celular" value="<%=celular%>">
                                    <input type="hidden" name="data_nascimento" value="<%=data_nascimento%>">
                                    <input type="hidden" name="cpf" value="<%=cpf%>">
                                    <input type="hidden" name="senha" value="<%=senha%>">
                                    <input type="hidden" name="perfil" value="<%=perfil%>">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input class="form-control form-control-user" id="cep" type="text"  placeholder="Cep" name="cep"  maxlength="9" OnKeyPress="formatar('#####-###', this)"   required/> 
                                        </div>
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" id="cidade" type="text"  placeholder="Cidade" name="localidade" maxlength="100" required/> 
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control form-control-user" id="bairro" type="text" placeholder="Bairro" name="bairro"  required/> 
                                    </div>  


                                    <div class="form-group">
                                        <input class="form-control form-control-user" id="rua" type="text" placeholder="Logadouro" name="logadouro"  required/> 
                                    </div>

                                    <div class="form-group">
                                        <input  class="form-control form-control-user" type="text" placeholder="Complemento" name="complemento" maxlength="255" /> 
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" id="uf" type="text" placeholder="Uf" name="uf"  required readonly/>
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
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="javascript/js/sb-admin-2.min.js"></script>

    </body>
</html>


