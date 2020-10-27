<%-- 
    Document   : inserir_perfil
    Created on : 21/10/2020, 11:08:45
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

                    <!-- Topbar -->
                    <%@include file="top_bar.jsp" %>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Listar Cliente</h1>


                        <!-- Content -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Inserir Perfil do usuario</h6>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form name="inserir_perfil" action="inserir_perfil.do" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-sm-6">
                                                    <label for="inputNome"> Nome: </label>
                                                    <input type="text" class="form-control" id="inputNome" placeholder="Nome" name="nome" required />
                                                </div>

                                                <div class="form-group col-sm-6">
                                                    <label for="inputDescricao"> Descrição: </label>
                                                    <input type="text" class="form-control" id="inputDescricao" placeholder="Descriçao" name="descricao" required />
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
