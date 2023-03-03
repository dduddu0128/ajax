package com.bit.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.ajax.model.BoardDao;
import com.bit.ajax.model.BoardDto;


public class UpdateController extends HttpServlet{
	

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setHeader("Access-Control-Allow-Origin", "*");
		      resp.setHeader("Access-Control-Allow-Credentials", "true");
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			
			//매개변수값은 jsp화면단에 인풋의 name또는 id와 같아야함
			String param1=req.getParameter("title");
			String param2=req.getParameter("cont");
			String param3=req.getParameter("writer");
			
			String title=param1.trim();
			String content=param2.trim();
			String writer=param3.trim();
			
			BoardDao dao=new BoardDao();
			try {
				dao.UpdateOne(writer,title,content);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
}
