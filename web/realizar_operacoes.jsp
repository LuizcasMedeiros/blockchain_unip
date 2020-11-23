<%-- 
    Document   : realizar_operacoes
    Created on : 02/11/2020, 16:49:28
    Author     : luizf
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="modelo.InvestimentoDAO"%>
<%@page import="modelo.Investimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Investimento inv = new Investimento();
    
    try{
        int investimentos_id = Integer.parseInt(request.getParameter("investimentos_id"));
        
        InvestimentoDAO invDAO = new InvestimentoDAO();
        inv = invDAO.CarregarPorId(investimentos_id);
        
    }catch (Exception e){
        out.println("Erro"+e);
    }
%>
<%
    NumberFormat z = NumberFormat.getCurrencyInstance();

%>
<html lang="pt-br">
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
                    <%@include file="top_bar.jsp" %>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Operações </h1>


                        <!-- Content -->
                     
                        <div class="card shadow mb-4">
                             <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Realizar Operações</h6>
                                </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form  action="redirecionar_op.do" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-sm-4">
                                                    <label for="inputValor">Saldo disponivel para operação:</label>
                                                    <input type="text" class="form-control" id="inputValor" value="<%=z.format(inv.getValor())%>"  readonly required />
                                                </div>

                                                <div class="form-group col-sm-4">
                                                    <label for="inputoperacao">Tipo de operação </label>
                                                    <input type="text" class="form-control"  id="inputoperacao" list="tipoOperacao"  placeholder="Operações" name="descricao_op" autocomplete="off" required />

                                                    <input type="hidden" name="id_investimento" value="<%=inv.getId()%>"/>
                                                    <datalist id="tipoOperacao">
                                                     
                                                        <option value="Depositar"></option>
                                                        <option value="Sacar"></option>
                                                        <option value="Consultar"></option>
                                                          
                                                    </datalist>
                                                </div>

                                            </div>

                                            <div class="form-row">
                                                <div class="col-sm-12">
                                                    <input type="submit" class="btn btn-primary" value="Continuar"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                            
                         <!--
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <h6>Adicione uma conta para o seu perfil para continuar</h6>
                                    <button  type="button" class="btn btn-primary btn-sm">
                                          <i class="fas fa-search-dollar"></i>
                                    </button>
                                </div> 
                            </div>
                          -->  
                      
                         
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
