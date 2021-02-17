<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 페이지</title>
</head>
<body>
	<form action="../join" method="post">
		<fieldset>
			<legend>회원가입</legend>
			<p><label>아이디<input type="text"  placeholder="ID을 입력하세요" name = "id"></label></p>
			<p><label>비밀번호<input type="password"  placeholder="PW를 입력하세요" name = "pw"></label></p>
			<p><label>전화번호<input type="text"  placeholder="전화번호를 입력하세요" name = "tel"></label></p>
			<p><label>의료자격증<input type="text"  placeholder="자격번호를 입력하세요" name = "license"></label></p>
		</fieldset>
		<input type="submit" value="회원가입" class="button fit">
	</form>
</body>
</html>