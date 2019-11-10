package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.Garbage;
import com.nddmwdf.program.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GarbageDao {

    public void addGarbage(String gname,String gdesc,String gtype)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "INSERT INTO garbage(garbage_name,garbage_content,garbage_type) VALUES('"  + gname + "','" + gdesc + "','" + gtype + "')";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            dbUtil.closeCon();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGarbage(int id)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "DELETE FROM garbage where garbage_id = '"+ id+"'" ;
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            dbUtil.closeCon();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterGarbage(int gid,String gname,String gdesc,String gtype)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "UPDATE garbage SET garbage_name='"+gname+"',garbage_content='"+gdesc+"',garbage_type='"+gtype+"' where garbage_id='"+gid+"'";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }
    public List<Garbage> search(String garbage_name)
    {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        try {
            con=dbUtil.getConnection();//1:获取数据库的连接
            //2:书写sql语句
            String name=garbage_name;
            String sql="SELECT * FROM db_garbage_system.garbage WHERE garbage_name LIKE '%"+name+"%'";
            ps=con.prepareStatement(sql);
            //5:执行sql语句
            rs=ps.executeQuery();
            List<Garbage> list = new ArrayList<Garbage>();
            //List user_list =new ArrayList();
            Garbage gbg;
            while(rs.next()){
                gbg=new Garbage();
                //从数据库中获取值设置到实体类的setter方法中
                //users.setAcount(rs.getInt("user_id"));
                gbg.setName(rs.getString("garbage_name"));
                gbg.setContent(rs.getString("garbage_content"));
                gbg.setType(rs.getString("garbage_type"));
                //user_list.add(users);
                list.add(gbg);
            }
            if (rs.next())
            {
                return null;
            }
            dbUtil.closeCon();
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return null;
    }

    public List<Garbage> queryuserlimit(int pageno) throws ClassNotFoundException ,SQLException
    {
        String sql="select * from garbage limit ?,?";
        DbUtil dbUtil=new DbUtil();
        ResultSet rs;
        Connection connection=dbUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,(pageno*5)-5);
        ps.setInt(2,5);
        rs=ps.executeQuery();
        List<Garbage> gb = new ArrayList();
        while(rs.next()){
            Garbage garbage = new Garbage();
            garbage.setId(rs.getInt("garbage_id"));
            garbage.setName(rs.getString("garbage_name"));
            garbage.setContent(rs.getString("garbage_content"));
            garbage.setType(rs.getString("garbage_type"));
            gb.add(garbage);
        }
        rs.close();
        ps.close();
        dbUtil.closeCon();
        return gb;
    }

    public int getPage() throws SQLException,ClassNotFoundException
    {
        String sql="SELECT count(*) from garbage";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        ResultSet resultSet;
        int totalgarbage;
        try
        {
            Statement st=con.createStatement();
            resultSet=st.executeQuery(sql);
            resultSet.next();
            totalgarbage=resultSet.getInt(1);
            return totalgarbage;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return 0;
    }

}
