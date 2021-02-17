<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="back.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보수정</title>
</head>
<body>
<%
			UserDTO info = (UserDTO)session.getAttribute("info");
%>
	<form action="update" method="post">
		<fieldset>
			<legend>회원정보수정</legend>
			<p><label><%=info.getId() %></label></p>
			<p><label>비밀번호 : <input type="password"  placeholder="PW를 입력하세요" name = "pw"></label></p>
			<p><label>전화번호 : <input type="text"  placeholder="전화번호를 입력하세요" name = "tel"></label></p>
			<p><label>의료자격증 : <input type="text"  placeholder="자격번호를 입력하세요" name = "license"></label></p>
		</fieldset>
		<input type="submit" value="수정완료" class="button fit"">
	</form>
</body>
</html>