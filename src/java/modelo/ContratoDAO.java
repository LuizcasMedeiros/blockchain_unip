package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ContratoDAO extends DataBaseDAO {

    public void inserir(Contrato ct) throws Exception {
        String sql = "INSERT INTO contrato (descricao, data_inclusao, data_encerramento, valor)"
                + "VALUES (?,?,?,?)";

        this.conectar();

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ct.getDescricao());
        pstm.setDate(2, (Date) ct.getDataInclusao());
        pstm.setDate(3, (Date) ct.getDataEncerramento());
        pstm.setDouble(4, ct.getValor());

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
            ct.setValor(rs.getDouble("valor"));

            lista.add(ct);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM contrato WHERE id=?";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Contrato ct) throws Exception {
        String sql = "UPDATE contrato SET cliente_id=?"
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(2, ct.getId());
        pstm.execute();
        this.desconectar();
    }

    public void vincularContratoCliente(int cliente_id, int contrato_id) throws Exception {
        String sql = "INSERT INTO cliente_contrato (cliente_id, contrato_id) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        pstm.setInt(2, contrato_id);
        pstm.execute();
        this.desconectar();
    }

    public Contrato carregarPorId(int id) throws Exception {
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
            ct.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return ct;
    }
    
     public boolean contratoAdquiridoBoolean(int cliente_id) throws Exception {
        Contrato ct = new Contrato();
        String sql = "SELECT con.* FROM contrato as con, "
                + "cliente_contrato as cc "
                + "WHERE con.id = cc.contrato_id "
                + "AND  cc.cliente_id=?";
        boolean result;
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            ct.setId(rs.getInt("id"));
            ct.setDescricao(rs.getString("descricao"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setValor(rs.getDouble("valor"));
            result = true;
        }else{
            result = false;
        }
        this.desconectar();
        return result;
    }

    public Contrato contratoAdquirido(int cliente_id) throws Exception {
        Contrato ct = new Contrato();
        String sql = "SELECT con.* FROM contrato as con, "
                + "cliente_contrato as cc "
                + "WHERE con.id = cc.contrato_id "
                + "AND  cc.cliente_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cliente_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            ct.setId(rs.getInt("id"));
            ct.setDescricao(rs.getString("descricao"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return ct;
    }
    
    
    public ArrayList<Contrato> listarContratosAdquiridos() throws Exception {
        ArrayList<Contrato> lista = new ArrayList<Contrato>();
        String sql = "SELECT con.*, cc.contrato_id, c.nome, c.cpf, c.data_nascimento, cc.cliente_id " +
                      "FROM cliente_contrato cc " +
                      "LEFT JOIN contrato con ON con.id = cc.contrato_id " +
                       "LEFT JOIN cliente c ON c.id = cc.cliente_id";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Contrato ct = new Contrato();
            ct.setId(rs.getInt("id"));
            ct.setDescricao(rs.getString("descricao"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setValor(rs.getDouble("valor"));
            ct.setId(rs.getInt("contrato_id"));
            ClienteDAO cDAO = new ClienteDAO();
            ct.setCliente(cDAO.carregarPorId(rs.getInt("cliente_id")));

            lista.add(ct);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Contrato> listarContratosAdquiridosObjCharts()throws Exception {
        ArrayList<Contrato> lista = new ArrayList<Contrato>();
        String sql = "SELECT con.id, con.data_inclusao, con.data_encerramento, con.valor, "
                +     "cc.contrato_id, c.nome, c.cpf, c.data_nascimento, cc.cliente_id " +
                      "FROM cliente_contrato cc " +
                      "LEFT JOIN contrato con ON con.id = cc.contrato_id " +
                       "LEFT JOIN cliente c ON c.id = cc.cliente_id";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Contrato ct = new Contrato();
            ct.setId(rs.getInt("id"));
            ct.setDataInclusao(rs.getDate("data_inclusao"));
            ct.setDataEncerramento(rs.getDate("data_encerramento"));
            ct.setValor(rs.getDouble("valor"));
            ct.setId(rs.getInt("contrato_id"));
            ClienteDAO cDAO = new ClienteDAO();
            Cliente c = new Cliente();
            c.setId(rs.getInt("cliente_id"));
            c.setNome(rs.getString("nome"));
            ct.setCliente(c);

            lista.add(ct);
        }
        this.desconectar();
        return lista;
    }
    
    

  

}
