package modelo;

import java.util.ArrayList;
import java.util.Date;


public class Contrato {
    private int id;
    private String descricao;
    private Date dataInclusao;
    private Date dataEncerramento;
    private Double valor;
    private ArrayList <Cliente> cliiente;
    private Cliente cliente;

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    

    public ArrayList<Cliente> getCliiente() {
        return cliiente;
    }

    public void setCliiente(ArrayList<Cliente> cliiente) {
        this.cliiente = cliiente;
    }
  
    
    

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDataInclusao() {
        return dataInclusao;
    }

    public void setDataInclusao(Date dataInclusao) {
        this.dataInclusao = dataInclusao;
    }

    public Date getDataEncerramento() {
        return dataEncerramento;
    }

    public void setDataEncerramento(Date dataEncerramento) {
        this.dataEncerramento = dataEncerramento;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }
    
    
    
}
