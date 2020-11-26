<%-- 
    Document   : realizar_investimento
    Created on : 27/10/2020, 17:39:00
    Author     : luizf
--%>

<%@page import="modelo.ContaDAO"%>
<%@page import="modelo.Conta"%>
<%@page import="modelo.ContratoDAO"%>
<%@page import="modelo.Contrato"%>
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
<html lang="pt-br">
    <% String name = "Realizar Investimento";%>
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
                        <h1 class="h3 mb-2 text-gray-800">Investimento</h1>


                        <!-- Content -->
                     
                        <div class="card shadow mb-4">
                             <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Inserir Investimento </h6>
                                </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form  action="inserir_investimento.do" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-sm-4">
                                                    <label for="inputValor"> Valor:</label>
                                                    <input type="text" class="form-control" id="inputValor" placeholder="Valor em reais que deseja registrar em criptomoedas" name="valor" required />
                                                </div>

                                                <div class="form-group col-sm-4">
                                                    <label for="inputcriptoativo"> Nome do Criptoativo: </label>
                                                    <input type="text" list="tipoConta" id="inputcriptoativo" class="form-control" id="inputcriptoativo" placeholder="Criptoativos" name="tipoCriptoativos_id" autocomplete="off" required />


                                                    <datalist id="tipoConta">
                                                        <%for (Criptoativo c : lista) {%>
                                                        <option value="<%=c.getId()%>"><%=c.getNome()%><option>
                                                            <%}%>
                                                    </datalist>
                                                </div>

                                                <div class="form-group col-sm-4">
                                                    <label for="inputdate"> Data investimento: </label>
                                                    <input type="date" class="form-control" id="inputdate" name="data"/>
                                                </div>
                                                <div class="form-group col-sm-2">
                                                    <label for="inputtime">Hora </label>
                                                    <input  type="time" class="form-control" id="inputtime" name="hora"/>
                                                    <input type="hidden" name="cliente_id" value="<%=cLogado.getId()%>"/>
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
