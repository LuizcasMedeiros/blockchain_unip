package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {

    public void inserir(Cliente c) throws Exception {
        String sql = "INSERT INTO cliente (nome, email, cep, localidade, bairro, complemento,logradouro,"
                + "uf, user, senha, cpf, celular, data_nascimento, data_inclusao, perfil_id)"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";

        this.conectar();

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getEmail());
        pstm.setString(3, c.getCep());
        pstm.setString(4, c.getLocalidade());
        pstm.setString(5, c.getBairro());
        pstm.setString(6, c.getComplemento());
        pstm.setString(7, c.getLogadouro());
        pstm.setString(8, c.getUf());
        pstm.setString(9, c.getUser());
        pstm.setString(10, c.getSenha());
        pstm.setString(11, c.getCpf());
        pstm.setString(12, c.getCelular());
        pstm.setDate(13, (Date) c.getData_nascimento());
        pstm.setInt(14, c.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("Cpf"));
            c.setEmail(rs.getString("email"));
            c.setUser(rs.getString("user"));
            c.setCelular(rs.getString("celular"));
            c.setData_nascimento(rs.getDate("data_nascimento"));

            PerfilDAO pdao = new PerfilDAO();
            c.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));
            
          

            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    public ArrayList<Cliente> pesquisarNome(String nome) throws Exception {
        ArrayList<Cliente> lista = new ArrayList<>();
        String sql = "SELECT c.*, co.id "
                + "FROM cliente c "
                + "LEFT JOIN conta co "
                + "ON co.cliente_id = c.id "
                + "WHERE c.nome LIKE ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,"%" + nome + "%");
        ResultSet rs = pstm.executeQuery();
       
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("Cpf"));
            c.setEmail(rs.getString("email"));
            c.setUser(rs.getString("user"));
            
            ContaDAO coDAO = new ContaDAO();

            c.setConta(coDAO.CarregarPorId(rs.getInt("id")));
            
            PerfilDAO pdao = new PerfilDAO();
            c.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));
            lista.add(c);
        }
        this.desconectar();
        return lista;
       
    }

    public ArrayList<Cliente> listarJoin() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT c.*, co.id "
                + "FROM cliente c "
                + "LEFT JOIN conta co "
                + "ON co.cliente_id = c.id";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("Cpf"));
            c.setEmail(rs.getString("email"));
            c.setUser(rs.getString("user"));
            c.setCelular(rs.getString("celular"));
            c.setData_nascimento(rs.getDate("data_nascimento"));
            

            ContaDAO coDAO = new ContaDAO();

            c.setConta(coDAO.CarregarPorId(rs.getInt("id")));

            PerfilDAO pdao = new PerfilDAO();
            c.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));

            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM cliente WHERE id=?";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET nome=?, email=?, celular=?, data_nascimento=?, cpf=? "
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getEmail());
        pstm.setString(3, c.getCelular());
        pstm.setDate(4, (Date) c.getData_nascimento());
        pstm.setString(5, c.getCpf());
        pstm.setInt(6, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public void alterarEndereco(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET cep=?, localidade=? , bairro=?, complemento=?, logadouro=?, uf=?"
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getCep());
        pstm.setString(2, c.getLocalidade());
        pstm.setString(3, c.getBairro());
        pstm.setString(4, c.getComplemento());
        pstm.setString(5, c.getLogadouro());
        pstm.setString(6, c.getUf());
        pstm.setInt(7, c.getId());
        pstm.execute();
        this.desconectar();

    }

    public Cliente carregarPorId(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setEmail(rs.getString("email"));
            c.setUser(rs.getString("user"));
            c.setCelular(rs.getString("celular"));
            c.setCpf(rs.getString("cpf"));
            c.setSenha(rs.getString("senha"));
            c.setData_nascimento(rs.getDate("data_nascimento"));

            PerfilDAO pdao = new PerfilDAO();
            c.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));
        }
        this.desconectar();
        return c;
    }

    public Cliente carregarPorIdEndereco(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setCep(rs.getString("cep"));
            c.setLocalidade(rs.getString("localidade"));
            c.setBairro(rs.getString("bairro"));
            c.setComplemento(rs.getString("complemento"));
            c.setLogadouro(rs.getString("logadouro"));
            c.setUf(rs.getString("uf"));
        }
        this.desconectar();
        return c;
    }

    public Cliente logar(String user, String senha) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE user=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setUser(rs.getString("user"));
                c.setSenha(rs.getString("senha"));
                PerfilDAO pDAO = new PerfilDAO();
                c.setPerfil(pDAO.carregarPorId(rs.getInt("perfil_id")));
            }
        }
        this.desconectar();
        return c;
    }

}
