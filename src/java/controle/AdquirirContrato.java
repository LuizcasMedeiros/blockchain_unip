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
import modelo.Cliente;
import modelo.Contrato;
import modelo.ContratoDAO;

/**
 *
 * @author luizf
 */
public class AdquirirContrato extends HttpServlet {

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
            out.println("<title>Servlet AdquirirContrato</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try{
               Cliente clientes = (Cliente) session.getAttribute("cliente");
               Contrato contratos = (Contrato) session.getAttribute("contrato");
               
               if(contratos.getId() != 0){
                   Contrato contrato = new Contrato();
                   int cliente_id = clientes.getId();
                   contrato.setId(contratos.getId());
                   
                  
                   
                   ContratoDAO conDAO = new ContratoDAO();
                   
                   conDAO.vincularContratoCliente(cliente_id, contrato.getId());
                   
                   
                   response.sendRedirect("listar_contrato.jsp");
                   
                   
               }else{
                    out.print("<script type='text/javascript'>");
                    out.print("alert('Algo deu errado tente novamente'); ");
                    out.print("window.location.href('logoff.jsp');");
                    out.print("</script>");
               }
                
            }catch(Exception e){
                out.print("error"+e);
                
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
