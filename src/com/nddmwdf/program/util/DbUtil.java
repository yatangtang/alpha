package com.nddmwdf.program.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DbUtil {



	private String dbUrl = "jdbc:mysql://localhost:3306/db_garbage_system?useUnicode=true&characterEncoding=utf8";
	private String dbUser = "root";
	private String dbPassword = "";
	private String driver = "com.mysql.jdbc.Driver";

	private Connection connection = null;

	public Connection getConnection(){
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			System.out.println("数据库连接成功");
		} catch (Exception e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		return connection;
	}
	
	public void closeCon(){
		if(connection != null)
			try {
				connection.close();
				System.out.println("数据库已关闭");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
