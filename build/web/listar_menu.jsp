<%-- 
    Document   : listar_menu
    Created on : 21/10/2020, 18:10:24
    Author     : luizf
--%>

<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Menu> lista = new ArrayList<Menu>();
    try {
        MenuDAO mDAO = new MenuDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
        response.sendRedirect("error_page.jsp");
    }

%>
<!DOCTYPE html>
    <html lang="pt-br">

        <script type="text/javascript">
            function excluir(titulo, id) {
                if (confirm("Tem certeza que deseja excluir o menu:" + titulo + "?")) {
                    window.open("excluir_menu.do?id=" + id, "_self");
                }
            }
        </script>

        <% String name = "Inserir endereço";%>
        <jsp:include page="_head.jsp">
            <jsp:param name="pageTitle" value="<%= name%>"/>
        </jsp:include>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">
                <!-- Content Wrapper -->
                <%@include file="banner.jsp" %>
                <div id="content-wrapper" class="d-flex flex-column">
                    <!-- Main Content -->
                    <div id="content">
                        <%@include file="top_bar.jsp" %>
                        <!-- Final da barra topo -->

                        <!-- Conteudo da pagaina principal container -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Listar Menu</h1>


                            <!-- Tabela -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Menu <span><a href="inserir_menu.jsp" class="btn btn-primary mt-2 mb-2">Novo Menu</a> </span></h6>
                                   
                                </div>
                                
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>TITULO</th>
                                                    <th>LINK</th>
                                                    <th>OPÇÕES</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>TITULO</th>
                                                    <th>LINK</th>
                                                    <th>OPÇÕES</th>
                                                </tr>
                                            </tfoot>
                                            <% for (Menu m : lista) {%>
                                            <tbody>
                                                <tr>
                                                    <td><%=m.getId()%></td>
                                                    <td> <%=m.getTitulo()%></td>
                                                    <td> <%=m.getLink()%></td>
                                                    <td>  
                                                        <a onclick="excluir('<%=m.getTitulo()%>', <%=m.getId()%>)" href="#">

                                                            <img src="assets/excluir.png" alt="excluir"/>
                                                        </a>
                                                        <a  href="alterar_menu.jsp?id=<%=m.getId()%>">

                                                            <img src="assets/alterar.png" alt="alterar"/>
                                                        </a>
                                                </tr>

                                            </tbody> <%}%>
                                        </table>
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
