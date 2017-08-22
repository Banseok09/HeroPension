<%@page import="room.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.RoomDao"%>
<%@page import="room.RoomDao_i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>room.jsp</title>
</head>
<body>

<%
	int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));

	RoomDao_i room = RoomDao.getInstance();
	List<RoomDto> roomList = room.getRoomList(seq_pen);
%>

	<div align="center">
		<h2>펜션이름</h2>
	</div>
	
	<div align="center">
		<form action="">
			<table border="1">
				<tr>
					<th>객실명</th>
					<th>객실형태</th>
					<th>크기</th>
					<th>인원</th>
					<th>기간</th>
					<th>주중</th>
					<th>주말</th>
					<th>예약</th>										
				<tr>
			<%
				if(roomList == null || roomList.size() == 0){
			%>  <tr>
					<td colspan="8">작성된 글이 없습니다</td>
				</tr>
			<%
				}
				for(int i=0; i<roomList.size(); i++){
					RoomDto roomDto = roomList.get(i);							
			%>  <tr>
					<td rowspan="2"><%=roomList.get(i).getName_room() %></td>	
					<td rowspan="2"><%=roomList.get(i).getType_room() %></td>
					<td rowspan="2"><%=roomList.get(i).getSize_room() %></td>		
					<td rowspan="2"><%=roomList.get(i).getPerson_min() %>명/<%=roomList.get(i).getPerson_max() %>명</td>
					<td>성수기</td>	
					<td><%=roomList.get(i).getPrice_season_basic() %>원</td>
					<td><%=roomList.get(i).getPrice_season_weekend() %>원</td>
					<td rowspan="2"><a href="#">예약하기</a></td>
				</tr>	
				<tr>
					<td>비수기</td>
					<td><%=roomList.get(i).getPrice_basic() %>원</td>
					<td><%=roomList.get(i).getPrice_weekend() %>원</td>
				</tr>				
			<%				
				}	
			%>
				
				
				
				
<!-- 				<tr>
					<td rowspan="2">럭셔리</td>
					<td rowspan="2">복층(침대룸+거실+주방+화장실)</td>
					<td rowspan="2">12평</td>
					<td rowspan="2">2/5</td>
					<td >성수기</td>
					<td>1111</td>
					<td>2222</td>
					<td rowspan="2"><a href="#">예약하기</a></td>
				</tr>
				<tr>
					<td rowspan="2">비수기</td>
					<td>3333</td>
					<td>4444</td>
				</tr> -->
			</table>
		</form>
	</div>

</body>
</html>