package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ContaDAO extends DataBaseDAO{

    
    public void inserir(Conta c) throws Exception{
        String sql = "INSERT INTO conta (banco, contaBancaria, agencia, nomeCartao, dataExpiracao, cliente_id)"
                + "VALUES (?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getBanco());
        pstm.setString(2, c.getContaBancaria());
        pstm.setString(3, c.getAgencia());
        pstm.setString(4, c.getNomeCartao());
        pstm.setDate(5, (Date) c.getDataExpiracao());
        pstm.setInt(6, c.getCliente().getId());
        pstm.execute();
        this.desconectar();
    }
}
