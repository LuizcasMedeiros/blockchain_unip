<%-- 
    Document   : listar_criptoativos
    Created on : 26/10/2020, 20:01:24
    Author     : luizf
--%>

<%@page import="modelo.ContratoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.CriptoativoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Criptoativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList<Criptoativo> lista = new ArrayList<Criptoativo>();
    try {
        CriptoativoDAO cDAO = new CriptoativoDAO();
        lista = cDAO.listar();
    } catch (Exception e) {
        out.print("error" + e);
    }
%>
<%
    NumberFormat z = NumberFormat.getCurrencyInstance();


%>



<html lang="pt-br">
    <% String name = "Listar Criptoativos";%>
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
                        <%
                            ContratoDAO conDAO = new ContratoDAO();
                            boolean verificaContratoAdquirido;
                            verificaContratoAdquirido = conDAO.contratoAdquiridoBoolean(cLogado.getId());
                        %> 


                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Criptoativos</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <%if (verificaContratoAdquirido == true) {%>
                                <h6 class="m-0 font-weight-bold text-primary">Listar Criptoativos <span><a href="incluir_criptoativos.jsp" class="btn btn-primary mt-2 mb-2">Novo Criptoativo</a> </span></h6>
                                <%} else {%>

                                <h6 class="m-0 font-weight-bold text-primary">Listar Criptoativos</h6>
                                <%}%>
                            </div>

                            <%    if (verificaContratoAdquirido == true) {

                            %>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Valor</th>
                                                <th scope="col">OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Valor</th>
                                                <th scope="col">OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <% for (Criptoativo c : lista) {%>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><%=c.getId()%></th>
                                                <td> <%=c.getNome()%></td>
                                                <td> <%=z.format(c.getValor())%></td>
                                                <td>  
                                                    <button id="alterarSenha" type="button" class="btn btn-primary btn-sm" 
                                                            data-toggle="modal" 
                                                            data-target="#ModalAlterarCriptoativo"
                                                            data-whatever="<%=c.getId()%>"
                                                            data-whateverNome="<%=c.getNome()%>" 
                                                            data-whateverValor="<%=c.getValor()%>"  
                                                            >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                            </tr>

                                        </tbody> <%}%>
                                    </table>
                                </div>
                            </div>
                            <%}else{%>
                            <div class="col-sm-6 mx-auto">  
                                <div class="card-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Adquira um contrato primeiro</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">

                                                <p>É de extrema importancia para utilizar nossos serviços que você adquira um contrato</p>
                                                <a class="btn btn-primary stretched-link" href="listar_contrato.jsp">Adquirir contrato</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>

                    <!--Final do container --> 
                    <div class="modal fade" id="ModalAlterarCriptoativo" tabindex="-1" role="dialog" aria-labelledby="ModalAlterarLabelCriptoativo" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalAlterarLabelCriptoativo">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Alterar menu</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                <div class="col-sm-12 col-md-10 col-lg-8">
                                                    <form name="alterar_perfil" action="alterar_criptoativo.do" method="post">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="inputNome"> Nome: </label>
                                                                <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" required />
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="inputValor"> Valor: </label>
                                                                <input type="text" class="form-control" id="valor" placeholder="Valor" name="valor" required />
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
