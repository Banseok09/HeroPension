<%@page import="cal.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="cal.CalendarDao"%>
<%@page import="cal.CalendarDao_i"%>
<%@page import="member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<title>calendarCallList.jsp</title>
</head>
<body>

<%!
	// 1글자일때 0붙여줌			
	public String two(String msg){
		return msg.trim().length()<2 ? "0"+msg : msg.trim(); //1시~9시 앞에 0을 붙여줌
	}

	// Timestemp(String형태, yyyy-MM-dd hh:mm:ss) 
	// Date (String형태, yy-MM-dd)
	public String toDates(String mdate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		String s = mdate.substring(0, 4) + "-" // yyyy
				 + mdate.substring(4, 6) + "-" // MM
				 + mdate.substring(6, 8) + " " // dd
				 + mdate.substring(8, 10) + ":" // hh
				 + mdate.substring(10, 12) + ":00";
		Timestamp d = Timestamp.valueOf(s);
		
		return sdf.format(d);
	}
%>

<%
	MemberDto user = (MemberDto)session.getAttribute("login");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	String dates = year + two(month) + two(day);
	
	CalendarDao_i dao = CalendarDao.getInstance();
	List<CalendarDto> list = dao.getDayList(user.getId(), dates);
%>

<div align="center">
	<h1>'<%=year %>년 <%=month %>월 <%=day %>일' 일정</h1>
	<table border="1">	
	<col width="100"><col width="250"><col width="450"><col width="50">
		<tr bgcolor="#09bbaa">
			<td>번호</td><td>시간</td><td>제목</td><td>삭제</td>
		</tr>
		
	<%
		for(int i=0; i<list.size(); i++){
			CalendarDto calDto = list.get(i);
	%>	<tr>
			<td><%=i+1 %></td>
			<td><%=toDates(calDto.getRdate()) %></td>
			<td><a href="calendarDetail.jsp?seq=<%=calDto.getSeq()%>"><%=calDto.getTitle() %></a></td>
			<td>
				<form action="calendarDelete.jsp" method="post">
					<input type="hidden" name="seq" value="<%=calDto.getSeq()%>">
					<input type="hidden" name="year" value="<%=year%>">
					<input type="hidden" name="month" value="<%=month%>">
					<input type="hidden" name="day" value="<%=day%>">
					<input type="submit" value="일정삭제">
				 </form>
			</td>
		</tr>
		
	<%	
		}
	%>
	</table>
	

	<%	String url = String.format("%s?year=%s&month=%s", "calendar.jsp", year, month);	%>
	<a href="<%=url %>">일정보기</a>	
	
</div>



</body>
</html>