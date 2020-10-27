package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ContaDAO extends DataBaseDAO{

    
    public void inserir(Conta c) throws Exception{
        String sql = "INSERT INTO conta (banco, contaBancaria, agencia, nomeCartao, dataExpiracao, tipo, cliente_id)"
                + "VALUES (?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getBanco());
        pstm.setString(2, c.getContaBancaria());
        pstm.setString(3, c.getAgencia());
        pstm.setString(4, c.getNomeCartao());
        pstm.setDate(5, (Date) c.getDataExpiracao());
        pstm.setString(6, c.getTipo());
        pstm.setInt(7, c.getCliente().getId());
        pstm.execute();
        this.desconectar();
    }
    
    
    
    public ArrayList<Conta> listar() throws Exception {
        ArrayList<Conta> lista = new ArrayList<Conta>();
        String sql = "SELECT * FROM conta";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Conta c = new Conta();
            c.setId(rs.getInt("id"));
            c.setBanco(rs.getString("banco"));
            c.setContaBancaria(rs.getString("contaBancaria"));
            c.setNomeCartao(rs.getString("nomeCartao"));
            c.setTipo(rs.getString("tipo"));
            
            ClienteDAO cDAO = new ClienteDAO();
            c.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
            

            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    
   
   
}
