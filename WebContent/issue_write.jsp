<%@page import="java.io.PrintWriter"%>
<%@page import="back.issueDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>  
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="issue" class="back.issueDTO" scope="page" />
<jsp:setProperty name="issue" property="title" />
<jsp:setProperty name="issue" property="content" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
		// ���� ���� ���¸� üũ�Ѵ�
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
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
				int result = dao.write(issue.getTitle(), user_id, issue.getContent());
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
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}
	
	%>
</body>
</html>