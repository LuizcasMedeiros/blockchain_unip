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
import modelo.Funcionario;
import modelo.FuncionarioDAO;

/**
 *
 * @author luizf
 */
public class AlterarFuncionario extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarFuncionario</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                int matricula = Integer.parseInt(request.getParameter("matricula"));
                String nome = request.getParameter("nome");
                Date data_nascimento = (Date) Date.valueOf(request.getParameter("data_nascimento"));
                String cpf = request.getParameter("cpf");
                String rg = request.getParameter("rg");
                String celular= request.getParameter("celular");
                String ctps = request.getParameter("ctps");
                String pis = request.getParameter("pis");
                String cargo = request.getParameter("cargo");
                String setor = request.getParameter("setor");
                Date data_admissao = (Date) Date.valueOf(request.getParameter("data_admissao"));
               
               
                
                if(!nome.isEmpty() && !cpf.isEmpty()){
                    Funcionario f = new Funcionario();
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    
                    f.setNome(nome);
                    f.setCpf(cpf);
                    f.setTelefone(celular);
                    f.setData_nascimento(data_nascimento);
                    f.setRg(rg);
                    f.setCtps(ctps);
                    f.setData_admissao(data_admissao);
                    f.setPis(pis);
                    f.setCargo(cargo);
                    f.setSetor(setor);
                    f.setMatricula(matricula);
                    
                    
                    fDAO.alterar(f);
                    
                    response.sendRedirect("listar_funcionarios.jsp");
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
