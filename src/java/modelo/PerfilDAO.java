/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Administrador
 */
public class PerfilDAO extends DataBaseDAO{
    public void inserir(Perfil p) throws Exception{
        String sql = "INSERT INTO perfil (nome,descricao) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Perfil> listar() throws Exception{
        ArrayList<Perfil> lista = new ArrayList<>();
        String sql = "SELECT * FROM perfil";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        String sql = "DELETE FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Perfil carregarPorId(int id) throws Exception{
        Perfil p = new Perfil();
        String sql = "SELECT * FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setMenus(this.meusMenus(id));
        }
        this.desconectar();
        return p;
    }
    public void alterar(Perfil p) throws Exception{
        String sql = "UPDATE perfil SET nome=?,descricao=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setInt(3, p.getId());
        pstm.execute();
        this.desconectar();
    }
    
    public void desvincularMenu(int perfil_id,int menu_id) throws Exception{
        String sql = "DELETE FROM perfil_menu WHERE perfil_id=? AND menu_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        this.desconectar();
    }
    
    public void vincularMenu(int perfil_id,int menu_id) throws Exception{
        String sql = "INSERT INTO perfil_menu (perfil_id,menu_id) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Menu> meusMenus(int perfil_id) throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu as m, perfil_menu as pm WHERE m.id=pm.menu_id AND pm.perfil_id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Menu> menusNaoVinculados(int perfil_id) throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT menu_id FROM perfil_menu WHERE perfil_id=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
}