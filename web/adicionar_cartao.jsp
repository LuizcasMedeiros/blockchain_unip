<%-- 
    Document   : adicionar_cartao
    Created on : 12/10/2020, 12:27:33
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <% String name = "Inserir endereço";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <%@include file="banner.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="top_bar.jsp" %>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Adicionar sua Conta</h1>


                        <!-- Content -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Adicionar Conta (Essencial para adquirir algum contrato)</h6>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form  action="inserir_cartao.do" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <input type="hidden" name="id_cliente" value="<%=cLogado.getId()%>"
                                                    
                                                    <label for="selectBanco"> Banco: </label>
                                                    <!--<select class="form-control" name="banco" id="selectBanco">
                                                        <option>Banco do Brasil</option>
                                                        <option>Santander</option>
                                                        <option>Itaú</option>
                                                        <option>Caixa</option>
                                                    </select>-->
                                                    <input type="text" list="bancos" id="selectBanco" class="form-control" id="inputBanco" placeholder="Banco" name="banco" autocomplete="off" required />
                                                
                                                    <datalist id="bancos">
                                                        <option value="Banco do Brasil">
                                                        <option value="Santander">
                                                        <option value="Itaú">
                                                        <option value="Caixa">      
                                                    </datalist>
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputDescricao"> Conta Bancaria: </label>
                                                    <input type="text" class="form-control" id="inputDescricao" placeholder="Conta Bancaria" name="contaBancaria" required />
                                                </div>
                                            </div>
                                              <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="selectConta"> Tipo de conta: </label>
                                                    <input type="text" list="tipoConta" id="selectConta" class="form-control" id="inputBanco" placeholder="Tipo de Conta" name="tipo" autocomplete="off" required />
                                                
                                                    <datalist id="tipoConta">
                                                        <option value="Conta Poupança">
                                                        <option value="Conta Corrente">
                                                        <option value="Conta Salario">    
                                                    </datalist>
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputNomeCartao"> Nome do cartão: </label>
                                                    <input type="text" class="form-control" id="inputNomeCartao" placeholder="Informe o nome" name="nomeCartao" required />
                                                </div>
                                            </div>
                                             <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="inputData"> Data de expiração: </label>
                                                    <input type="date" class="form-control" id="inputData" placeholder="Data de Expiração" name="dataExpiracao" required />
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputAgencia"> Agência: </label>
                                                    <input type="text" class="form-control" id="inputAgencia" placeholder="Agência" name="agencia" required />
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="col-sm-12">
                                                    <input type="submit" class="btn btn-primary" value="Salvar"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Está pronto para sair?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&#128532;</span>
                        </button>
                    </div>
                    <div class="modal-body">Tem certeza que deseja sair?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-primary" href="login.html">Sair</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

