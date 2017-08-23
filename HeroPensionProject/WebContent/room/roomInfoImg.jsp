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

		/*룸정보*/
		String info_room = request.getParameter("info_room");

		/*룸이미지*/
		int seq_room = Integer.parseInt(request.getParameter("seq_room"));	
		IRoomImgDao roomImg = RoomImgDao.getInstance();
		List<RoomImgDto> roomImgList = roomImg.getRoomImgList(seq_room);
		
		
		/*룸경로*/
		List<String> roomImgSrc = new ArrayList<String>();
		
		for(int i=0; i<roomImgList.size(); i++){
			
			String str = ".." + roomImgList.get(i).getImg_src_room() + "/" + roomImgList.get(i).getImg_name_room();
			roomImgSrc.add(str);
			
		}		
		
	%>
			
	
		<div align="center">	
		<br><br>		
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
						
						
						
<!-- 							
							<tr>
								<td>
									<a href="../image/tahiti01.jpg" target="photo"><img src="../image/tahiti01s.jpg" width="120" height="80"></a>
								</td>
								<td>
									<a href="../image/tahiti02.jpg" target="photo"><img src="../image/tahiti02s.jpg" width="120" height="80"></a>
								</td>
							</tr>	
							<tr>
								<td>
									<a href="../image/tahiti03.jpg" target="photo"><img src="../image/tahiti03s.jpg" width="120" height="80"></a>
								</td>
								<td>
									<a href="../image/tahiti04.jpg" target="photo"><img src="../image/tahiti04s.jpg" width="120" height="80"></a>
								</td>
							</tr>	
							<tr>
								<td>
									<a href="../image/tahiti01.jpg" target="photo"><img src="../image/tahiti01s.jpg" width="120" height="80"></a>
								</td>
								<td>
									<a href="../image/tahiti02.jpg" target="photo"><img src="../image/tahiti02s.jpg" width="120" height="80"></a>
								</td>
							</tr>	
							<tr>
								<td>
									<a href="../image/tahiti03.jpg" target="photo"><img src="../image/tahiti03s.jpg" width="120" height="80"></a>
								</td>
								<td>
									<a href="../image/tahiti04.jpg" target="photo"><img src="../image/tahiti04s.jpg" width="120" height="80"></a>
								</td>
							</tr>	
 -->							
							
											
						</table>
						</div>
					</td>
				</tr>			
			</table>
		
<!-- 			
			<h1>타히티의 사진</h1>
			다음 사진을 클릭하면, 확대 사진을 볼 수 있습니다.
 			
			<br>
			<br>
			<br>
		
			<iframe src="../image/tahiti01.jpg" width="400" height="266" name="photo" scrolling="no" marginwidth="0" marginheight="0">
			여기에는 인라인 프레임이 표시됩니다.			
			</iframe> 
			
			<br>
			<br>
			<a href="../image/tahiti01.jpg" target="photo">
				<img src="../image/tahiti01s.jpg">
			</a>
 			<a href="../image/tahiti02.jpg" target="photo">
				<img src="../image/tahiti02s.jpg">
			</a>
			<a href="../image/tahiti03.jpg" target="photo">
				<img src="../image/tahiti03s.jpg">
			</a>
			<a href="../image/tahiti04.jpg" target="photo">
				<img src="../image/tahiti04s.jpg">
			</a>
			<a href="../image/tahiti05.jpg" target="photo">
				<img src="../image/tahiti05s.jpg">
			</a>
	 -->		
			
		</div>
	
	
</html>