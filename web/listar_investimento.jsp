<%-- 
    Document   : listar_investimento
    Created on : 27/10/2020, 20:54:06
    Author     : luizf
--%>

<%@page import="modelo.ContratoDAO"%>
<%@page import="modelo.ContaDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.InvestimentoDAO"%>
<%@page import="modelo.Investimento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Investimento> lista = new ArrayList<Investimento>();

    try {
        InvestimentoDAO iDAO = new InvestimentoDAO();
        lista = iDAO.listar();
    } catch (Exception e) {

        out.print("erro feio" + e);
    }
%>
<%
    SimpleDateFormat df = new SimpleDateFormat("dd-MM-YYYY");
    SimpleDateFormat hr = new SimpleDateFormat("HH:mm");
    NumberFormat z = NumberFormat.getCurrencyInstance();


%>

<html lang="pt-br">
    <% String name = "Listar Investimentos";%>
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
                        <h1 class="h3 mb-2 text-gray-800">Investimento</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">

                            <div class="card-header py-3">
                                <%if (verificaContratoAdquirido == true) {%>
                                <h6 class="m-0 font-weight-bold text-primary">Listar Investimento<span><a href="realizar_investimento.jsp" class="btn btn-primary mt-2 mb-2">Novo Investimento</a> </span></h6>
                                <%} else {%>
                                <h6 class="m-0 font-weight-bold text-primary">Listar Investimento</h6>
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
                                                <th scope="col">Valor</th>
                                                <th scope="col">Data e horario</th>
                                                <th scope="col">Nome do criptoativo</th>
                                                <th scope="col"> Cliente que realizou</th>
                                                <th scope="col">OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Valor</th>
                                                <th scope="col">Data e horario</th>
                                                <th scope="col">Nome do criptoativo</th>
                                                <th scope="col"> Cliente que realizou</th>
                                                <th scope="col">OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <% for (Investimento i : lista) {
                                                if (cLogado.getId() == i.getCliente().getId()) {
                                        %>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><%=i.getId()%></th>
                                                <td> <%=z.format(i.getValor())%></td>
                                                <td> <%=df.format(i.getData())%> : <%=hr.format(i.getHora())%></td>
                                                <td> <%=i.getCriptoativo().getNome()%></td>
                                                <td> <%=i.getCliente().getNome()%></td>
                                                <td>  
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                             data-toggle="modal" 
                                                             data-target="#ModalAlterarInvestimento"
                                                             data-whatever="<%=i.getId()%>"
                                                             data-whateverdata="<%=i.getData()%>"  
                                                             data-whateverhora="<%=hr.format(i.getHora())%>" 
                                                             >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>




                                                    <a href="realizar_operacoes.jsp?investimentos_id=<%=i.getId()%>"
                                                       class="btn btn-info btn-sm" >
                                                        <i class="fas fa-calculator"></i>
                                                    </a>


                                                </td>
                                            </tr>

                                        </tbody> <%}
                                                }%>
                                    </table>

                                </div>
                            </div>
                            <%} else {%>
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
                    <div class="modal fade" id="ModalAlterarInvestimento" tabindex="-1" role="dialog" aria-labelledby="ModalAlterarLabelInvestimento" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalAlterarLabelInvestimento">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Alterar Investimento</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                <div class="col-sm-12 col-md-10 col-lg-8">
                                                    <form name="alterar_investimento" action="alterar_investimento.do" method="post">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-8">
                                                                <label for="data"> Data: </label>
                                                                <input type="date" class="form-control" id="data" placeholder="Data" name="data" required />
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="hora"> Hora: </label>
                                                                <input type="time" class="form-control" id="hora" placeholder="Hora" name="hora" required />
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

