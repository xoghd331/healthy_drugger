<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.model.BoardDAO"/>
<jsp:useBean id="dto" class="com.model.BoardDTO"/>
<jsp:setProperty name="dto" property="*" />
			
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	boolean ch = dao.checkPassword(dto, idx);
	if(ch) {
			dao.delete(idx);
		%>
			<script language = javascript>
				self.window.alert("�ش� ���� �����Ͽ����ϴ�.");
				location.href = "List.jsp?pg=<%=pg%>";
			</script>
		<%
	} else {
		%>
			<script language = javascript>
				self.window.alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				location.href = "javascript:history.back()";
			</script>
		<%
	}
%>