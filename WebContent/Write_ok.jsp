<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.model.BoardDAO"/>
<jsp:useBean id="dto" class="com.model.BoardDTO"/>
<jsp:setProperty name="dto" property="*" />

<%	
	request.setCharacterEncoding("EUC-KR");
	int max = dao.getMax();
	dao.insertWrite(dto, max);
%>

<script language = javascript>
	self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
	location.href = "List.jsp";
</script>