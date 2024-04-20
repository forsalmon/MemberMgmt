package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;


@WebServlet("/idChk.do")
public class IdChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");
		
		IMemberService service = MemberServiceImpl.getInstance();
		int cnt = service.idChk(memId);
		
		System.out.println(cnt);
		
		String json = new Gson().toJson(cnt);
		response.getWriter().write(json);
	}

}
