<%-- 
    Document   : listar_operacoes_investimento
    Created on : 08/11/2020, 05:30:03
    Author     : luizf
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.OperacoesDAO"%>
<%@page import="modelo.Operacoes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
%>
<%
  session = request.getSession();  
  Operacoes opS = (Operacoes) session.getAttribute("operacao");
  ArrayList<Operacoes> lista = new ArrayList<Operacoes>();  
  NumberFormat z = NumberFormat.getCurrencyInstance();
  

  try{
      OperacoesDAO opDAO = new OperacoesDAO();
      lista = opDAO.listar();
      
      
  }catch(Exception e){
      out.print("Error:"+ e);
  }
      
    


%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
 

%>


<html lang="pt-br">
        <% String name = "Listar Operações Feitas";%>
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
                            <h1 class="h3 mb-2 text-gray-800">Historico das Operações do Investimento</h1>


                            <!-- Tabela -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">ID: <%=opS.getInvestimento().getId()%> (Correspodente ao Investimento)</h6>
                                   
                                </div>
                                
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Valor Antes da Operação</th>
                                                    <th scope="col">Valor Depos da operação</th>
                                                    <th scope="col">Valor da operação</th>
                                                    <th scope="col">Data e horario</th>
                                                    <th scope="col">Descrição da operação</th>
                                                    <th scope="col">Nome do criptoativo</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                   <th scope="col">ID</th>
                                                    <th scope="col">Valor Antes da Operação</th>
                                                    <th scope="col">Valor Depos da operação</th>
                                                    <th scope="col">Valor da operação</th>
                                                    <th scope="col">Data e horario</th>
                                                    <th scope="col">Descrição da operação</th>
                                                    <th scope="col">Nome do criptoativo</th>
                                                    
                                                </tr>
                                            </tfoot>
                                            <% 
                                                int i;
                                                int j=0;
                                                Double valor =0.0;
                                                Double valorantes=0.0;
                                                Double valorDepois=0.0;
                                                for (Operacoes op : lista) 
                                                 if(op.getInvestimento().getId() == opS.getInvestimento().getId()){
                                            
                                            {%>
                                            <tbody>
                                                <tr>
                                                    <td scope="row"><%=op.getId()%></td>
                                                   <%
                                                           Double valorInvestimento = op.getInvestimento().getValor();
                                                           Double valorInvestimentototal=+ op.getValor();
                                                           Double valorOp = op.getValor();
                                                           valorDepois = valorDepois;
                                                           if(j>0 && op.getDescricao().equals("Depositar")){
                                                             valorantes=  valorDepois;
                                                             valorDepois = valorantes+valorOp;
                                                            
                                                            
                                                            
                                                           }else if(j == 0 && op.getDescricao().equals("Depositar")){ 
                                                            valorantes = Math.abs((valorOp+valorOp)-(valorInvestimento+valorInvestimentototal));
                                                            valorDepois = Math.abs(valorantes)+valorOp;
                                                           }else if(j > 0 && op.getDescricao().equals("Sacar")){
                                                            valorantes = valorDepois;
                                                            valorDepois = valorantes-valorOp;
                                                           }
                                                            j++;
                                                           
                                                           
                                                       
                                                   %>
                                                    <td><%=z.format(valorantes)%></td>
                                                    <td><%=z.format(valorDepois)%></td>
                                                    <td><%=z.format(op.getValor())%></td>
                                                    <td><%=sdf.format(op.getData_hora())%></td>
                                                    <td><%=op.getDescricao()%></td>
                                                    <td><%=op.getInvestimento().getCriptoativo().getNome()%></td>

                                                    
 
                                                    
                                                </tr>

                                            </tbody> <%}}%>
                                        </table>
                                    </div>
                                </div>
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
                            <a class="btn btn-primary" href="logoff_funcionario.jsp">Sair</a>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
