<%-- 
    Document   : processa_pesquisa_cliente
    Created on : 18/11/2020, 19:09:32
    Author     : luizf
--%>

<%@page import="modelo.Funcionario"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Cliente> listaa = new ArrayList<Cliente>();
    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    Funcionario fLogado = new Funcionario();
    fLogado = (Funcionario) session.getAttribute("funcionario");
    try {
        String nome = request.getParameter("nome");
        ClienteDAO cDAO = new ClienteDAO();
        listaa = cDAO.pesquisarNome(nome);
    } catch (Exception e) {
        out.print("error: " + e);
    }

%>

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
    <%                                            for (Cliente c
                : listaa) {
            if (fLogado.getPerfil().getNome().equals("Gerente") || fLogado.getPerfil().getNome().equals("Admin")) {


    %>
    <tbody>
        <tr>
            <td><%=c.getId()%></td>
            <td> <%=c.getNome()%></td>
            <td> <%=c.getEmail()%></td>
            <td> <%=df.format(c.getData_nascimento())%></td>
            <td> <%=c.getUser()%></td>
            <td>  
                <button  type="button" class="btn btn-primary btn-sm" 
                         data-toggle="modal" 
                         data-target="#ModalMostrarAll<%=c.getId()%>"

                         >
                    <i class="fas fa-search"></i>
                </button>
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
                <%} else {%>
                <a  href="#"class="btn btn-danger btn-sm">
                    Conta Pendente.
                </a>
                <%}%>


        </tr>
    <div class="modal fade" id="ModalMostrarAll<%=c.getId()%>" tabindex="-1" role="dialog" aria-labelledby="ModalMostrar" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalMostrar"><%=c.getId()%></h5>
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
                                    <h5>Informações Completa do cliente</h5>
                                    <hr>
                                    <p>ID: <%=c.getId()%></p>
                                    <p>NOME: <%=c.getNome()%></p>
                                    <p>CPF: <%=c.getCpf()%></p>
                                    <%if (c.getCpf_responsavel() != null) {%>
                                    <p>CPF RESPONSAVEL: <%=c.getCpf_responsavel()%></p>


                                    <%} else {%>

                                    <%}%>
                                    <p>EMAIL: <%=c.getEmail()%></p>
                                    <p>Data de nascimento: <%=df.format(c.getData_nascimento())%></p>
                                    <p>CELULAR: <%=c.getCelular()%></p>


                                    <hr>

                                    <h5>Informações de Endereço</h5>

                                    <p>CEP: <%=c.getCep()%></p>
                                    <p>CIDADE: <%=c.getLocalidade()%></p>
                                    <p>BAIRRO:<%=c.getBairro()%></p>
                                    <p>LOGRADOURO:<%=c.getLogadouro()%></p>
                                    <p>UF: <%=c.getUf()%></p>
                                    <%if (!c.getComplemento().isEmpty()) {%>
                                    <p>COMPLEMENTO: <%=c.getComplemento()%></p>


                                    <%} else {%>

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
        </tbody>  
        <%} else {%>
        <tbody>
            <tr>
                <td><%=c.getId()%></td>
                <td> <%=c.getNome()%></td>
                <td> <%=c.getEmail()%></td>
                <td> <%=df.format(c.getData_nascimento())%></td>
                <td> <%=c.getUser()%></td>
                <td>  
                    <%if (c.getConta().getId() != 0) {%>
                    <a  href="#"class="btn btn-info btn-sm">
                        Conta já adicioanda.
                    </a>
                    <%} else {%>
                    <a  href="#"class="btn btn-danger btn-sm">
                        Conta Pendente.
                    </a>
                    <%}%>
            </tr>
        </tbody>


        <%}
                        }%>


</table>