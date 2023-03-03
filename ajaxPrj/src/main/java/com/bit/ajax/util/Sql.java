package com.bit.ajax.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Sql {
	private static Connection conn;
	private static String driver="com.mysql.cj.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/lecture";
	private static String user=System.getenv("MYSQL_USER");
	private static String password=System.getenv("MYSQL_PW");
	
	public static Connection getConnection() {
		try {
			if(conn==null || conn.isClosed()) {
				System.out.println("db연결 성공");
				Class.forName(driver);
				conn=DriverManager.getConnection(url, user, password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
