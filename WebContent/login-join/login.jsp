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
			<legend>�α���</legend>
			<p><label>���̵�<input type="text"  placeholder="ID�� �Է��ϼ���" name = "id"></label></p>
			<p><label>��й�ȣ<input type="password"  placeholder="PW�� �Է��ϼ���" name = "pw"></label></p>
		</fieldset>
		<input type="submit" value="LogIn" class="button fit"">
	</form>
</ul>
</nav>
</body>
</html>