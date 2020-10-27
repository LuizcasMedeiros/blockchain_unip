package modelo;

import java.sql.Time;
import java.util.Date;


public class Investimento 
{
    
    private int id;
    private Double valor;
    private Date data;
    private Time hora;
    private Criptoativo criptoativo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Criptoativo getCriptoativo() {
        return criptoativo;
    }

    public void setCriptoativo(Criptoativo criptoativo) {
        this.criptoativo = criptoativo;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    
    
    
    public Double converteInvestimentoReais (Double valorConvertido){
        
        valorConvertido = getValor()*criptoativo.getValor();
        return valorConvertido;
    }
        

    


    
}
