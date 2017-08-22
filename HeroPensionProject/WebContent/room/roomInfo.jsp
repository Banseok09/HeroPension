<%@page import="pension.PensionDto"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.RoomDao"%>
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
		
		/* 펜션정보 */
		IPensionDao pension = PensionDao.getInstance();
		PensionDto pensionDto = pension.getChoicePension(seq_pen);
	
		/* 룸정보 */
		IRoomDao room = RoomDao.getInstance();
		List<RoomDto> roomList = room.getRoomList(seq_pen);	
	
	%>
	
	<!-- 펜션정보 -->
	<div align="center">
	<table border="1">
	<col width="650"><col width="430">
		<tr>
			<td>	
				<table>
					<tr>
						<td>그림영역</td>
					</tr>
				</table>
			</td>	
			<td>	
				<div align="center">
				<table>
					<tr>
						<td colspan="2" align="center"><h2><%=pensionDto.getName_pen() %></h2><hr></td>
					</tr>
					<tr>
						<th align="left">상세주소</th>
						<td><%=pensionDto.getAddress() %></td>
					</tr>
					<tr>
						<th align="left">입/퇴실시간</th>
						<td>[입실] <%=pensionDto.getChechin_time() %>,
						    [퇴실] <%=pensionDto.getChechout_time() %>
					</tr>
					<tr>
						<th align="left">픽업여부</th>
					<%if(pensionDto.getPickup() == 0){%>
						<td>픽업가능</td>
					<%}else{ %>
						<td>픽업불가</td>
					<%} %>
					</tr>
					<tr>
						<th align="left">예약문의</th>
						<td><%=pensionDto.getPhone() %></td>
					</tr>	
					<tr>
						<th align="left">성수기구분</th>
						<td>[성수기] <%=pensionDto.getSeason_start() %> ~ <%=pensionDto.getSeason_end() %><br></td>
					</tr>	
				</table>
				</div>
			</td>
		</tr>	
	</table>	
	</div>
		
		
		
		
	<!-- 객실정보 -->
	<br><br>
	<div align="center">
		<form action="">
			<table border="1">
			<col width="200"><col width="300"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
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
					<td colspan="8">룸 정보가 없습니다.</td>
				</tr>
			<%
				}
				for(int i=0; i<roomList.size(); i++){
					RoomDto roomDto = roomList.get(i);							
			%>  <tr>
					<td rowspan="2" align="center"><%=roomList.get(i).getName_room() %></td>	
					<td rowspan="2" align="center"><%=roomList.get(i).getType_room() %></td>
					<td rowspan="2" align="center"><%=roomList.get(i).getSize_room() %></td>		
					<td rowspan="2" align="center"><%=roomList.get(i).getPerson_min() %>명/<%=roomList.get(i).getPerson_max() %>명</td>
					<td align="center">성수기</td>	
					<td align="center"><%=roomList.get(i).getPrice_season_basic() %>원</td>
					<td align="center"><%=roomList.get(i).getPrice_season_weekend() %>원</td>
					<td rowspan="2" align="center"><a href="#">예약하기</a></td>
				</tr>	
				<tr>
					<td align="center">비수기</td>
					<td align="center"><%=roomList.get(i).getPrice_basic() %>원</td>
					<td align="center"><%=roomList.get(i).getPrice_weekend() %>원</td>
				</tr>				
			<%				
				}	
			%>
			</table>
		</form>
	</div>
	
	<!-- 객실 이미지 -->
	<div>
		
		
	</div>

</body>
</html>