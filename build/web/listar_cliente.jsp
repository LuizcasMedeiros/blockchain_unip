<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>



<%
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try {
        ClienteDAO cDAO = new ClienteDAO();
        lista = cDAO.listar();
    } catch (Exception e) {
        response.sendRedirect("error_page.jsp");
    }

%>


<!DOCTYPE html>
<html lang="pt-br">

    <% String name = "Inserir endereço";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <script type="text/javascript">
        function excluir(nome, id) {
            if (confirm("Tem certeza que deseja excluir o cliente: " + nome + "?")) {
                window.open("excluir_cliente.do?op=c&id=" + id, "_self");
            }
        }
    </script>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="banner.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <%@include file="top_bar.jsp" %>
                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">
                            
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Listar Cliente</h1>
                        

                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Cliente</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>USER</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>USER</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <% for(Cliente c: lista){
                                           %>
                                        <tbody>
                                            <tr>
                                                <td><%=c.getId()%></td>
                                                <td> <%=c.getNome()%></td>
                                                <td> <%=c.getEmail()%></td>
                                                <td> <%=c.getUser()%></td>
                                                <td>  
                                                    <a onclick="excluir('<%=c.getNome()%>', <%=c.getId()%>)"  class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                    <a  href="alterar_cliente.jsp?id=<%=c.getId()%>" class="btn btn-primary btn-sm">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </a>

                                                    <a  href="adicionar_cartao.jsp?id_cliente=<%=c.getId()%>"class="btn btn-info btn-sm">
                                                        <i class="fas fa-search-dollar"></i>
                                                        <img src="assets/pag.png" alt="alterar"/>
                                                    </a>
                                            </tr>
                                            
                                       </tbody> <%
                                                    
                                                }%>
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
                        <a class="btn btn-primary" href="logoff.jsp">Sair</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
