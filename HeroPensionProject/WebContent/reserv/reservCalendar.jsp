<%@page import="room.RoomDao"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDto"%>
<%@page import="reservation.reservDto"%>
<%@page import="reservation.IreservDao"%>
<%@page import="reservation.reservDao"%>
<%@page import="pension.PensionDto"%>
<%@page import="pension.IPensionDao"%>
<%@page import="pension.PensionDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>calendar.jsp</title>
</head>
<body>
	<%!
		public boolean nvl(String msg){
			return msg == null || msg.trim().equals("")?true:false;
		}
	
		//callList : 날짜 클릭 시, 그날의 일정이 모두 보이게하는 callList.로 이동시키는 함수
		public String callList(int year, int month, int day){
			String s ="";
			s += String.format("<a href='%s?year=%d&month=%d&day=%d'>", "calendarCallList.jsp", year, month, day);
			s += String.format("%2d", day);
			s += "</a>";
			
			return s;
		}
		
		//pen이미지 클릭 시, 일정을 작성할 수 있도록 하는 함수 calWrite.jsp
		public String showPen(int year, int month, int day){
			String s = "";
			String url = "calendarWrite.jsp";
			String image = "<image src='image/pen.gif'>";
			s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", url, year, month, day, image);
			
			return s;
		}
		
		// 1글자일때 0붙여줌			
		public String two(String msg){
			return msg.trim().length()<2 ? "0"+msg : msg.trim(); //1시~9시 앞에 0을 붙여줌
		}
	
		// 일정표시 -> 약속 15자 이상 되면 ...으로 표시하는 함수
		public String dot3(String msg){
			String s = "";
			if(msg.length() >= 10){
				s = msg.substring(0,10);
				s += "...";
			}else{
				s = msg.trim();
			}
			
			return s;
		}
/*  		
		// 각 날짜별로 테이블을 생성하는 함수
		public String makeTable(int year, int month, int day, List<RoomDto> roomList, List<reservDto> reservList){			
			String s = "";
			String dates = (year+"")+two(month+"")+two(day+"");					
			
			s = "<table>";
			s += "<col width='98'>";
			
 			for(RoomDto roomDto: roomList){ // 모든 룸의 리스트
 				for(reservDto reservDto: reservList){ //예약되어있는 룸의 리스트

 					if( Integer.parseInt(reservDto.getCheckin()) <= Integer.parseInt(dates) && Integer.parseInt(reservDto.getCheckout()) >= Integer.parseInt(dates) ){
 						s += "<tr bgcolor='pink'>";
 						s += "<td>";
 						s += "<font style='font-size:8; color:red'>";					
 						s += dot3(roomDto.getName_room()+"예약중");
 						s += "</font>";
 						s += "</td>";
 						s += "</tr>";
 					} else {
 						s += "<tr bgcolor='aqua'>";
 						s += "<td>";
 						s += "<a href='calendarDetail.jsp?seq_res=" + reservDto.getSeq_res() + "'>";
 						s += "<font style='font-size:8; color:blue'>";					
 						s += dot3(roomDto.getName_room()+"예약가능");
 						s += "</font>";
 						s += "</a>";
 						s += "</td>";
 						s += "</tr>";	
 					
 					}
 			}
				
			
			s += "</table>";			
 			}
 			return s;
		}
 */	 	
		
		// 각 날짜별로 테이블을 생성하는 함수
		public String makeTable(int year, int month, int day, List<reservDto> list){			
			String s = "";
			String dates = (year+"")+two(month+"")+two(day+"");					
			
			s = "<table>";
			s += "<col width='98'>";
			
			
			for(reservDto dto: list){
				System.out.print(dto.toString());
 				
				if( Integer.parseInt(dto.getCheckin()) <= Integer.parseInt(dates) && Integer.parseInt(dto.getCheckout()) >= Integer.parseInt(dates) ){
					s += "<tr bgcolor='pink'>";
					s += "<td>";
					s += "<a href='calendarDetail.jsp?seq_res=" + dto.getSeq_res() + "'>";
					s += "<font style='font-size:8; color:red'>";					
					s += dot3(dto.getName_room());
					s += "</font>";
					s += "</a>";
					s += "</td>";
					s += "</tr>";
				}
				
			}
			s += "</table>";
	
			return s;
		}
 
	%>	
	
	
	<%
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		
		String syear = request.getParameter("year");
		String smonth = request.getParameter("month");
		
		int year = cal.get(Calendar.YEAR);
		if(!nvl(syear)){ // 바뀐값이 있을 때
			year = Integer.parseInt(syear);
		} 
		int month = cal.get(Calendar.MONTH)+1; // MONTH : 0 ~ 11
		if(!nvl(smonth)){ // 바뀐값이 있을 때
			month = Integer.parseInt(smonth);
		}
		
		if(month < 1){
			month = 12;
			year--;
		}
		if(month >12){
			month = 1;
			year++;
		}
		
		cal.set(year, month-1, 1);
		
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 요일 : 1 ~ 7
/* 		String sf = String.format("%d년%d월", year, month);
		System.out.println("sf : " + sf);
		
		String sleft = String.format("calendar.jsp?year=%d&month=%d", year, month-1);
		String sright = String.format("calendar.jsp?year=%d&month=%d", year, month+1);
 */		
 		//전년,전달,다음달,내년
		String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>", "calendar.jsp", year-1, month);
 		String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>", "calendar.jsp", year, month-1);
 		String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>", "calendar.jsp", year, month+1);
 		String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>", "calendar.jsp", year+1, month);
 		
 		
 		
 		
// 		MemberDto user = (MemberDto)session.getAttribute("login");
// 		CalendarDao_i dao = CalendarDao.getInstance();
// 		List<CalendarDto> list = dao.getCalendarList(user.getId(), year+two(month+""));
//		바꾼부분
		int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));
		IreservDao dao = reservDao.getInstance();
		List<reservDto> list = dao.getCalReservList(seq_pen, year+two(month+""));
		
		/* 룸정보 */
		IRoomDao room = RoomDao.getInstance();
		List<RoomDto> roomList = room.getRoomList(seq_pen);	

	%>	
	
	<div align="center">
		<h1>Calendar</h1>
		<table border="1">
		<col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
			<tr height="100">
				<td colspan="7" align="center">
					<%=pp %><%=p %><font color="blue" style="font-size: larger;"><%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %></font><%=n %><%=nn %>
				</td>
			</tr>
			<tr height="100">
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
			</tr>
 				
			<tr height="100" align="left" valign="top">			
			<%	for(int i=1; i<dayOfWeek; i++){	%>	
				<td>&nbsp;</td>	<!-- 달의 여백 -->		
			<%	}
				int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				for(int i=1; i<=lastDay; i++){
			%>	
<%--			<td height="100" align="left" valign="top">
					<%=i %><a href="calendarWrite.jsp?year=<%=year%>&month=<%=month%>&day=<%=i%>"><img src="./image/pen.gif"></a> <!-- 날짜 -->
				</td> 	 
--%>			
				<td><%=callList(year, month, i)  %>&nbsp;<%=showPen(year, month, i) %><%=makeTable(year, month, i, list) %></td>


			<%		if((i+dayOfWeek-1)%7 == 0){ %>
			</tr>
			<tr height="100" align="left" valign="top">			
			<%		} 
				}
				for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){
			%> 
				<td>&nbsp;</td>
			<%	} %>
			</tr>
		</table>
	</div>

</body>
</html>