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
import modelo.Investimento;
import modelo.InvestimentoDAO;
import modelo.Operacoes;
import modelo.OperacoesDAO;

/**
 *
 * @author luizf
 */
public class RealizarOp extends HttpServlet {

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
            out.println("<title>Servlet RealizarOp</title>");            
            out.println("</head>");
            out.println("<body>");
            
             HttpSession session = request.getSession(); 
            try{
                Double valor_op = Double.parseDouble(request.getParameter("valor_op"));
                Operacoes op = (Operacoes) session.getAttribute("operacao");
                
                
                
                if(valor_op != 0 && op.getDescricao().equals("Depositar")){
                    OperacoesDAO opDAO = new OperacoesDAO();
                    
                    InvestimentoDAO inDAO = new InvestimentoDAO();
                    Investimento inv = new Investimento();
                    
                    op.setValor(valor_op);
                    op.setDescricao(op.getDescricao());
                    
                    opDAO.inserir(op);
                    
                    
                    op.getInvestimento().setValor(op.depositar(op.getValor(), op.getInvestimento().getValor()));
                    
                    
                    inv.setValor(op.getInvestimento().getValor());
                    inv.setId(op.getInvestimento().getId());
                      
                    
                    inDAO.alterarValorOp(inv);
                    
                    
                    session.removeAttribute("operacao");
                    
                    response.sendRedirect("listar_investimento.jsp");
                }else if(valor_op != 0 && op.getDescricao().equals("Sacar")){
                    OperacoesDAO opDAO = new OperacoesDAO();
                    
                    InvestimentoDAO inDAO = new InvestimentoDAO();
                    Investimento inv = new Investimento();
                    
                    op.setValor(valor_op);
                    op.setDescricao(op.getDescricao());
                    
                    opDAO.inserir(op);
                    
                    
                    op.getInvestimento().setValor(op.sacar(op.getInvestimento().getValor(), op.getValor()));
                    
                    
                    inv.setValor(op.getInvestimento().getValor());
                    inv.setId(op.getInvestimento().getId());
                      
                    
                    inDAO.alterarValorOp(inv);
                    
                    session.removeAttribute("operacao");
                    
                    response.sendRedirect("listar_investimento.jsp");
                      
                }else if(op.getDescricao().equals("Consultar"))
                {
                    response.sendRedirect("listar_operacoes_investimento.jsp");
                }                    
                
            }catch (Exception e){
                out.println("error:"+e);
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
