<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language = "javascript">  // �ڹ� ��ũ��Ʈ ����

function deleteCheck() {
	var form = document.Deleteform;
	
	if (!form.password.value) {
		alert( "��й�ȣ�� �����ּ���" );
		form.password.focus();
		return;
		}
	form.submit();
	}
 </script>
 <%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
%>
<!DOCTYPE html>
<html>
<head>
<title>�Խ���</title>
</head>
<body>
	<table>
		<form name = Deleteform method = post action = "Delete_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
			<tr>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr style = "background:url('img/table_mid.gif') repeat-x; text-align:center;">
							<td width = "5"><img src = "img/table_left.gif" width = "5" height = "30" /></td>
							<td>����</td>
							<td width = "5"><img src = "img/table_right.gif" width = "5" height = "30" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align = "center">��й�ȣ</td>
							<td><input name = "password" type = "password" size = "50" maxlength = "100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr height = "1" bgcolor = "#82B5DF"><td colspan = "4"></td></tr>
						<tr align = "center">
					<td>&nbsp;</td>
					<td colspan = "2"><input type = button value = "����" OnClick = "javascript:deleteCheck();">
					<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
					<td>&nbsp;</td>
					</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body> 
</html>