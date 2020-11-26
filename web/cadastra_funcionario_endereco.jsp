<%-- 
    Document   : cadastra_funcionario_endereco
    Created on : 16/11/2020, 10:57:06
    Author     : luizf
--%>

<%@page import="java.sql.Date"%>
<%@page import="modelo.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
%>
<%
    session = request.getSession();;
    Funcionario funcionario = new Funcionario();
    Funcionario f = (Funcionario) session.getAttribute("funcionario_cadastro");
    try {
        String ctps = request.getParameter("ctps");
        String pis = request.getParameter("pis");
        String cargo = request.getParameter("cargo");
        String setor = request.getParameter("setor");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        Date data_admissao = (Date) Date.valueOf(request.getParameter("data_admissao"));
        funcionario.setNome(f.getNome());
        funcionario.setCpf(f.getCpf());
        funcionario.setRg(f.getRg());
        funcionario.setTelefone(f.getTelefone());
        funcionario.setEstadoCivil(f.getEstadoCivil());
        funcionario.setQtd_filhos(f.getQtd_filhos());
        funcionario.setAfiliacao(f.getAfiliacao());
        funcionario.setData_nascimento(f.getData_nascimento());
        funcionario.setCtps(ctps);
        funcionario.setPis(pis);
        funcionario.setCargo(cargo);
        funcionario.setSetor(setor);
        funcionario.setEmail(email);
        funcionario.setSenha(senha);
        funcionario.setData_admissao(data_admissao);
        session.setAttribute("funcionario_cadastro", funcionario);
    } catch (Exception e) {
        out.print("error" + e);
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
                                        <form  action="inserir_funcionario.do" method="post" onsubmit="return validar()">
                                            <div class="form-row">
                                                <div class="form-group col-sm-5">
                                                    <label for="cep">CEP:</label>
                                                    <input id="cep" class="form-control" id="cep" type="text"  placeholder="Cep" name="cep"  maxlength="9" OnKeyPress="formatar('#####-###', this)"   required/> 
                                                </div>
                                                <div class="form-group col-sm-5">
                                                    <label for="cidade">CIDADE:</label>
                                                    <input id="cidade" class="form-control" id="cidade" type="text"  placeholder="Cidade" name="localidade" maxlength="100" required/> 
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-sm-5">
                                                    <label for="bairro">BAIRRO:</label>
                                                    <input id="bairro" class="form-control form-control-user" id="bairro" type="text" placeholder="Bairro" name="bairro"  required/> 
                                                </div>
                                                <div class="form-group col-sm-5">
                                                    <label for="rua">RUA:</label>
                                                    <input class="form-control form-control-user" id="rua" type="text" placeholder="Logradouro" name="logradouro"  required/> 
                                                </div>
                                            </div>  

                                            <div class="form-row">
                                                <div class="form-group col-sm-5">
                                                    <label for="bairro">COMPLEMENTO:</label>
                                                    <input id="complemento" class="form-control form-control-user" type="text" placeholder="Complemento" name="complemento" maxlength="255" /> 
                                                </div>
                                                <div class="form-group col-sm-2">
                                                    <label for="rua">UF:</label>
                                                    <input id="uf" class="form-control form-control-user" id="uf" type="text" placeholder="Uf" name="uf"  required readonly/>
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
    </body>
</html>

