<%-- 
    Document   : cadastra_funcionario_dados_trabalhistas
    Created on : 16/11/2020, 09:14:13
    Author     : luizf
--%>

<%@page import="java.sql.Date"%>
<%@page import="modelo.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Funcionario funcionario = new Funcionario();
    try{
       String nome = request.getParameter("nome"); 
       String cpf = request.getParameter("cpf"); 
       String rg = request.getParameter("rg"); 
       String celular = request.getParameter("celular"); 
       String status_civil = request.getParameter("status_civil"); 
       int qtd_filhos = Integer.parseInt(request.getParameter("qtd_filhos")); 
       String afiliacao = request.getParameter("afiliacao"); 
       Date data_nascimento = (Date) Date.valueOf(request.getParameter("data_nascimento"));
       
       funcionario.setNome(nome);
       funcionario.setCpf(cpf);
       funcionario.setRg(rg);
       funcionario.setTelefone(celular);
       funcionario.setEstadoCivil(status_civil);
       funcionario.setQtd_filhos(qtd_filhos);
       funcionario.setAfiliacao(afiliacao);
       
       funcionario.setData_nascimento(data_nascimento);
       session.setAttribute("funcionario_cadastro", funcionario);
    }catch(Exception e){
       out.print("error"+e); 
    }

%>
<html lang="pt-br">
       <% String name = "Cadastro de Funcionario";%>
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

                    <!-- Topbar -->
                    <%@include file="top_bar_funcionario.jsp" %>
                    <!-- Final da barra topo -->

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Funcionario</h1>


                        <!-- Content -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Cadastrar Funcionario</h6>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                        <form  id="funcionario" action="cadastra_funcionario_endereco.jsp" method="post" onsubmit="return validar()">
                                            <div class="form-row">
                                                
                                                <div class="form-group col-sm-5">
                                                    <label for="inputCtps">CTPS: </label>
                                                    <input type="text" class="form-control" id="inputCtps"  placeholder="Informe o numero da carteira de trabalho" name="ctps"  required />
                                                </div>

                                                <div class="form-group col-sm-5">
                                                    <label for="pis"> PIS: </label>
                                                    <input class="form-control" type="text"  placeholder="Pis" name="pis"  id="pis" maxlength="11"  required/> 
                                                </div>

                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-sm-3">
                                                    <label for="cargo">CARGO:</label> 
                                                    <input id="cargo" class="form-control" type="text" name="cargo" placeholder="Cargo" required/> 
                                                </div>
                                                
                                                 <div class="form-group col-sm-3">
                                                    <label for="setor">SETOR:</label> 
                                                    <input id="setor" class="form-control" type="text" name="setor" placeholder="Setor" required/> 
                                                </div>  
                                                <div class="form-group col-sm-4">
                                                    <label for="data_admissao"> DATA DE ADMISSÃO: </label>
                                                    <input class="form-control" type="date"  name="data_admissao"  id="data_admissao"  required/> 
                                                </div>
                                            </div>  
                                            <div class="form-row">
                                                <div class="form-group col-sm-5">
                                                    <label for="email">EMAIL:</label> 
                                                    <input id="email" class="form-control" type="email" placeholder="Email do funcionario" name="email"  required/> 
                                                </div>
                                                
                                                 <div class="form-group col-sm-5">
                                                    <label for="cemail">CONFIRMAR EMAIL:</label> 
                                                    <input id="cemail" class="form-control" type="email" placeholder="Confirmar email do funcionario"  required/> 
                                                </div>  
                                            </div> 
                                            <div class="form-row" id="existe">
                                            
                                            </div>
                                             <div class="form-row">
                                                <div class="form-group col-sm-3">
                                                    <label for="senha">SENHA:</label> 
                                                    <input id="senha" class="form-control" type="password" placeholder="Senha de acesso do funcionario" name="senha"  minlength="3" required/> 
                                                </div>
                                                
                                                 <div class="form-group col-sm-3">
                                                    <label for="confirmarSenha">CONFIRMAR SENHA:</label> 
                                                    <input id="confirmarSenha" class="form-control" type="password" placeholder="Confirmar Senha"   minlength="3"  required/> 
                                                </div>  
                                            </div>  
                                            <div class="form-row">
                                                <div class="col-sm-12">
                                                    <input type="submit" class="btn btn-primary" value="Proximo"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->
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
                <!-- End of Main Content -->

              
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
        <script src="javascript/verifica_email.js"></script>
    </body>
</html>
