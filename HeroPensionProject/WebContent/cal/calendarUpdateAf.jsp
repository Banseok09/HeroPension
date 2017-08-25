<%@page import="cal.CalendarDao"%>
<%@page import="cal.CalendarDao_i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<title>bbsUpdateAf.jsp</title>
</head>
<body>


	<%	
		int seq = Integer.parseInt(request.getParameter("seq"));			
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		CalendarDao_i dao = CalendarDao.getInstance();	
		boolean isS = dao.updateCalendar(seq, title, content);
		if(isS){
	%>	<script type="text/javascript">
			alert("수정 성공");
			location.href = "calendar.jsp";
		</script>		
	<%	
		}else{	
	%>  <script type="text/javascript">
			alert("수정 실패");
			location.href = "calendar.jsp"
		</script>		
	<%
		}
	%>
</body>
</html>