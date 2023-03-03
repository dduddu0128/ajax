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

public class DeleteController extends HttpServlet{


		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setHeader("Access-Control-Allow-Origin", "*");
		      resp.setHeader("Access-Control-Allow-Credentials", "true");
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			String param1=req.getParameter("writer");
			

			String writer=param1.trim();

			
			BoardDao dao=new BoardDao();
			try {
				dao.deleteOne(writer);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
}
