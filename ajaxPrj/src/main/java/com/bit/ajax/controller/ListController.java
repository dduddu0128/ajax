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

public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		try {
			out.println("{\"list\":[");
			List<BoardDto> list = dao.getList();
			for(int i=0; i<list.size(); i++) {
				BoardDto bean = list.get(i);
				if(i!=0) out.print(",");
//				out.println("{\"num\":"+bean.getNum()+",\"title\":\""+ bean.getTitle() +"\",\"content\":\""+ bean.getContent()+"\",\"regdate\":\""+ bean.getRegdate()+"\",\"visitcnt\":"+ bean.getVisitcnt()+"}");
				out.println("{\"num\":"+bean.getNum()+", \"title\":\""+bean.getTitle()+"\", \"writer\":\""+bean.getWriter()+"\",\"conent\":\""+bean.getContent()+"\", \"regdate\":\""+bean.getRegdate()+"\",\"visitcnt\":"+bean.getVisitcnt()+"}");
			}
			out.println("]}");
			System.out.println("json파일 생성 완료");
	   }finally {
		   if(out!=null)out.close();
	 }
	}
}
