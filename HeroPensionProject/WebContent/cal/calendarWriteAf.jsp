<%@page import="cal.CalendarDto"%>
<%@page import="cal.CalendarDao"%>
<%@page import="cal.CalendarDao_i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<title>calendarWriteAf.jsp</title>
</head>
<body>
	<%!
		public String two(String msg){
			return msg.trim().length()<2 ? "0"+msg : msg.trim(); //1시~9시 앞에 0을 붙여줌
		}
	%>
	
	<%
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String hour = request.getParameter("hour");
		String min = request.getParameter("min");
		
		String rdate = year + two(month) + two(day) + two(hour) + two(min);
		
		CalendarDao_i dao = CalendarDao.getInstance();		
		boolean isS = dao.addCalendar(new CalendarDto(id, title, content, rdate));
		
		String url = String.format("%s?year=%s&month=%s", "calendar.jsp", year, month);	
		
		if(isS){
	%>	<script type="text/javascript">
			alert("일정 기입 성공");
			location.href='<%=url%>';
		</script>
	<%	
		}else{	
	%>  <script type="text/javascript">
			alert("일정 기입 실패");
			location.href='<%=url%>';
		</script>		
	<%
		}
	%>
	
	
</body>
</html>