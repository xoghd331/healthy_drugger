<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.model.*" %>

<jsp:useBean id="dao" class="com.model.BoardDAO"/>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDTO dto = dao.getView(idx);	
	dao.UpdateHit(idx);
%>
<!DOCTYPE html>
<html>
<head>
<title>�Խ���</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<tr style = "background:url('img/table_mid.gif') repeat-x; text-align:center;">
						<td width = "5"><img src = "img/table_left.gif" width = "5" height = "30" /></td>
						<td>�� ��</td>
						<td width = "5"><img src = "img/table_right.gif" width = "5" height = "30" /></td>
					</tr>
				</table>
				<table width = "413">
					<tr>
						<td width = "0">&nbsp;</td>
						<td align = "center" width = "76">�۹�ȣ</td>
						<td width = "319"><%=idx%></td>
						<td width = "0">&nbsp;</td>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr>
						<td width = "0">&nbsp;</td>
						<td align = "center" width = "76">��ȸ��</td>
						<td width = "319"><%=dto.getB_view()%></td>
						<td width = "0">&nbsp;</td>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr>
						<td width = "0">&nbsp;</td>
						<td align = "center" width = "76">�̸�</td>
						<td width = "319"><%=dto.getUsername()%></td>
						<td width = "0">&nbsp;</td>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr>
						<td width = "0">&nbsp;</td>
						<td align = "center" width = "76">�ۼ���</td>
						<td width = "319"><%=dto.getB_date()%></td>
						<td width = "0">&nbsp;</td>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr>
						<td width = "0">&nbsp;</td>
						<td align = "center" width = "76">����</td>
						<td width = "319"><%=dto.getTitle()%></td>
						<td width = "0">&nbsp;</td>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr>
						<td width = "0"></td>
						<td width = "399" colspan = "2" height = "200" style = "white-space:pre-line;"><%=dto.getContent() %>
					</tr>
					<tr height = "1" bgcolor = "#dddddd"><td colspan = "4" width = "407"></td></tr>
					<tr height = "1" bgcolor = "#82B5DF"><td colspan = "4" width = "407"></td></tr>
					<tr align = "center">
						<td width = "0">&nbsp;</td>
						<td colspan = "2" width = "399"><input type = "button" value = "�۾���"  OnClick = "window.location='Write.jsp'">
							<input type = "button" value = "���" OnClick = "window.location='Reply.jsp?idx=<%=idx%>&pg=<%=pg%>'">
							<input type = "button" value = "���" OnClick = "window.location='List.jsp?pg=<%=pg%>'">
							<input type = "button" value = "����" OnClick = "window.location='Modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
							<input type = "button" value = "����" OnClick = "window.location='Delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
						<td width = "0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
