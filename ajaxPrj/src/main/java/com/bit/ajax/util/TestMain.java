package com.bit.ajax.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.bit.ajax.util.Sql;

public class TestMain {

	public static void main(String[] args) throws SQLException {
		Connection conn = Sql.getConnection();
		System.out.println(conn!=null);
		if(conn!=null)conn.close();
	}
}
