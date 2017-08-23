<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="room.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<link rel="stylesheet" class="reserveCss" type="text/css" href="WebContent/css/reserve.css">
<script type="text/javascript" src="WebContent/js/reserve.js"></script>

</head>
<body>

<%!
// 1월 이었을때 -> 01로 바꾸는 함수
public String two(String msg){
    return msg.trim().length()<2?"0"+msg:msg.trim(); // 1 ~ 9 까지는 0을 붙여주겠다는 의미
}
 
// yyyy-mm-dd hh:mm:ss TimeStamp <- String
// yyyy-mm-dd Date <- String
public String toDates(String mdate){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
    
    String s = mdate.substring(0, 4) + "-" // yyyy 0부터 4까지 자른다
            + mdate.substring(4, 6) + "-"  // mm
            + mdate.substring(6, 8) + " "  // dd
            + mdate.substring(8, 10) + ":" // hh 
            + mdate.substring(10, 12) + ":00"; // 여기까지 형태를 잘 맞춰줘야 한다.
    // timestamp는 sql 소속을 사용
    Timestamp d = Timestamp.valueOf(s);
    
    return sdf.format(d);
}
 
%>

<%
MemberDTO login = (MemberDTO)session.getAttribute("login");
int seq_pen = Integer.parseInt(request.getParameter(("seq_pen"))); // 나중에 지희가 넘겨주는거 보고 수정
IRoomDao roomdao = RoomDao.getInstance();
List<RoomDto> list = roomdao.getRoomList(seq_pen);
%>

<div class="reservePage">
<div class="wrap_1000">	
    <br>        
    <div class="roomlist">            
     <table class="roomlist" border="1">
         <tr>
             <th style="width:13%;">객실명</th>
             <th style="width:9%;">기준/최대</th>
             <th style="width:8%;">박수</th>
             <th class="people" style="width:31%">인원</th>
             <th style="width:11%;">기본금액</th>
             <th style="width:11%;">이용금액</th>
         </tr>
     <%
     for(int i = 0;i < list.size(); i++){
    	 RoomDto roomdto = list.get(i);
    	 %>
    	 <tr>
    	 	<td><%=roomdto.getName_room() %></td>
    	 	<td><%=roomdto.getPerson_min() %> / <%=roomdto.getPerson_max() %> </td>
    	 	<td>
    	 	<select name="sleep" class="sleep">
    	 	<option value="1">1박</option>
    	 	<option value="2">2박</option>
    	 	<option value="3">3박</option>
    	 	<option value="4">4박</option>
    	 	<option value="5">5박</option>
    	 	<option value="6">6박</option>
    	 	<td><%=roomdto.getpri %> </td>
    	 	
    	 	</select>
    	 	</td>
    	 </tr>
    	 
    	 <%
     }     
     %>
            
        
    </table>
    </div>
           
        
        
      
    <div class="total_price"><b>결제금액 :</b> <strong class="totalPrice">99,000원</strong></div>
    <div class="real_price" ><b>현장결제 :</b> <strong class="realPrice">0원</strong></div>
    <p class="btn_decide"><button type="button" onclick="formSub();">예약하기</button></p>
</div>
</div>


</body>
</html>