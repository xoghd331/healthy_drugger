<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ������</title>
</head>
<body>
	<form action="../join" method="post">
		<fieldset>
			<legend>ȸ������</legend>
			<p><label>���̵�<input type="text"  placeholder="ID�� �Է��ϼ���" name = "id"></label></p>
			<p><label>��й�ȣ<input type="password"  placeholder="PW�� �Է��ϼ���" name = "pw"></label></p>
			<p><label>��ȭ��ȣ<input type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���" name = "tel"></label></p>
			<p><label>�Ƿ��ڰ���<input type="text"  placeholder="�ڰݹ�ȣ�� �Է��ϼ���" name = "license"></label></p>
		</fieldset>
		<input type="submit" value="ȸ������" class="button fit">
	</form>
</body>
</html>