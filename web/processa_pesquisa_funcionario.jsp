<%-- 
    Document   : processa_pesquisa_funcionario
    Created on : 18/11/2020, 18:43:35
    Author     : luizf
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
    Funcionario fLogado = new Funcionario();
    fLogado = (Funcionario) session.getAttribute("funcionario");
    try {
        String nome = request.getParameter("nome");
        FuncionarioDAO fDAO = new FuncionarioDAO();
        lista = fDAO.pesquisarNome(nome);

    } catch (Exception e) {
        out.print("error" + e);
    }

%>
<%    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

%>

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
                                                if(fLogado.getPerfil().getNome().equals("Gerente") || fLogado.getPerfil().getNome().equals("Admin")){

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
