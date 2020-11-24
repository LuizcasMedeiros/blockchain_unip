/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;


/**
 *
 * @author luizf
 */
public class InserirCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String user = request.getParameter("user");
                String senha= request.getParameter("senha");
                String cpf = request.getParameter("cpf");
                String celular= request.getParameter("celular");
                Date data_nascimento = (Date) Date.valueOf(request.getParameter("data_nascimento"));
                String cep = request.getParameter("cep");
                String localidade = request.getParameter("localidade");
                String bairro = request.getParameter("bairro");
                String logradouro = request.getParameter("logradouro");
                String complemento = request.getParameter("complemento");
                String uf = request.getParameter("uf");
                String cpf_responsavel = request.getParameter("cpf_responsavel");
                String cnpj = request.getParameter("cnpj");
                
                        
                
                if(!nome.isEmpty() && !email.isEmpty()){
                    Cliente c = new Cliente();
                    ClienteDAO cDAO = new ClienteDAO();
                    
                    c.setNome(nome);
                    c.setCpf(cpf);
                    c.setCelular(celular);
                    c.setData_nascimento(data_nascimento);
                    c.setEmail(email); 
                    c.setCep(cep);
                    c.setLocalidade(localidade);
                    c.setBairro(bairro);
                    c.setLogadouro(logradouro);
                    c.setComplemento(complemento);
                    c.setUf(uf);
                    c.setCpf_responsavel(cpf_responsavel);
                    c.setCnpj(cnpj);
                    c.setUser(user);
                    c.setSenha(senha);
                   
                    
                    c.setSenha(c.criptografarSenha(senha));
                    
                    cDAO.inserir(c);
                    
                    response.sendRedirect("login.jsp");
                }else{
                    out.println("Algum campo obrigátorio não foi preenchido");
                }
                    
                
            }catch (Exception e){
                out.println("Error"+e);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
