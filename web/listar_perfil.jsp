<%-- 
    Document   : listar_perfil
    Created on : 21/10/2020, 18:19:31
    Author     : luizf
--%>

<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    try {
        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        response.sendRedirect("error_page.jsp");
    }

%>

<html lang="pt-br">
    <script type="text/javascript">
        function excluir(titulo, id) {
            if (confirm("Tem certeza que deseja excluir o menu:" + titulo + "?")) {
                window.open("excluir_perfil.do?id=" + id, "_self");
            }
        }
    </script>
    

    <% String name = "Listar Perfil";%>
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

                    <%@include file="top_bar_funcionario.jsp"%>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Perfil</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Listar Perfil
                                    <span><a href="inserir_perfil.jsp" class="btn btn-primary mt-2 mb-2">Novo Perfil</a> </span>
                                </h6>
                                
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <% for (Perfil p : lista) {%>
                                        <tbody>
                                            <tr>
                                                <td><%=p.getId()%></td>
                                                <td> <%=p.getNome()%></td>
                                                <td> <%=p.getDescricao()%></td>
                                                <td>  
                                                    <button  type="button" class="btn btn-primary btn-sm" data-toggle="modal" 
                                                        data-target="#ModalAlterar"
                                                        data-whatever="<%=p.getId()%>"
                                                        data-whatevernome="<%=p.getNome()%>" 
                                                        data-whateverdescricao="<%=p.getDescricao()%>"  
                                                    >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>



                                                    <a href="#" onclick="excluir('<%=p.getNome()%>',<%=p.getId()%>)" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a> 
                                                    <a href="gerenciar_menu_perfil.jsp?id=<%=p.getId()%>" class="btn btn-info btn-sm"><i class="fas fa-tasks"></i></a>
                                            </tr>

                                        </tbody> <%}%>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->

                    <!-- MODALLL ALTERAR -->
                   
                   
                    <div class="modal fade" id="ModalAlterar" tabindex="-1" role="dialog" aria-labelledby="ModalAlterarLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalAlterarLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Alterar Perfil</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                <div class="col-sm-12 col-md-10 col-lg-8">
                                                    <form name="alterar_perfil" action="alterar_perfil.do" method="post">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="inputNome"> Nome: </label>
                                                                <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" required />
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="inputDescricao"> Descrição: </label>
                                                                <input type="text" class="form-control" id="descricao" placeholder="Descriçao" name="descricao" required />
                                                            </div>
                                                                <input name="id" type="hidden" id="id" value=""/>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-primary">Salvar alteração</button>
                                                            </div>
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
                    
                    <!-- fINALLL MODALLL ALTERAR -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; SisblockCBPV.0.1</span>
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
