package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import back.UserDAO;
import back.UserDTO;



@WebServlet("/join")
public class join extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String license = request.getParameter("license");

		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(id, pw, tel, license);

		int cnt = dao.join(dto);

		if (cnt > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			response.sendRedirect(/* "로그인 성공 페이지" */);
		}else {
			response.sendRedirect(/* "main페이지" */);
		}
	}

}
