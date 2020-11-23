<%-- 
    Document   : listar_contratos_funcionarios
    Created on : 22/11/2020, 12:34:57
    Author     : luizf
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.ContratoDAO"%>
<%@page import="modelo.Contrato"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList <Contrato> lista = new ArrayList<Contrato>();
    NumberFormat z = NumberFormat.getCurrencyInstance();
    
    try{
        ContratoDAO conDAO = new ContratoDAO();
        
        lista = conDAO.listarContratosAdquiridos();
    }catch (Exception e){
        out.print("error"+e);
    }



%>
<html lang="pt-br">
        <% String name = "Inserir endereço";%>
        <jsp:include page="_head.jsp">
            <jsp:param name="pageTitle" value="<%= name%>"/>
        </jsp:include>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">
                <!-- Content Wrapper -->
                <%@include file="banner_funcionario.jsp" %>
                <div id="content-wrapper" class="d-flex flex-column">
                    <!-- Main Content -->
                    <div id="content">
                        <%@include file="top_bar_funcionario.jsp" %>
                        <!-- Final da barra topo -->

                        <!-- Conteudo da pagaina principal container -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Contratos</h1>


                            <!-- Tabela -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Contratos adquiridos (Pelo os clientes) <span><a href="#" class="btn btn-primary mt-2 mb-2">Novo Tipo de Contrato</a> </span></h6>
                                   
                                </div>
                                
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Cliente que contratou</th>
                                                    <th scope="col">Valor</th>
                                                    <th scope="col">OPÇÕES</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Cliente que contratou</th>
                                                    <th scope="col">Valor</th>
                                                    <th scope="col">OPÇÕES</th>
                                                </tr>
                                            </tfoot>
                                            <% for (Contrato c : lista) {%>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><%=c.getId()%></th>
                                                    <td> <%=c.getCliente().getNome()%></td>
                                                    <td> <%=z.format(c.getValor())%></td>
                                                </tr>

                                            </tbody> <%}%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                                        
                        
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
                            <a class="btn btn-primary" href="logoff_funcionario.jsp">Sair</a>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>

