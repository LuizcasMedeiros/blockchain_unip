package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ContaDAO extends DataBaseDAO{

    
    public void inserir(Conta c) throws Exception{
        String sql = "INSERT INTO conta (banco, contaBancaria, agencia, nomeCartao, dataExpiracao, tipo, cliente_id, funcionario_id)"
                + "VALUES (?,?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getBanco());
        pstm.setString(2, c.getContaBancaria());
        pstm.setString(3, c.getAgencia());
        pstm.setString(4, c.getNomeCartao());
        pstm.setDate(5, (Date) c.getDataExpiracao());
        pstm.setString(6, c.getTipo());
        pstm.setInt(7, c.getCliente().getId());
        pstm.setInt(8, c.getFuncionario().getMatricula());
        pstm.execute();
        this.desconectar();
    }
    
    
    public void inserirFuncionario (Conta c) throws Exception{
        String sql = "INSERT INTO conta (banco, contaBancaria, agencia, nomeCartao, dataExpiracao, tipo, funcionario_matricula)"
                + "VALUES (?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getBanco());
        pstm.setString(2, c.getContaBancaria());
        pstm.setString(3, c.getAgencia());
        pstm.setString(4, c.getNomeCartao());
        pstm.setDate(5, (Date) c.getDataExpiracao());
        pstm.setString(6, c.getTipo());
        pstm.setInt(7, c.getFuncionario().getMatricula());
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
    
    public Conta CarregarPorId (int id) throws Exception {
        Conta co = new Conta();
        String sql = "SELECT * FROM conta WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            co.setId(rs.getInt("id"));
            co.setBanco(rs.getString("banco"));
            co.setContaBancaria(rs.getString("contaBancaria"));
            co.setNomeCartao(rs.getString("nomeCartao"));
            co.setAgencia(rs.getString("agencia"));
            co.setTipo(rs.getString("tipo"));
            co.setDataExpiracao(rs.getDate("dataExpiracao"));
            ClienteDAO cDAO = new ClienteDAO();
            
            co.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));
        }
        this.desconectar();
        
        return co;

    }
    
   
   
}
