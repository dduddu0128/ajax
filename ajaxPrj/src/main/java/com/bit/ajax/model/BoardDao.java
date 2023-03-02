package com.bit.ajax.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.Request;

import com.bit.ajax.util.Sql;

public class BoardDao {
	
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
	public List<BoardDto> getList() {
		System.out.println("getlist");
		String sql = "select * from list order by num desc";
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			conn = Sql.getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);

			
			
			while(rs.next()) {
				BoardDto bean = new BoardDto();
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(rs.getDate("regdate"));
				bean.setVisitcnt(rs.getInt("visitcnt"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}

	public int insertOne(String title, String writer, String content) {
		String sql = "INSERT INTO list VALUES(0, '"+title+"', '"+writer+"', '"+content+" ', current_date , 0)";
		try {
			conn=Sql.getConnection();
			stmt=conn.createStatement();
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public BoardDto findOne(String writer) {
		String sql="select * from list where writer='"+ writer +"'";
		System.out.println(sql);
		BoardDto bean=new BoardDto();
		try {
			conn=Sql.getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setRegdate(rs.getDate("regdate"));
				bean.setVisitcnt(rs.getInt("visitcnt"));
				bean.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bean;
	}

	public void UpdateOne(String writer,String title, String content) throws SQLException{
		System.out.println("update dao 도착");
//		String sql = "update dept set dname=?,ename=? where deptno=?";
		String sql="update list set title =?, content=? where writer=?";
		try {
			conn=Sql.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			
			pstmt.executeUpdate();
			System.out.println("update dao 성공");
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

	public void deleteOne(String writer) throws SQLException {
		String sql="delete from list where writer=?";
		try {
			conn=Sql.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.executeUpdate();
			System.out.println("update dao 성공");
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

	public void countUp(String title) throws SQLException {
		System.out.println("카운트업");
		String sql="update list set visitcnt = visitcnt+1 where title=?";
		try {
			conn=Sql.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,title);
			System.out.println(sql);
			System.out.println(title);
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

}
