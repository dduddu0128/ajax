package com.bit.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.ajax.model.BoardDao;
import com.bit.ajax.model.BoardDto;

public class AddController extends HttpServlet{


		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setHeader("Access-Control-Allow-Origin", "*");
		     resp.setHeader("Access-Control-Allow-Credentials", "true");
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			
			String param1=req.getParameter("title");
			String param2=req.getParameter("writer");
			String param3=req.getParameter("content");
			
			String title=param1.trim();
			String writer=param2.trim();
			String content=param3.trim();
			
			BoardDao dao=new BoardDao();
			if(dao.insertOne(title,writer,content)>0) {
				resp.setStatus(201);
			}else {
				resp.setStatus(400);
			}
		}
}
