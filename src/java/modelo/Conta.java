package modelo;

import java.util.Date;


public class Conta {
     private int id;
     private String banco;
     private String contaBancaria;
     private String agencia;
     private String nomeCartao;
     private Date dataExpiracao;
     private String tipo;
     private Cliente cliente;

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public int getId() {
        return id;
    }
    

    public void setId(int id) {
        this.id = id;
    }
    

    public String getTipo() {
        return tipo;
    }
    

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public String getContaBancaria() {
        return contaBancaria;
    }

    public void setContaBancaria(String contaBancaria) {
        this.contaBancaria = contaBancaria;
    }

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    public String getNomeCartao() {
        return nomeCartao;
    }

    public void setNomeCartao(String nomeCartao) {
        this.nomeCartao = nomeCartao;
    }

    public Date getDataExpiracao() {
        return dataExpiracao;
    }

    public void setDataExpiracao(Date dataExpiracao) {
        this.dataExpiracao = dataExpiracao;
    }
     
}
