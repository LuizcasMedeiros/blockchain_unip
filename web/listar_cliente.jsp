<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.Conta"%>
<%@page import="modelo.ContaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>



<%
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try {
        ClienteDAO cDAO = new ClienteDAO();
        ContaDAO coDAO = new ContaDAO();
        lista = cDAO.listarJoin();
        
    } catch (Exception e) {
        out.print("error" + e);
    }

%>

<%
    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");


%>


<!DOCTYPE html>
<html lang="pt-br">

    <% String name = "Inserir endereço";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>
    <script type="text/javascript">
        function excluir(nome, id) {
            if (confirm("Tem certeza que deseja excluir o cliente: " + nome + "?")) {
                window.open("excluir_cliente.do?op=c&id=" + id, "_self");
            }
        }
    </script>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="banner.jsp" %>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" id="pesquisa" action="processa_pesquisa.jsp" method="get">
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
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Linha para separar area de pesquisa e o user-->
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav item usuario -->

                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        <%out.print(cLogado.getNome());%>
                                    </span>
                                    <img class="img-profile rounded-circle" src="" alt="logo">
                                </a>
                                <!-- Dropdown - Informações de usuarios -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logoff.jsp" data-toggle="modal" data-target="#logoutModal">
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
                        <h1 class="h3 mb-2 text-gray-800">Cliente</h1>


                        <!-- Tabela -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Listar Cliente</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" id="resultado">
                                    <table class="table table-striped table-dark" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>Data de nascimento</th>
                                                <th>USER</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>NOME</th>
                                                <th>EMAIL</th>
                                                <th>Data de nascimento</th>
                                                <th>USER</th>
                                                <th>OPÇÕES</th>
                                            </tr>
                                        </tfoot>
                                        <% 
                                            
                                            for (Cliente c
                                                    : lista) {
                                                if(cLogado.getPerfil().getNome().equals("Admin")){
                                                    
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%=c.getId()%></td>
                                                <td> <%=c.getNome()%></td>
                                                <td> <%=c.getEmail()%></td>
                                                <td> <%=df.format(c.getData_nascimento())%></td>
                                                <td> <%=c.getUser()%></td>
                                                <td>  
                                                    <a onclick="excluir('<%=c.getNome()%>', <%=c.getId()%>)"  class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                        data-toggle="modal" 
                                                        data-target="#ModalAlterarCliente"
                                                        data-whatever="<%=c.getId()%>"
                                                        data-whatevernome="<%=c.getNome()%>" 
                                                        data-whateveremail="<%=c.getEmail()%>"  
                                                        data-whatevercelular="<%=c.getCelular()%>"  
                                                        data-whatevercpf="<%=c.getCpf()%>" 
                                                        data-whateverdata_nascimento="<%=c.getData_nascimento()%>" 
                                                         
                                                    >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                    <%if (c.getConta().getId() != 0) {%>
                                                    <a  href="#"class="btn btn-info btn-sm">
                                                        Conta já adicioanda.
                                                    </a>
                                                    <%} else if(c.getConta().getId() == 0 && c.getId() == (cLogado.getId())){%>
                                                    <a  href="adicionar_cartao.jsp"class="btn btn-info btn-sm">
                                                        <i class="fas fa-search-dollar"></i>
                                                        <img src="assets/pag.png" alt="alterar"/>
                                                    </a>
                                                   <%}else{%>
                                                   
                                                   
                                                   <%}%>
                                            </tr>

                                        </tbody>  <%}else if(c.getId() == cLogado.getId()){%>

                                          <tbody>
                                            <tr>
                                                <td><%=c.getId()%></td>
                                                <td> <%=c.getNome()%></td>
                                                <td> <%=c.getEmail()%></td>
                                                <td> <%=df.format(c.getData_nascimento())%></td>
                                                <td> <%=c.getUser()%></td>
                                                <td>  
                                                    <a onclick="excluir('<%=c.getNome()%>', <%=c.getId()%>)"  class="btn btn-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                    <button  type="button" class="btn btn-primary btn-sm" 
                                                        data-toggle="modal" 
                                                        data-target="#ModalAlterarCliente"
                                                        data-whatever="<%=c.getId()%>"
                                                        data-whatevernome="<%=c.getNome()%>" 
                                                        data-whateveremail="<%=c.getEmail()%>"  
                                                        data-whatevercelular="<%=c.getCelular()%>"  
                                                        data-whatevercpf="<%=c.getCpf()%>" 
                                                        data-whateverdata_nascimento="<%=c.getData_nascimento()%>" 
                                                         
                                                    >
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </button>
                                                    <%if (c.getConta().getId() != 0) {%>
                                                    <a  href="#"class="btn btn-info btn-sm">
                                                        Cartão adicionado
                                                    </a>
                                                    <%} else {%>
                                                    <a  href="adicionar_cartao.jsp"class="btn btn-info btn-sm">
                                                        <i class="fas fa-search-dollar"></i>
                                                        <img src="assets/pag.png" alt="alterar"/>
                                                    </a>
                                            </tr>

                                        </tbody>          

            <%}}}%>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Final do container  -->


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
                                                    <form name="alterar_cliente" action="alterar_cliente.do" method="post">
                                                        <div class="form-row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="nome"> Nome: </label>
                                                                <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" required />
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="email"> Email: </label>
                                                                <input type="text" class="form-control" id="email" placeholder="Email" name="email" required />
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="cpf"> Cpf: </label>
                                                                <input id="cpf" class="form-control form-control-user" type="text"  placeholder="Cpf" name="cpf"   OnKeyPress="formatar('###.###.###-##', this)" maxlength="14" minlength="14"  required/> 
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="data_nascimento"> Data de nascimento: </label>
                                                                <input id="data_nascimento" class="form-control form-control-user" type="date"   name="data_nascimento"  required/> 
                                                            </div>  


                                                            <div class="form-group col-sm-6">
                                                                <label for="celular"> Celular </label>
                                                                <input id="celular" class="form-control form-control-user" type="text"  placeholder="XX XXXXX-XXXX" name="celular" OnKeyPress="formatar('## #####-####', this)" minlength="13" maxlength="13" required/> 
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
