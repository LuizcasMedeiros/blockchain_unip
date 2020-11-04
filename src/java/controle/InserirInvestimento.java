/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.Criptoativo;
import modelo.CriptoativoDAO;
import modelo.Investimento;
import modelo.InvestimentoDAO;

/**
 *
 * @author luizf
 */
public class InserirInvestimento extends HttpServlet {

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
            out.println("<title>Servlet InserirInvestimento</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                int tipoCriptoativos_id = Integer.parseInt(request.getParameter("tipoCriptoativos_id"));
                int cliente_id= Integer.parseInt(request.getParameter("cliente_id"));
                Double valor= Double.parseDouble(request.getParameter("valor"));
                Date data = (Date) Date.valueOf(request.getParameter("data"));
                String hora_modificada = request.getParameter("hora");
                String segundos = ":00";
                Time hora = (Time) Time.valueOf(hora_modificada+segundos);
                
                if(valor !=0 && tipoCriptoativos_id !=0){
                    Investimento in = new Investimento();
                    InvestimentoDAO inDAO = new InvestimentoDAO();
                    
                    
                    Criptoativo c = new Criptoativo();
                    CriptoativoDAO cDAO = new CriptoativoDAO();
                    c= cDAO.carregarPorId(tipoCriptoativos_id);
                    
                    in.setValor(valor);
                    in.setData(data);
                    in.setHora(hora);
                    
                    in.setValor(in.converteInvestimentoReais(valor, c.getValor()));
                    
                    
                    
                    Criptoativo cp = new Criptoativo();
                    cp.setId(tipoCriptoativos_id);
                    in.setCriptoativo(cp);
                    
                    
                    Cliente cliente = new Cliente();
                    cliente.setId(cliente_id);
                    in.setCliente(cliente);
                    
                    
                    
                    
                    
                    inDAO.inserir(in);
                    
                    
                    response.sendRedirect("listar_investimento.jsp");
                    
                }else{
                    out.print("Algum campo obrigátorio não foi preenchido");
                }
                
            }catch (Exception e){
                out.print("error: "+e);
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
