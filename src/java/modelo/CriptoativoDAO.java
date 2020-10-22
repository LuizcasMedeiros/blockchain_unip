package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CriptoativoDAO extends DataBaseDAO{
    public void inserir(Criptoativo cp) throws Exception{
        String sql = "INSERT INTO criptoativo (nome, valor)"
                + "VALUES (?,?)";
        
        this.conectar();
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cp.getNome());
        pstm.setDouble(2, cp.getValor());
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Criptoativo> listar() throws Exception {
        ArrayList<Criptoativo> lista = new ArrayList<Criptoativo>();
        String sql = "SELECT * FROM criptoativo";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Criptoativo cp = new Criptoativo();
            cp.setId(rs.getInt("id"));
            cp.setNome(rs.getString("nome"));
            cp.setValor(rs.getDouble("valor"));
            lista.add(cp);
        }
        this.desconectar();
        return lista;
    }
    
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM criptoativo WHERE id=?";
     
         
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    
    
      public void alterar (Criptoativo cp) throws Exception{
        String sql = "UPDATE criptoativo SET nome=?, valor=?"
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cp.getNome());
        pstm.setDouble(2, cp.getValor());
        pstm.setInt(3,cp.getId());
        pstm.execute();
        this.desconectar();
    }
      
       public Criptoativo carregarPorId(int id) throws Exception{
        Criptoativo cp = new Criptoativo();
        String sql = "SELECT * FROM criptoativo WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            cp.setId(rs.getInt("id"));
            cp.setNome(rs.getString("nome"));
            cp.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return cp;
    }
    

}
