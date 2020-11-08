/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author luizf
 */
public class OperacoesDAO extends DataBaseDAO{
    
    public void inserir(Operacoes op) throws Exception {
        String sql = "INSERT INTO operacoes(data_hora, valor, descricao, investimentos_id)"
                + "VALUES (now(),?,?,?)";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, op.getValor());
        pstm.setString(2, op.getDescricao());
        pstm.setInt(3, op.getInvestimento().getId());
    
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Operacoes> listar() throws Exception {
        ArrayList<Operacoes> lista = new ArrayList<Operacoes>();
        String sql = "SELECT * FROM operacoes";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Operacoes c = new Operacoes();
            c.setId(rs.getInt("id"));
           
            
          

            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    
    

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM operacoes WHERE id=?";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Operacoes op) throws Exception {
        String sql = "UPDATE operacoes SET nome=?, email=?, celular=?, data_nascimento=?, cpf=? "
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
      ;
        pstm.execute();
        this.desconectar();
    }

    

    public Operacoes carregarPorId(int id) throws Exception {
        Operacoes op = new Operacoes();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            op.setId(rs.getInt("id"));
           

            
        }
        this.desconectar();
        return op;
    }

    public Operacoes carregarPorIdEndereco(int id) throws Exception {
        Operacoes c = new Operacoes();
        String sql = "SELECT * FROM operacoes WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
           
        }
        this.desconectar();
        return c;
    }

    
    

    
    
    
}
