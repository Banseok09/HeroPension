<%@page import="java.util.ArrayList"%>
<%@page import="pensionIMG.PensionImgDto"%>
<%@page import="pensionIMG.PensionImgDao"%>
<%@page import="pensionIMG.IPensionImgDao"%>
<%@page import="sun.nio.cs.ext.ISCII91"%>
<%@page import="pension.PensionDto"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>room.jsp</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function reservStatePopup() {
			window.open('../reserv/reservState.jsp');
		}
	</script>
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
		
		/*펜션이미지*/
		IPensionImgDao pensionImg = PensionImgDao.getInstance();
		List<PensionImgDto> pensionImgList = pensionImg.getPensionImg(seq_pen);
		
		/*펜션이미지경로*/
		List<String> pensionImgSrc = new ArrayList<String>();		
		for(int i=0; i<pensionImgList.size(); i++){			
			String str = ".." + pensionImgList.get(i).getImg_src_pen() + "/" + pensionImgList.get(i).getImg_name_pen();
			pensionImgSrc.add(str);			
		}		
		
		/*룸경로*/
		//String pensionImgSrc = ".." +pensionImgDto.getImg_src_pen() + "/" + pensionImgDto.getImg_name_pen();	
	%>
	
	
	
	<!-- 펜션정보 -->
	<h1 style="color: blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;펜션 정보</h1>
	<div align="center">
	<table border="1">
	<col width="600"><col width="375">
		<tr height="500">
			<td>	
				<table border="1">	
				<col width="100"><col width="100"><col width="100"><col width="100">			
					<tr height="400">
						<td colspan="4">
							<div align="center">
								<iframe src="<%=pensionImgSrc.get(0) %>" width="600" height="400" name="photo"></iframe>
							</div>
						</td>
					</tr>
					<tr height="100">
					<%for(int i=0; i<4; i++){ %>
						<td align="center"> <%-- <%=pensionImgSrc.get(1) %> --%>					
						<%if(pensionImgSrc.size() != i){ %>
							<a href="<%=pensionImgSrc.get(i) %>" target="photo">
									<img src="<%=pensionImgSrc.get(i) %>" width="150" height="110">
							</a> 
						<%} %>
						</td>
					<%} %>
					</tr>
				</table>
			</td>	
			<td>	
				<div align="center">
					<div align="center">
						<h2><%=pensionDto.getName_pen() %></h2>
					</div>
				
				<br><br><br>
				<table>
					<tr>
						<th align="left">상세주소</th>
						<td><%=pensionDto.getAddress() %></td>
					</tr>
					<tr>
						<th align="left">입/퇴실시간</th>
						<td>[입실] <%=pensionDto.getCheckin_time() %>,
						    [퇴실] <%=pensionDto.getCheckout_time() %>
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
					<br><br><br>
					<div align="center">
						<a href="javascript:window.open('../reserv/reservCalendar.jsp?seq_pen=<%=seq_pen%>')">예약현황</a> 
					</div>
				</div>
			</td>
		</tr>	
	</table>	
	</div>
	
	
	<!-- 객실 이미지 -->
	<%	String info_room = roomList.get(0).getName_room()+" : " + roomList.get(0).getType_room(); %>
	<div>
		<jsp:include page="./roomInfoImg.jsp" >
			<jsp:param value="<%=seq_pen %>" name="seq_pen"/>
			<jsp:param value="<%=roomList.get(0).getSeq_room() %>" name="seq_room"/>
			<jsp:param value="<%=info_room %>" name="info_room"/>
		</jsp:include>
 	</div>
 	
 	
 	<!-- 선택한 룸의 객실정보 --> 	
	<div align="center">
		<form action="">
			<table border="1">
			<col width="140"><col width="280"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
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
			    <tr>
					<td rowspan="2" align="center"><%=roomList.get(0).getName_room() %></td>	
					<td rowspan="2" align="center"><%=roomList.get(0).getType_room() %></td>
					<td rowspan="2" align="center"><%=roomList.get(0).getSize_room() %></td>		
					<td rowspan="2" align="center"><%=roomList.get(0).getPerson_min() %>명/<%=roomList.get(0).getPerson_max() %>명</td>
					<td align="center">성수기</td>	
					<td align="center"><%=roomList.get(0).getPrice_season_basic() %>원</td>
					<td align="center"><%=roomList.get(0).getPrice_season_weekend() %>원</td>
					<td rowspan="2" align="center"><a href="#">예약하기</a></td>
				</tr>	
				<tr>
					<td align="center">비수기</td>
					<td align="center"><%=roomList.get(0).getPrice_basic() %>원</td>
					<td align="center"><%=roomList.get(0).getPrice_weekend() %>원</td>
				</tr>	
			</table>
		</form>
	</div>
 	
	<!-- 이 펜션의 모든 객실정보 -->
	<br><br><br>
	<h1 style="color: blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모든 객실 정보</h1>
	<div align="center">
		<form action="">
			<table border="1">
			<col width="140"><col width="280"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
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
</body>
</html>