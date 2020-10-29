package modelo;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InvestimentoDAO extends DataBaseDAO {

    public void inserir(Investimento in) throws Exception {
        String sql = "INSERT INTO investimentos (data, valor, tipoCriptoativos_id, hora)"
                + "VALUES (?, ?,?, ?)";

        this.conectar();

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, (Date) in.getData());
        pstm.setDouble(2, in.getValor());
        pstm.setInt(3, in.getCriptoativo().getId());
        pstm.setTime(4, in.getHora());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Investimento> listar() throws Exception {
        ArrayList<Investimento> lista = new ArrayList<Investimento>();
        String sql = "SELECT * FROM investimentos";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Investimento in = new Investimento();
            in.setId(rs.getInt("id"));
            in.setData(rs.getDate("data"));
            in.setValor(rs.getDouble("valor"));
            in.setHora(rs.getTime("hora"));

            CriptoativoDAO cDAO = new CriptoativoDAO();

            in.setCriptoativo(cDAO.carregarPorId(rs.getInt("tipoCriptoativos_id")));

            lista.add(in);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Investimento> listarinner() throws Exception {
        ArrayList<Investimento> listaj = new ArrayList<Investimento>();
        String sql = "SELECT inv.*,"
                + "tc.nome "
                + "FROM investimentos inv "
                + "LEFT JOIN "
                + "tipocriptoativos tc "
                + "ON inv.tipoCriptoativos_id = tc.id";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        
        
        while (rs.next()) {
            Investimento in = new Investimento();
            in.setId(rs.getInt("id"));
            in.setData(rs.getDate("data"));
            in.setValor(rs.getDouble("valor"));
            in.setHora(rs.getTime("hora"));

         
            
            CriptoativoDAO cDAO = new CriptoativoDAO();

            in.setCriptoativo(cDAO.carregarPorId(rs.getInt("tipoCriptoativos_id")));

            listaj.add(in);
        }
        this.desconectar();
        return listaj;
    }
    

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM contrato WHERE id=?";

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Investimento in) throws Exception {
        String sql = "UPDATE investimento SET data=?, valor=?"
                + ", tipoCriptoativos_id=?, hora=?"
                + " WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, (Date) in.getData());
        pstm.setDouble(2, in.getValor());
        pstm.setInt(3, in.getCriptoativo().getId());
        pstm.setTime(4, in.getHora());
        pstm.execute();
        this.desconectar();
    }

    public Investimento CarregarPorId (int id) throws Exception {
        Investimento in = new Investimento();
        String sql = "SELECT * FROM investimento WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            in.setId(rs.getInt("id"));
            in.setData(rs.getDate("data"));
            in.setValor(rs.getDouble("valor"));
            in.setHora(rs.getTime("hora"));
            CriptoativoDAO cDAO = new CriptoativoDAO();
            
            in.setCriptoativo(cDAO.carregarPorId(rs.getInt("tipoCriptoativos_id")));
        }
        this.desconectar();
        
        return in;

    }

}
