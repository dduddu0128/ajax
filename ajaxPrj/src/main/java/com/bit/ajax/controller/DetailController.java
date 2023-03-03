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


public class DetailController extends HttpServlet{


		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setHeader("Access-Control-Allow-Origin", "*");
		      resp.setHeader("Access-Control-Allow-Credentials", "true");
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			
			String writer=req.getParameter("writer");
			String title=req.getParameter("title");
			System.out.println("title: "+title);
			
			
			
			BoardDao dao1=new BoardDao();
			BoardDao dao2=new BoardDao();
			BoardDao dao3=new BoardDao();
			BoardDto bean2=dao1.findOne(writer);
			try {
				dao2.countUp(bean2.getTitle());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			BoardDto bean=dao3.findOne(writer);
			System.out.println(bean);
			PrintWriter out = resp.getWriter();
			try {
				out.println("{\"list\":[");
				out.println("{\"title\":\""+bean.getTitle()+"\", \"writer\":\""+bean.getWriter()+"\",\"regdate\":\""+bean.getRegdate()+"\",\"visitcnt\":"+bean.getVisitcnt()+",\"content\":\""+bean.getContent()+"\"}");
				out.println("]}");
			}finally {
				if(out!=null)out.close();
			}
		}
}
