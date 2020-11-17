package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FuncionarioDAO extends DataBaseDAO {

    public void inserir(Funcionario f) throws Exception {
        String sql = "INSERT INTO funcionario (nome, email, cep, localidade, bairro, complemento,logradouro,"
                + "uf, cpf, cargo, setor, celular, senha, data_admissao,ctps"
                + ",rg,pis, status_civil,qtd_filhos, afiliacao, data_nascimento, perfil_id)"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)";

        this.conectar();

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getEmail());
        pstm.setString(3, f.getCep());
        pstm.setString(4, f.getLocalidade());
        pstm.setString(5, f.getBairro());
        pstm.setString(6, f.getComplemento());
        pstm.setString(7, f.getLogradouro());
        pstm.setString(8, f.getUf());
        pstm.setString(9, f.getCpf());
        pstm.setString(10, f.getCargo());
        pstm.setString(11, f.getSetor());
        pstm.setString(12, f.getTelefone());
        pstm.setString(13, f.getSenha());
        pstm.setDate(14, (Date) f.getData_admissao());
        pstm.setString(15, f.getCtps());
        pstm.setString(16, f.getRg());
        pstm.setString(17, f.getPis());
        pstm.setString(18, f.getEstadoCivil());
        pstm.setInt(19, f.getQtd_filhos());
        pstm.setString(20, f.getAfiliacao());
        pstm.setDate (21, (Date) f.getData_nascimento());
        
        pstm.execute();
        this.desconectar();
    }

    
    public ArrayList<Funcionario> listar() throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT co.id, f.* "+
                    "FROM conta co "+
                    "RIGHT JOIN funcionario f "+
                    "ON co.funcionario_matricula = f.matricula";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            ContaDAO cDAO = new ContaDAO();
            
            f.setConta(cDAO.CarregarPorId(rs.getInt(1)));
            
            f.setMatricula(rs.getInt("matricula"));
            f.setNome(rs.getString("nome"));
            f.setCpf(rs.getString("Cpf"));
            f.setEmail(rs.getString("email"));
            f.setTelefone(rs.getString("celular"));
            f.setData_nascimento(rs.getDate("data_nascimento"));
            f.setData_admissao(rs.getDate("data_admissao"));
            f.setCep(rs.getString("cep"));
            f.setLocalidade(rs.getString("localidade"));
            f.setBairro(rs.getString("bairro"));
            f.setComplemento(rs.getString("complemento"));
            f.setLogradouro(rs.getString("logradouro"));
            f.setUf(rs.getString("uf"));
            f.setCargo(rs.getString("cargo"));
            f.setSetor(rs.getString("setor"));
            f.setCtps(rs.getString("ctps"));
            f.setRg(rs.getString("rg"));
            f.setPis(rs.getString("pis"));
            f.setEstadoCivil(rs.getString("status_civil"));
            f.setQtd_filhos(rs.getInt("qtd_filhos"));
            f.setAfiliacao(rs.getString("afiliacao"));
            
            
       

            PerfilDAO pdao = new PerfilDAO();
            f.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));
            
          

            lista.add(f);
        }
        this.desconectar();
        return lista;
    }
    
    public Funcionario carregarPorId(int id) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            f.setMatricula(rs.getInt("matricula"));
            f.setNome(rs.getString("nome"));
            f.setCpf(rs.getString("Cpf"));
            f.setEmail(rs.getString("email"));
            f.setTelefone(rs.getString("celular"));
            f.setData_nascimento(rs.getDate("data_nascimento"));
            f.setData_admissao(rs.getDate("data_admissao"));
            f.setCep(rs.getString("cep"));
            f.setLocalidade(rs.getString("localidade"));
            f.setBairro(rs.getString("bairro"));
            f.setComplemento(rs.getString("complemento"));
            f.setLogradouro(rs.getString("logradouro"));
            f.setUf(rs.getString("uf"));
            f.setCargo(rs.getString("cargo"));
            f.setSetor(rs.getString("setor"));
            f.setCtps(rs.getString("ctps"));
            f.setRg(rs.getString("rg"));
            f.setPis(rs.getString("pis"));
            f.setEstadoCivil(rs.getString("status_civil"));
            f.setQtd_filhos(rs.getInt("qtd_filhos"));
            f.setAfiliacao(rs.getString("afiliacao"));

            PerfilDAO pdao = new PerfilDAO();
            f.setPerfil(pdao.carregarPorId(rs.getInt("perfil_id")));
        }
        this.desconectar();
        return f;
    }
    
    
    public void alterar(Funcionario f) throws Exception {
        String sql = "UPDATE cliente SET nome=?, email=?, celular=?, data_nascimento=?, cpf=? "
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getEmail());
        pstm.setString(3, f.getCep());
        pstm.setString(4, f.getLocalidade());
        pstm.setString(5, f.getBairro());
        pstm.setString(6, f.getComplemento());
        pstm.setString(7, f.getLogradouro());
        pstm.setString(8, f.getUf());
        pstm.setString(9, f.getCpf());
        pstm.setString(10, f.getCargo());
        pstm.setString(11, f.getSetor());
        pstm.setString(12, f.getTelefone());
        pstm.setString(13, f.getSenha());
        pstm.setDate(14, (Date) f.getData_admissao());
        pstm.setString(15, f.getCtps());
        pstm.setString(16, f.getRg());
        pstm.setString(17, f.getPis());
        pstm.setString(18, f.getEstadoCivil());
        pstm.setInt(19, f.getQtd_filhos());
        pstm.setString(20, f.getAfiliacao());
        pstm.setDate (21, (Date) f.getData_nascimento());
        pstm.execute();
        this.desconectar();
    }

}
