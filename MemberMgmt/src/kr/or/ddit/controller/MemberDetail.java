package kr.or.ddit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.IMemberService;
import kr.or.ddit.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/memberDetail.do")
public class MemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String query = request.getQueryString();
		
		String[] memInfo = query.split("=");
		String memId = memInfo[1];
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memVo = service.memberDetail(memId);
		
		request.setAttribute("memberDetail", memVo);
		request.getRequestDispatcher("/memberDetail.jsp").forward(request, response);;
	}


}
