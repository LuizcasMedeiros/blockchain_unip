<%-- 
    Document   : inserir_menu
    Created on : 21/10/2020, 11:09:11
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
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Linha para separar area de pesquisa e o user-->
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav item usuario -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                                    <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                                </a>
                                <!-- Dropdown - Informações de usuarios -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>

                    </nav>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Listar Cliente</h1>


                        <!-- Content -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Inserir Menu</h6>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form name="inserir_menu" action="inserir_menu.do" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-sm-4">
                                                    <label for="inputTitulo"> Título: </label>
                                                    <input type="text" class="form-control" id="inputTitulo" placeholder="Título" name="titulo" required />
                                                </div>

                                                <div class="form-group col-sm-4">
                                                    <label for="inputLink"> Link: </label>
                                                    <input type="text" class="form-control" id="inputLink" placeholder="Link" name="link" required />
                                                </div>

                                                <div class="form-group col-sm-4">
                                                    <label for="inputIcone"> Ícone: </label>
                                                    <input type="text" class="form-control" id="inputIcone" placeholder="Ícone" name="icone"  />
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
