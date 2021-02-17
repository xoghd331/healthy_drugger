<%@page import="java.util.ArrayList"%>
<%@page import="back.UserDAO"%>
<%@page import="back.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자페이지</title>
</head>
<body>
	<%
	//selectUserr라는 메소드를 사용하기 위해 불러옴
		UserDAO dao = new UserDAO();
	//dao.selectUser(결과값)을 arraylist에 담아줌.
		ArrayList<UserDTO> list = dao.selectUser();
		
	%>
	
	<!-- 모든 회원의 아이디, 전화번호, 자격번호 를 출력 -->	
			<h2>회원관리페이지</h2>
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
			<a href="../main.jsp" class="button next scrolly">되돌아가기</a>	
</body>
</html>