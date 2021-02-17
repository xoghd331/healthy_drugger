<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="back.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>





<nav id="login">	
<ul>
	<form action="login" method="post">
		<fieldset>
			<legend>로그인</legend>
			<p><label>아이디<input type="text"  placeholder="ID을 입력하세요" name = "id"></label></p>
			<p><label>비밀번호<input type="password"  placeholder="PW를 입력하세요" name = "pw"></label></p>
		</fieldset>
		<input type="submit" value="LogIn" class="button fit"">
	</form>
</ul>
</nav>
</body>
</html>