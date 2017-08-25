<%@page import="room.RoomDto"%>
<%@page import="room.RoomDao"%>
<%@page import="room.IRoomDao"%>
<%@page import="roomIMG.RoomImgDto"%>
<%@page import="roomIMG.RoomImgDao"%>
<%@page import="roomIMG.IRoomImgDao"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.DBConn"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE>
<html>
	<%		
		/*펜션정보*/
		int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));
	
		/*룸정보*/
		String info_room = request.getParameter("info_room");	
		IRoomDao room = RoomDao.getInstance();
		List<RoomDto> roomList = room.getRoomList(seq_pen);	


		/*룸이미지*/
		int seq_room = Integer.parseInt(request.getParameter("seq_room"));	
		IRoomImgDao roomImg = RoomImgDao.getInstance();
		List<RoomImgDto> roomImgList = roomImg.getRoomImgList(seq_room);
		
		
		/*룸이미지경로*/
		List<String> roomImgSrc = new ArrayList<String>();
		
		for(int i=0; i<roomImgList.size(); i++){
			
			String str = ".." + roomImgList.get(i).getImg_src_room() + "/" + roomImgList.get(i).getImg_name_room();
			roomImgSrc.add(str);			
		}			
	%>
<%-- 	
	<iframe src="<%=roomImgSrc.get(0) %>"
	 width="1000" height="800">	
	</iframe>
	<button id="test" title="타이틀이에염">test</button>
	<script type="text/javascript">
	$(document).ready(function(){
	   $("#roomClick").click(function(){
		   //document.getElementById("test").title;
	      var roomNumber = document.getElementById("roomClick").title
	      $("iframe").attr('src','<%=roomImgSrc.get(0) %>');
	   })
	});
	</script>
 --%>	
	
	
	
	<!-- 객실 이름 -->
	<br><br><br><br><br><br><br>
	<h1 style="color: blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택한 객실 정보</h1>
	<div align="center">
		<table border="1">	
		<col width="123"><col width="123"><col width="123"><col width="123">
		<col width="123"><col width="123"><col width="123"><col width="123">
		<%	for(int i=0; i<(roomList.size()/8)+1; i++){	%>	
			<tr>
			<% 	for(int j=0; j<8; j++){	%>	
				<td height="50" align="center">
					<% if(roomList.size() > ((i*8)+j)){ %>			
<%-- 		 
		 				<a href="./room/roomController.jsp?command=roomClick&seq_pen=<%=seq_pen %>&seq_room=<%=roomList.get((i*8)+j).getSeq_room() %>&info_room=<%=info_room %>">
							<%=roomList.get((i*8)+j).getName_room() %>
						</a>						
 --%>						
 						<input type="button" id="roomClick" value="<%=roomList.get((i*8)+j).getName_room() %>" title="<%=roomList.get((i*8)+j).getSeq_room() %>">					
					<%	} %>
				</td>											
			<%	} %>					 
			</tr>
		<%	} %>	
						
		</table>
	</div>	
			
	
	<!-- 객실 이미지 -->
	<div align="center">		
		<table border="1">	
		<col width="700"><col width="300">
			<tr height="70">
				<td colspan="2"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=info_room %></h2></td>
			</tr>			
			<tr height="500">
				<td>
					<div align="center">
					<iframe src="<%=roomImgSrc.get(0) %>" width="600" height="400" name="photo">
					여기에는 인라인 프레임이 표시됩니다.			
					</iframe>
					</div>
				</td>
				<td>
					<div align="center">
					<table>								
					<%
						for(int i=0; i<roomImgSrc.size(); i=i+2){
					%>
						<tr>					
							<td>
								<a href="<%=roomImgSrc.get(i) %>" target="photo">
									<img src="<%=roomImgSrc.get(i) %>" width="120" height="80">
								</a>
							</td>									
							<td>
						<% 
							if(i+1 != roomImgSrc.size()){
								
						%>		<a href="<%=roomImgSrc.get(i+1) %>" target="photo">
									<img src="<%=roomImgSrc.get(i+1) %>" width="120" height="80">
								</a>
						<%
							}
						%>
							</td>								
						</tr>			
	 				<%
						}
					%>												
					</table>
					</div>
				</td>
			</tr>			
		</table>			
	</div>
</html>