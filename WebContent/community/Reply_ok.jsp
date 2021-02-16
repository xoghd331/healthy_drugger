<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.model.*" %>
<jsp:useBean id="dao" class="com.model.BoardDAO"/>
<jsp:useBean id="dto" class="com.model.BoardDTO"/>
<jsp:setProperty name="dto" property="*" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDTO dto1 = dao.getView(idx);
	int ref = dto1.getRef();
	int indent = dto1.getIndent();
	int step = dto1.getStep();
		
	dao.UpdateStep(ref, step);
	dao.insertReply(dto, ref, indent, step);
	%>
  <script language=javascript>
   self.window.alert("입력한 답글을 저장하였습니다.");
   location.href="List.jsp?pg=<%=pg%>";
  </script>