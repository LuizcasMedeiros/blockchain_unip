
package modelo;

import java.sql.Date;
import java.sql.Time;


public class Operacoes {
   private int id;
   private Date data_hora;
   private String descricao;
   private Double valor;
   private Investimento investimento;
   
   

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }
    public Investimento getInvestimento() {
        return investimento;
    }

    public void setInvestimento(Investimento investimento) {
        this.investimento = investimento;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_hora() {
        return data_hora;
    }

    public void setData_hora(Date data_hora) {
        this.data_hora = data_hora;
    }

 

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
   
    
    public Double depositar (Double valorDeDeposito, Double valorTotal){
           valorTotal = valorDeDeposito +  investimento.getValor();
           investimento.setValor(valorTotal);
           
           return valorTotal;
     }
    
    public Double sacar (Double valorTotal,Double valorSacar){
        if(valorTotal >= valorSacar){
            valorTotal = investimento.getValor() - valorSacar;
            investimento.setValor(valorTotal);
        }else{
            return 0.0;
        }
            
            
        return valorTotal;
    }
    
    public void vender (){}
    
    public void comprar (){}
   
}
