<%@page import="java.util.ArrayList"%>
<%@page import="back.UserDAO"%>
<%@page import="back.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������������</title>
</head>
<body>
	<%
	//selectUserr��� �޼ҵ带 ����ϱ� ���� �ҷ���
		UserDAO dao = new UserDAO();
	//dao.selectUser(�����)�� arraylist�� �����.
		ArrayList<UserDTO> list = dao.selectUser();
		
	%>
	
	<!-- ��� ȸ���� ���̵�, ��ȭ��ȣ, �ڰݹ�ȣ �� ��� -->	
			<h2>ȸ������������</h2>
			<table border="1">
				
					<tr>
						<td>Id</td>
						<td>Tel</td>
						<td>License</td>							
					</tr>
						<%for(int i=0; i<list.size(); i++){ %>
							<tr>
								<td><%=list.get(i).getId() %></td>
								<td><%=list.get(i).getTel() %></td>
								<td><%=list.get(i).getLicense() %></td>
							</tr>
						<%} %>
							
				</table>		
			<a href="../main.jsp" class="button next scrolly">�ǵ��ư���</a>	
</body>
</html>