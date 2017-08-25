<%@page import="cal.CalendarDao"%>
<%@page import="cal.CalendarDao_i"%>
<%@page import="member.MemberDao_i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<title>bbsDelete.jsp</title>
</head>
<body>
	<%
		String sseq = request.getParameter("seq");
		int seq = Integer.parseInt(sseq.trim());
		
		CalendarDao_i dao = CalendarDao.getInstance();
		boolean isS = dao.deleteCalendar(seq);
		
		if(isS){
	%>	<script type="text/javascript">
			alert("해당 글을 삭제하였습니다");
			location.href = "calendar.jsp?";
		</script>		
	<%
		}else{	
	%>  <script type="text/javascript">
			alert("삭제 실패하였습니다");
			location.href = "calendar.jsp?";
		</script>	
	<%
		}
	%>
	
	

</body>
</html>