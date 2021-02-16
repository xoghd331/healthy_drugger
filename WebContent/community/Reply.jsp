<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.model.*" %>

<jsp:useBean id="dao" class="com.model.BoardDAO"/>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDTO dto = dao.getView(idx);
%> 
<script language = "javascript">  // 자바 스크립트 시작

	function replyCheck() {
		var form = document.Replyform;
	
		if(!form.username.value) {
			alert( "이름을 적어주세요" );
			form.username.focus();
			return;
			}
		
		if(!form.password.value) {
			alert( "비밀번호를 적어주세요" );
			form.password.focus();
			return;
			}
		
		if(!form.title.value) {
			alert( "제목을 적어주세요" );
			form.title.focus();
			return;
			}
		
		if(!form.content.value) {
			alert( "내용을 적어주세요" );
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
		<form name = Replyform method = post action = "Reply_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
			<tr>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr style = "background:url('img/table_mid.gif') repeat-x; text-align:center;">
							<td width = "5"><img src = "img/table_left.gif" width = "5" height = "30"></td>
							<td>답글</td>
							<td width = "5"><img src = "img/table_right.gif" width = "5" height = "30"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align = "center">제목</td>
							<td><input name = "title" size = "50" maxlength = "100" value = "<%=dto.getTitle()%>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align = "center">이름</td>
							<td><input name = "username" size = "50" maxlength = "50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align = "center">비밀번호</td>
							<td><input type = "password" name = "password" size = "50" maxlength = "50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align = "center">내용</td>
							<td><textarea name = "content" cols = "52" rows = "15"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr height = "1" bgcolor = "#82B5DF"><td colspan = "4"></td></tr>
						<tr align = "center">
							<td>&nbsp;</td>
							<td colspan = "2">
								<input type = "button" value = "등록"  OnClick = "javascript:replyCheck();">
								<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>