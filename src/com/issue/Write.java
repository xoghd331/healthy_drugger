package com.issue;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.UserDTO;

@WebServlet("/write")
public class Write extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		String user_id = info.getId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		issueDTO issue = new issueDTO(title,content,user_id);
		
		// �α����� �� ����� ���� �� �� �ֵ��� �ڵ带 �����Ѵ�
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			// �Է��� �� �� �κ��� �ִ��� üũ�Ѵ�
			if(issue.getTitle() == null || issue.getContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// ���������� �Է��� �Ǿ��ٸ� �۾��� ������ �����Ѵ�
				issueDAO dao = new issueDAO();
				int result = dao.write(issue);
				// �����ͺ��̽� ������ ���
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��⿡ �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				// �۾��Ⱑ ���������� ����Ǹ� �˸�â�� ���� �Խ��� �������� �̵��Ѵ�
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��� ����')");
					script.println("location.href='issue.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}
