<%@page import="cal.CalendarDao"%>
<%@page import="cal.CalendarDao_i"%>
<%@page import="cal.CalendarDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<title>calendarUpdate.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	
	<%
		MemberDto user = (MemberDto)session.getAttribute("login");
	//	String year = request.getParameter("year");
	//	String month = request.getParameter("month");
	//	String day = request.getParameter("day");
	
		String sseq = request.getParameter("seq");
		int seq = Integer.parseInt(sseq.trim());
		
		CalendarDao_i dao = CalendarDao.getInstance();
		CalendarDto cal = dao.getDetail(seq);
	%>
	
	<form action="calendarUpdateAf.jsp" method="post">
	<input type="hidden" name="seq" value="<%=cal.getSeq()%>">	
		<h3>일정 수정</h3>
		<table border="1">
		<col width="200"><col width="500">
			<tr>
				<td>아이디</td>
				<td>
					<%=user.getId() %><input type="hidden" name="id" value="<%=user.getId() %>">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="60" name="title" value="<%=cal.getTitle() %>"></td>
			</tr>
			<tr>
				<td>일정</td>
				<td>
					<%=cal.getRdate().substring(0, 4) %>년
					<%=cal.getRdate().substring(4, 6) %>월
					<%=cal.getRdate().substring(6, 8) %>일
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="60" name="content" ><%=cal.getContent() %></textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="일정 수정"></td>
			</tr>
		</table>
	</form>
	
<%-- 	
	<%	String url = String.format("%s?year=%s&month=%s", "calendar.jsp", year, month);	%>
	<a href="<%=url %>">일정보기</a>
--%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("select[name='month']").change(function(){
				var lastday = (new Date($("select[name='year']").val()+"", $("select[name='month']").val()+"", 0)).getDate();
				
				//적용
				var str = "";
				for(i=1; i<=lastday; i++){
					str += "<option value='" + i + "'>" + i + "</option>";
				}
				$("select[name='day']").html(str);
				
			})
		});	
	</script>
</body>
</html>