<%-- 
    Document   : gerenciar_menu_perfil
    Created on : 21/10/2020, 11:10:26
    Author     : luizf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  
    Perfil p = new Perfil();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html lang="pt-br">
    <% String name = "Inserir endereço";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%=name%>"/>
    </jsp:include>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            
            <%@include file="banner_funcionario.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="top_bar_funcionario.jsp"%>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Listar Menu</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Gerenciar Menu Perfil</h6>
                                <div class="text-center mt-4">
                                    <form name="menu_perfil" action="gerenciar_menu_perfil.do" method="post">                                       

                                        ID: <%=p.getId()%>  Nome: <%=p.getNome()%><br/>
                                        <input type="hidden" value="<%=p.getId()%>" name="id_perfil"/>
                                        <input type="hidden" value="vincular" name="op"/>
                                        <select name="id_menu" required>
                                            <option value=""> Selecione... </option>
                                            <%
                                                ArrayList<Menu> lista = new ArrayList<Menu>();
                                                PerfilDAO pDAO = new PerfilDAO();
                                                try {
                                                    lista = pDAO.menusNaoVinculados(p.getId());
                                                } catch (Exception e) {
                                                    out.print("Erro:" + e);
                                                }

                                                for (Menu m : lista) {
                                            %>
                                            <option value="<%=m.getId()%>"><%=m.getTitulo()%></option>               
                                            <%
                                                }
                                            %>
                                        </select>

                                        <input type="submit" value="+"/>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>TITULO</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>TITULO</th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <% for (Menu m : p.getMenus()) {%>
                                            <tbody>
                                                <tr>
                                                    <td><%=m.getId()%></td>
                                                    <td><%=m.getTitulo()%></td>
                                                    <td>
                                                        <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId()%>&id_perfil=<%=p.getId()%>&op=remover" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                                                    </td>
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
                            <a class="btn btn-primary" href="logoff.jsp">Sair</a>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
