<%-- 
    Document   : listar_funcionarios
    Created on : 16/11/2020, 18:58:36
    Author     : luizf
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
    try {
        FuncionarioDAO fDAO = new FuncionarioDAO();
        lista = fDAO.listar();

    } catch (Exception e) {
        out.print("error" + e);
    }

%>
<%    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

%>
<!DOCTYPE html>
<html lang="pt-br">
    <% String name = "Listar Funcionario";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <script type="text/javascript">
        function excluir(nome, matricula) {
            if (confirm("Tem certeza que deseja excluir o Funcionario: " + nome + "?")) {
                window.open("excluir_funcionario.do?op=c&id=" + matricula, "_self");
            }
        }
    </script>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="banner_funcionario.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" id="pesquisaTopBar" action="processa_pesquisa_funcionario.jsp" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" name="nome" id="pesquisaCliente" placeholder="Pesquise pelo o nome..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-secondary" type="submit">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Search -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search" id="pesquisaDropdown" action="processa_pesquisa_funcionario.jsp" method="get">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" name="nome" id="pesquisa" placeholder="Pesquise pelo o nome..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-secondary" type="submit">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>





                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=fLogado.getNome()%></span>
                                    <img class="img-profile rounded-circle" src="assets/source-404.jpg" alt="logo">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>



                    </nav>

                    <!-- Conteudo da pagaina principal container -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Funcionario</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Listar Funcionarios<span><a href="cadastra_funcionario.jsp" class="btn btn-primary mt-2 mb-2">Novo Funcionario</a> </span></h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" id="resultado">
                                    <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>MATRICULA</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>CPF</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>MATRICULA</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>CPF</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <%

                                            for (Funcionario f
                                                    : lista) {
                                                if(fLogado.getPerfil().getNome().equals("Gerente") || fLogado.getPerfil().getNome().equals("Admin") ){

                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%=f.getMatricula()%></td>
                                                <td> <%=f.getNome()%></td>
                                                <td><%=f.getEmail()%></td>
                                                <td> <%=f.getCpf()%></td>
                                                <td>  
                                                    <a onclick="excluir('<%=f.getNome()%>', <%=f.getMatricula()%>)"  class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                             data-toggle="modal" 
                                                             data-target="#ModalAlterarFuncionario"
                                                             data-whatever="<%=f.getMatricula()%>"
                                                             data-whatevernome="<%=f.getNome()%>" 
                                                             data-whateverrg="<%=f.getRg()%>"
                                                             data-whateverpis="<%=f.getPis()%>" 
                                                             data-whateverctps="<%=f.getCtps()%>" 
                                                             data-whateversetor="<%=f.getSetor()%>"
                                                             data-whatevercargo="<%=f.getCargo()%>"  
                                                             data-whateverdata_admissao="<%=f.getData_admissao()%>" 
                                                             data-whatevercelular="<%=f.getTelefone()%>"  
                                                             data-whatevercpf="<%=f.getCpf()%>" 
                                                             data-whateverdata_nascimento="<%=f.getData_nascimento()%>" 

                                                             >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                             data-toggle="modal" 
                                                             data-target="#ModalMostrarAll<%=f.getMatricula()%>"

                                                             >
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                   <%if (f.getConta().getId() != 0) {%>
                                                    <a  href="#"class="btn btn-info btn-sm">
                                                        Conta já adicioanda.
                                                    </a>
                                                    <%} else if(f.getConta().getId() == 0 && f.getMatricula() == (fLogado.getMatricula())){%>
                                                    <a  href="adicionar_cartao_funcionario.jsp"class="btn btn-info btn-sm">
                                                        <i class="fas fa-search-dollar"></i>
                                                        <img src="assets/pag.png" alt="alterar"/>
                                                    </a>
                                                   <%}else{%>
                                                     <a  href="#"class="btn btn-danger btn-sm">
                                                        Conta Pendente.
                                                     </a>
                                                   <%}%>
                                            </tr>


                                            <!-- Modal Visualizar todos-->
                                        <div class="modal fade" id="ModalMostrarAll<%=f.getMatricula()%>" tabindex="-1" role="dialog" aria-labelledby="ModalMostrar" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="ModalMostrar"><%=f.getMatricula()%></h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="card shadow mb-4">
                                                            <div class="card-header py-3">
                                                                <h6 class="m-0 font-weight-bold text-primary">Todas as informações</h6>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                                                        <h5>Informações pessoas e da empresa</h5>
                                                                         <hr>
                                                                        <p>MATRICULA: <%=f.getMatricula()%></p>
                                                                        <p>NOME: <%=f.getNome()%></p>
                                                                        <p>CPF: <%=f.getCpf()%></p>
                                                                        <p>RG: <%=f.getRg()%></p>
                                                                        <p>EMAIL: <%=f.getEmail()%></p>
                                                                        <p>Data de nascimento: <%=df.format(f.getData_nascimento())%></p>
                                                                        <p>Data de admissão: <%=df.format(f.getData_admissao())%></p>
                                                                        <p>CARGO: <%= f.getCargo()%></p>
                                                                        <p>SETOR: <%=f.getSetor()%></p>
                                                                        <p>CELULAR: <%=f.getTelefone()%></p>
                                                                        <p>CTPS: <%=f.getCtps()%></p>
                                                                        <p>PIS: <%=f.getPis()%></p>
                                                                        <p>ESTADO CIVIL: <%=f.getEstadoCivil()%></p>
                                                                        <p>QTD DE FILHOS: <%=f.getQtd_filhos()%></p>
                                                                        <p>AFILIAÇÃO: <%=f.getAfiliacao()%></p>
                                                                        
                                                                        <hr>
                                                                        
                                                                        <h5>Informações de Endereço</h5>
                                                                        <hr>
                                                                        <p>CEP: <%=f.getCep()%></p>
                                                                        <p>CIDADE: <%=f.getLocalidade()%></p>
                                                                        <p>BAIRRO:<%=f.getBairro()%></p>
                                                                        <p>LOGRADOURO:<%=f.getLogradouro()%></p>
                                                                        <p>UF: <%=f.getUf()%></p>
                                                                        <%if(!f.getComplemento().isEmpty()){%>
                                                                        <p>COMPLEMENTO: <%=f.getComplemento()%></p>


                                                                        <%}else{%>
                                                                       
                                                                        <%}%>
                                                                         <hr>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Fim Modal vertodos-->


                                        </tbody>          

                                        <%}else if(f.getMatricula() == fLogado.getMatricula()){%>
                                        
                                          <tbody>
                                            <tr>
                                                <td><%=f.getMatricula()%></td>
                                                <td> <%=f.getNome()%></td>
                                                <td><%=f.getEmail()%></td>
                                                <td> <%=f.getCpf()%></td>
                                                <td> 
                                                     <button  type="button" class="btn btn-primary btn-sm" 
                                                             data-toggle="modal" 
                                                             data-target="#ModalAlterarFuncionario"
                                                             data-whatever="<%=f.getMatricula()%>"
                                                             data-whatevernome="<%=f.getNome()%>" 
                                                             data-whateverrg="<%=f.getRg()%>"
                                                             data-whateverpis="<%=f.getPis()%>" 
                                                             data-whateverctps="<%=f.getCtps()%>" 
                                                             data-whateversetor="<%=f.getSetor()%>"
                                                             data-whatevercargo="<%=f.getCargo()%>"  
                                                             data-whateverdata_admissao="<%=f.getData_admissao()%>" 
                                                             data-whatevercelular="<%=f.getTelefone()%>"  
                                                             data-whatevercpf="<%=f.getCpf()%>" 
                                                             data-whateverdata_nascimento="<%=f.getData_nascimento()%>" 

                                                             >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                             data-toggle="modal" 
                                                             data-target="#ModalMostrarAll<%=f.getMatricula()%>"

                                                     >
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                   <%if (f.getConta().getId() != 0) {%>
                                                    <a  href="#"class="btn btn-info btn-sm">
                                                        Conta já adicioanda.
                                                    </a>
                                                    <%} else if(f.getConta().getId() == 0 && f.getMatricula() == (fLogado.getMatricula())){%>
                                                    <a  href="adicionar_cartao_funcionario.jsp"class="btn btn-info btn-sm">
                                                        <i class="fas fa-search-dollar"></i>
                                                        <img src="assets/pag.png" alt="alterar"/>
                                                    </a>
                                                   <%}else{%>
                                                     <a  href="#"class="btn btn-danger btn-sm">
                                                        Conta Pendente.
                                                     </a>
                                                   <%}%>
                                            </tr>


                                            <!-- Modal Visualizar todos-->
                                        <div class="modal fade" id="ModalMostrarAll<%=f.getMatricula()%>" tabindex="-1" role="dialog" aria-labelledby="ModalMostrar" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="ModalMostrar"><%=f.getMatricula()%></h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="card shadow mb-4">
                                                            <div class="card-header py-3">
                                                                <h6 class="m-0 font-weight-bold text-primary">Todas as informações</h6>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                                    <div class="col-sm-12 col-md-10 col-lg-8">
                                                                        <h5>Informações pessoas e da empresa</h5>
                                                                         <hr>
                                                                        <p>MATRICULA: <%=f.getMatricula()%></p>
                                                                        <p>NOME: <%=f.getNome()%></p>
                                                                        <p>CPF: <%=f.getCpf()%></p>
                                                                        <p>RG: <%=f.getRg()%></p>
                                                                        <p>EMAIL: <%=f.getEmail()%></p>
                                                                        <p>Data de nascimento: <%=df.format(f.getData_nascimento())%></p>
                                                                        <p>Data de admissão: <%=df.format(f.getData_admissao())%></p>
                                                                        <p>CARGO: <%= f.getCargo()%></p>
                                                                        <p>SETOR: <%=f.getSetor()%></p>
                                                                        <p>CELULAR: <%=f.getTelefone()%></p>
                                                                        <p>CTPS: <%=f.getCtps()%></p>
                                                                        <p>PIS: <%=f.getPis()%></p>
                                                                        <p>ESTADO CIVIL: <%=f.getEstadoCivil()%></p>
                                                                        <p>QTD DE FILHOS: <%=f.getQtd_filhos()%></p>
                                                                        <p>AFILIAÇÃO: <%=f.getAfiliacao()%></p>
                                                                        
                                                                        <hr>
                                                                        
                                                                        <h5>Informações de Endereço</h5>
                                                                        
                                                                        <p>CEP: <%=f.getCep()%></p>
                                                                        <p>CIDADE: <%=f.getLocalidade()%></p>
                                                                        <p>BAIRRO:<%=f.getBairro()%></p>
                                                                        <p>LOGRADOURO:<%=f.getLogradouro()%></p>
                                                                        <p>UF: <%=f.getUf()%></p>
                                                                        <%if(!f.getComplemento().isEmpty()){%>
                                                                        <p>COMPLEMENTO: <%=f.getComplemento()%></p>


                                                                        <%}else{%>
                                                                       
                                                                        <%}%>
                                                                         <hr>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Fim Modal vertodos-->
                                        </tbody> 
                                        
                                        <%}}%>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->

                    <!-- Modal Alterar-->

                    <div class="modal fade" id="ModalAlterarFuncionario" tabindex="-1" role="dialog" aria-labelledby="ModalAlterarLabelFuncionario" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalAlterarLabelFuncionario">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Alterar Funcionario</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                <div class="col-sm-12 col-md-10 col-lg-8">
                                                    <form name="alterar_cliente" action="alterar_funcionario.do" method="post">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-8">
                                                                <label for="nome"> Nome: </label>
                                                                <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" required />
                                                            </div>
                                                            <div class="form-group col-sm-8">
                                                                <label for="cpf"> Cpf: </label>
                                                                <input id="cpf" class="form-control form-control-user" type="text"  placeholder="Cpf" name="cpf"   OnKeyPress="formatar('###.###.###-##', this)" maxlength="14" minlength="14"  required/> 
                                                            </div>
                                                            <div class="form-group col-sm-8">
                                                                 <label for="rg"> RG: </label>
                                                                 <input class="form-control" type="text"  placeholder="Rg" name="rg"  id="rg" maxlength="14"  required/> 
                                                            </div>

                                                            <div class="form-group col-sm-8">
                                                                <label for="data_nascimento"> Data de nascimento: </label>
                                                                <input id="data_nascimento" class="form-control form-control-user" type="date"   name="data_nascimento"  required/> 
                                                            </div>  
                                                            <div class="form-group col-sm-8">
                                                                <label for="celular"> Celular </label>
                                                                <input id="celular" class="form-control form-control-user" type="text"  placeholder="XX XXXXX-XXXX" name="celular" OnKeyPress="formatar('## #####-####', this)" minlength="13" maxlength="13" required/> 
                                                            </div>
                                                            <div class="form-group col-sm-8">
                                                                <label for="ctps">CTPS: </label>
                                                                <input type="text" class="form-control" id="ctps"  placeholder="Informe o numero da carteira de trabalho" name="ctps"  required />  
                                                            </div> 
                                                             <div class="form-group col-sm-8">
                                                                <label for="pis"> PIS: </label>
                                                                <input class="form-control" type="text"  placeholder="Pis" name="pis"  id="pis" maxlength="11"  required/> 
                                                             </div> 
                                                            
                                                            <div class="form-group col-sm-6">
                                                                  <label for="setor">SETOR:</label> 
                                                                  <input id="setor" class="form-control" type="text" name="setor" placeholder="Setor" required/> 
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="cargo">CARGO:</label> 
                                                                <input id="cargo" class="form-control" type="text" name="cargo" placeholder="Cargo" required/> 
                                                            </div>
                                                            <div class="form-group col-sm-8">
                                                               <label for="data_admissao"> DATA DE ADMISSÃO: </label>
                                                               <input class="form-control" type="date"  name="data_admissao"  id="data_admissao"  required/>  
                                                            </div>
                                                             <input name="matricula" type="hidden" id="matricula" value=""/>
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
                    <!-- Fim Modal Alterar-->

                    <!-- Modal Visualizar todos-->
                    <div class="modal fade" id="ModalAlterarCliente" tabindex="-1" role="dialog" aria-labelledby="ModalAlterarLabelCliente" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalAlterarLabelCliente">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Alterar Cliente</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row justify-content-center pl-4 mt-4 mb-4">
                                                <div class="col-sm-12 col-md-10 col-lg-8">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fim Modal vertodos-->

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
