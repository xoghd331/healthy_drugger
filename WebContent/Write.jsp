<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<script language = "javascript">
	function writeCheck()
	{ var form = document.Writeform; 
		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}
		if (!form.username.value) {
			alert("이름을 적어주세요");
			form.username.focus();
			return;
		}
		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		if (!form.content.value) {
			alert("내용을 적어주세요");
			form.content.focus();
			return;
		}
		form.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<body>
	<table>
		<form name = Writeform method = post action = "Write_ok.jsp">
			<tr>
			<td>
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<tr align = "center">
						<td width = "5"></td>
						<td>글쓰기</td>
						<td width = "5"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">제목</td>
						<td><input type = "text" name = "title" size = "50" maxlength = "100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">이름</td>
						<td><input type = "text" name = "username" size = "50" maxlength = "50"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">비밀번호</td>
						<td><input type = "password" name = "password" size = "50" maxlength = "50" placeholder = "최대 12자리 비밀번호를 입력하시오."></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">내용</td>
						<td><textarea name = "content" cols = "52" rows = "15"></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr align = "center">
						<td>&nbsp;</td>
						<td colspan = "2">
						<input type = "button" value = "등록" OnClick = "javascript:writeCheck();">
						<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
			</tr>
		</form>
	</table>
</body>
</html>