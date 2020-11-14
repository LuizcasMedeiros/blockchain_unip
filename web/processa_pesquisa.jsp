<%-- 
    Document   : processa_pesquisa
    Created on : 29/10/2020, 20:57:36
    Author     : luizf
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  
    ArrayList<Cliente> listaa = new ArrayList<Cliente>();
    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    Cliente cLogado = new Cliente();
    cLogado = (Cliente) session.getAttribute("cliente");
    try{
    String nome = request.getParameter("nome");
    ClienteDAO cDAO = new ClienteDAO();
    listaa = cDAO.pesquisarNome(nome);
    }catch(Exception e){
        out.print("error: "+e);
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
                                        <% 
                                            
                                            for (Cliente c
                                                    : listaa) {
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
                                                     <a  href="#"class="btn btn-danger btn-sm">
                                                        Conta Pendente.
                                                     </a>
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


            
             

