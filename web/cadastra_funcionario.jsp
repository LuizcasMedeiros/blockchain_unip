<%-- 
    Document   : cadastra_funcionario
    Created on : 16/11/2020, 07:14:17
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
            <%@include file="banner_funcionario.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="top_bar_funcionario.jsp" %>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Funcionario</h1>


                        <!-- Content -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Cadastrar Funcionario</h6>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form  action="cadastra_funcionario_dados_trabalhistas.jsp" method="post">
                                            <div class="form-row">
                                                
                                                <div class="form-group col-sm-5">
                                                    <label for="inputNome">NOME: </label>
                                                    <input type="text" class="form-control" id="inputNome"  placeholder="Digite o nome do Funcionario" name="nome"  required />
                                                </div>
                                                

                                                <div class="form-group col-sm-4">
                                                    <label for="cpf"> CPF: </label>
                                                    <input class="form-control" type="text"  placeholder="Cpf" name="cpf"  id="cpf" OnKeyPress="formatar('###.###.###-##', this)" maxlength="14"  required/> 
                                                </div>
                                                
                                                <div class="form-group col-sm-4">
                                                    <label for="data_nascimento"> DATA DE NASCIMENTO </label>
                                                    <input class="form-control" type="date"  name="data_nascimento"  id="data_nascimento"  required/> 
                                                </div>
                                                
                                                <div class="form-group col-sm-4">
                                                    <label for="rg"> RG: </label>
                                                    <input class="form-control" type="text"  placeholder="Rg" name="rg"  id="rg" maxlength="14"  required/> 
                                                </div>
                                                
                                                <div class="form-group col-sm-4">
                                                    <label for="numero"> CELULAR: </label>
                                                      <input id="numero" class="form-control" type="text"  placeholder="Informe seu numero de celular" name="celular" OnKeyPress="formatar('## #####-####', this)" minlength="13" maxlength="13" required/> 
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                 <div class="form-group col-sm-3">
                                                    <label for="statusCivil">STATUS CIVIL:</label> 
                                                    <select name="status_civil" id="statusCivil" class="form-control" required>
                                                        <option disabled selected>Selecione ...</option>
                                                        <option value="solteiro">Solteiro</option>
                                                        <option value="casado">Casado</option>
                                                        <option value="divorciado">Divorciado</option>
                                                        <option value="viuvo">Viúvo</option>  
                                                    </select>
                                                 </div>
                                                
                                                <div class="form-group col-sm-3">
                                                    <label for="qtdfilhos">QTD DE FILHOS:</label> 
                                                    <input id="qtdfilhos" class="form-control" type="number" name="qtd_filhos" required/> 
                                                </div>
                                                
                                                 <div class="form-group col-sm-5">
                                                    <label for="afiliacao">AFILIAÇÃO:</label> 
                                                    <input id="afiliacao" class="form-control" type="text" name="afiliacao" placeholder="Nome do pai ou mãe" required/> 
                                                </div>
                                                
                                            </div>    
                                            <div class="form-row">
                                                <div class="col-sm-12">
                                                    <input type="submit" class="btn btn-primary" value="Proximo"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->
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
                <!-- End of Main Content -->

              
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
                        <a class="btn btn-primary" href="logoff_funcionario.jsp">Sair</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>