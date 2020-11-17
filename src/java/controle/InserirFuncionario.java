/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Funcionario;
import modelo.FuncionarioDAO;

/**
 *
 * @author luizf
 */
public class InserirFuncionario extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirFuncionario</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                String cep = request.getParameter("cep");
                String localidade = request.getParameter("localidade");
                String bairro = request.getParameter("bairro");
                String logradouro = request.getParameter("logradouro");
                String complemento = request.getParameter("complemento");
                String uf = request.getParameter("uf");
                
                if (!cep.isEmpty() && !logradouro.isEmpty()) {
                    Funcionario f = (Funcionario) session.getAttribute("funcionario");
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    
                    Funcionario funcionario = new Funcionario();
                    funcionario.setCep(cep);
                    funcionario.setLocalidade(localidade);
                    funcionario.setBairro(bairro);
                    funcionario.setComplemento(complemento);
                    funcionario.setUf(uf);
                    funcionario.setLogradouro(logradouro);
                    funcionario.setNome(f.getNome());
                    funcionario.setCpf(f.getCpf());
                    funcionario.setRg(f.getRg());
                    funcionario.setTelefone(f.getTelefone());
                    funcionario.setEstadoCivil(f.getEstadoCivil());
                    funcionario.setQtd_filhos(f.getQtd_filhos());
                    funcionario.setAfiliacao(f.getAfiliacao());
                    funcionario.setCtps(f.getCtps());
                    funcionario.setPis(f.getPis());
                    funcionario.setCargo(f.getCargo());
                    funcionario.setSetor(f.getSetor());
                    funcionario.setEmail(f.getEmail());
                    funcionario.setSenha(f.getSenha());
                    funcionario.setData_nascimento(f.getData_nascimento());
                    funcionario.setData_admissao(f.getData_admissao());
                    
                    funcionario.setSenha(f.criptografarSenha(f.getSenha()));
                    
                    fDAO.inserir(funcionario);
                    
                    session.removeAttribute("funcionario");
                    response.sendRedirect("listar_funcionarios.jsp");
                } else {
                    out.print("Algum campo obrigatorio não foi preenchido");
                }

              
            } catch (Exception e) {
                out.print("error:" + e);
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
