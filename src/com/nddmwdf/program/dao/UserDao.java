package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.User;
import com.nddmwdf.program.util.DbUtil;

import java.sql.*;

public class UserDao {
    public void deleteUser(int id)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "DELETE FROM users where user_id = '"+ id+"'" ;
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addUser(String loginName,String loginPass,String name,String sex)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con=dbUtil.getConnection();
        String sql="INSERT INTO users (user_loginName,user_loginPass,user_Name,user_Sex) VALUES ('" + loginName +"','"+ loginPass+ "','"+name+"','"+sex+"')";
        try
        {
            Statement st=con.createStatement();
            st.executeUpdate(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public boolean validateUser(User user)
    {
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        boolean valid=false;
        String sql="select * from users where user_loginName=? and user_loginPass=?";
        con =dbUtil.getConnection();
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1,user.getLoginName());
            pst.setString(2,user.getLoginPass());
            rs=pst.executeQuery();
            if(rs.next())
            {
                valid=true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return valid;
    }

    public int isExists(String uname)
    {
        String sql="SELECT * from users where user_loginName=?";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        User user=null;
        try
        {
            ps=(PreparedStatement)con.prepareStatement(sql);
            ps.setString(1,uname);
            resultSet=(ResultSet)ps.executeQuery();
            if(resultSet.next())
            {
                user=new User();
                user.setId(resultSet.getInt("user_id"));
                user.setLoginName(resultSet.getString("user_loginName"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        if(user!=null)
        {
            return 1;
        }
        return 0;
    }
}
