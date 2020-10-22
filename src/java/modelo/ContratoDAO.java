package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ContratoDAO extends DataBaseDAO
{
    
    public void inserir(Contrato ct) throws Exception{
        String sql = "INSERT INTO contrato (descricao, data_inclusao, dataEncerramento, valor, juros, id_cliente)"
                + "VALUES (?,now(),?,?,?,?)";
        
        this.conectar();
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ct.getDescricao());
        pstm.setDate(2, (Date) ct.getDataEncerramento());
        pstm.setDouble(3, ct.getValor());
        pstm.setDouble(4, ct.getJuros());
        pstm.setInt(5, ct.getCliente().getId());
        
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Contrato> listar() throws Exception {
        ArrayList<Contrato> lista = new ArrayList<Contrato>();
        String sql = "SELECT * FROM contrato";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Contrato ct = new Contrato();
            ct.setId(rs.getInt("id"));
            ct.setDescricao(rs.getString("descricao"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setJuros(rs.getDouble("juros"));
            ct.setValor(rs.getDouble("valor"));
            lista.add(ct);
        }
        this.desconectar();
        return lista;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM contrato WHERE id=?";
     
         
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    
    
      public void alterar (Contrato ct) throws Exception{
        String sql = "UPDATE contrato SET descricao=?, data_inclusao=?"
                + ", data_encerramento=?, valor=?, juros=?"
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ct.getDescricao());
        pstm.setDate(2, (Date) ct.getDataEncerramento());
        pstm.setDouble(3, ct.getValor());
        pstm.setDouble(4, ct.getJuros());
        pstm.setInt(5, ct.getCliente().getId());
        pstm.setInt(3,ct.getId());
        pstm.execute();
        this.desconectar();
    }
      
       public Contrato carregarPorId(int id) throws Exception{
        Contrato ct = new Contrato();
        String sql = "SELECT * FROM contrato WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            ct.setId(rs.getInt("id"));
            ct.setDescricao(rs.getString("descricao"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setJuros(rs.getDouble("juros"));
            ct.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return ct;
    }
    

    
    
    
    

}
