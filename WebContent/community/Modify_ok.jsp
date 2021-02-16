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
			dao.modify(dto, idx);
		%>
			<script language = javascript>
				self.window.alert("글이 수정되었습니다.");
				location.href="View.jsp?idx=<%=idx%>&pg=<%=pg%>";
			</script>
		<%
	} else {
		%>
			<script language = javascript>
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
		<%
	}
%>