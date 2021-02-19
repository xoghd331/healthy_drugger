package com.issue;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/WriteView")
public class WriteView extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		String user_id = null;
		
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		// idx�� �ʱ�ȭ ��Ű��
		// 'idx'��� �����Ͱ� �Ѿ�� ���� �����Ѵٸ� ĳ������ �Ͽ� ������ ��´�
		int idx = 0;
		
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		// ���� �Ѿ�� �����Ͱ� ���ٸ�
		if(idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�')");
			script.println("location.href='issue_view.jsp'");
			script.println("</script");
		}
		
		// ��ȿ�� ���̶�� ��ü���� ������ 'dto'��� �ν��Ͻ��� ��´�
		issueDTO dto = new issueDAO().getIssueDTO(idx);
		
	
	}

}