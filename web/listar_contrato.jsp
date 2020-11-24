<%-- 
    Document   : listar_contratos
    Created on : 18/11/2020, 14:53:45
    Author     : luizf
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.ContaDAO"%>
<%@page import="modelo.Conta"%>
<%@page import="modelo.Contrato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ContratoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Contrato> lista = new ArrayList<Contrato>();
    NumberFormat z = NumberFormat.getCurrencyInstance();
    try {

        ContratoDAO conDAO = new ContratoDAO();
        lista = conDAO.listar();
    } catch (Exception e) {
        out.print("error" + e);
    }


%>
<html lang="pt-br">
    <% String name = "Listar Contratos";%>
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
                        <h1 class="h3 mb-2 text-gray-800">Contratos</h1>

                        <div class="row">

                            <%                                
                                
                             ContaDAO cDAO = new ContaDAO();
                             ContratoDAO conDAO = new ContratoDAO();
                                
                             boolean resultConta;
                             boolean verificaContratoAdquirido;
                             resultConta = cDAO.CarregarPorIdClienteB(cLogado.getId());
                             verificaContratoAdquirido = conDAO.contratoAdquiridoBoolean(cLogado.getId());
                                
                             if(verificaContratoAdquirido != true){
                                
                                if (resultConta == true) {
                                    Conta conta = new Conta();
                                    conta = cDAO.CarregarPorIdCliente(cLogado.getId());
                                    for (Contrato con : lista) {
                                        if (conta.getCliente().getId() == cLogado.getId()) {
                            %>
                            <div class="col-sm-6">  
                                <div class="card-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary text-center">CONTRATO DE ABERTURA DE CONTA INVESTIMENTO <%=con.getId()%></h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 10rem;" src="assets/COINVEST.png" alt="">
                                            </div>
                                            <div id="box-toggle">
                                                <p class="text-justify"><%=con.getDescricao()%></p>
                                               <a class="btn btn-primary" href="adquirir_contrato_dados_cliente.jsp?contrato_id=<%=con.getId()%>">Adquirir Contrato</a>
                                            </div>
                                            <div class="card-footer py-3">
                                                <h6 class="m-0 font-weight-bold text-primary">Valor:<%=z.format(con.getValor())%></h6>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}
                            }else{%>
                            <div class="col-sm-6 mx-auto">  
                                <div class="card-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Cadastre sua conta bancaria primeiro para mostrar as opções de contrato</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                               
                                                <p>É de extrema importancia para utilizar nossos serviços que você cadastre sua conta!</p>
                                                <a class="btn btn-primary stretched-link" href="adicionar_cartao.jsp">Cadastrar Conta</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        <%}}else{
                             Contrato con = new Contrato();
                             con = conDAO.contratoAdquirido(cLogado.getId());
                        %>
                          <div class="col-sm-6">  
                                <div class="card-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Contrato <%=con.getId()%> (Contrato já adquirido)</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 10rem;" src="assets/COINVEST.png" alt="">
                                            </div>
                                            <div id="box-toggle">
                                                <p class="text-justify"><%=con.getDescricao()%></p>
                                            </div>

                                        </div>
                                        <div class="card-footer py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Valor:<%=z.format(con.getValor())%></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <%}%>
                        </div>
                           
                    </div>
                    <!-- Tabela -->



                    <!--Final do container --> 
                   
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

