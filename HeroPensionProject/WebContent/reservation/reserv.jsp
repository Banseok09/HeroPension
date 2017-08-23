<%@page import="java.util.Date"%>
<%@page import="pension.PensionDto"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="jdbc.DBConn"%>
<%@page import="reservation.reservDto"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="room.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% DBConn.initConnect(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> <!-- min은 경량화시킨것 -->  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>

<h2>날짜 선택하기</h2>

<form action="">
<p>선택일:<input type="text" id="date"></p>
</form>

<%
// 로그인 정보 받아오기
//MemberDTO login = (MemberDTO)session.getAttribute("login");

//펜션 선택시 넘어오는 값 받아오기
//int seq_pen = Integer.parseInt(request.getParameter("seq_pen")); 
IPensionDao pendao = PensionDao.getInstance();
PensionDto pendto = pendao.getChoicePension(4);

IRoomDao roomdao = RoomDao.getInstance();
List<RoomDto> list = roomdao.getRoomList(4);

reservDto resdto = new reservDto();
// 성수기 시작, 끝 값 가져오기
String Season_start = pendto.getSeason_start(); // 잘 넘어옴
String Season_end = pendto.getSeason_end(); // 잘 넘어옴

%>



<script type="text/javascript">
var selectDate = ""; // 선택한 날짜 담기용 변수

// 날짜 체크
$(function () {
    $("#date").datepicker({
    	
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일", "월", "화", "수", "목", "금", "토"], //요일. 배열로 넣어야 한다
        monthNames:["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        onSelect:function( d ){  
        	var arr = d.split("/");
            var year = arr[0];
            var month = arr[1];
            var day = arr[2];
            
            $("#year").text(year + "년");
            $("#month").text(month + "월");
            $("#day").text(day + "일");
            
            // 요일 얻어오기
            var date = new Date($("#date").datepicker({dateFormat:"yy/mm/dd"}).val());
        
    		// 오늘 날짜 얻어오기(비교용)
    		var nowdate = new Date();
    
            week = new Array("일", "월", "화", "수", "목", "금", "토");    
           
            // 오늘 이전 날짜를 선택했을때 비워주기
            if (nowdate > date) {            
			alert("오늘 이전 날짜는 선택할 수 없습니다.");
			$("#date").val(""); // input 태그이기 때문에 text가 아닌 val로 설정
			}
            
            // 선택한 값을 변수에 담기
            selectDate = $("#date").val();
            alert(selectDate);
        }    
    });        
});

</script>


<div class="reservePage">
    <br>        
    <div class="roomlist">            
     <table class="roomlist" border="1">
         <tr>
             <th style="width:13%;" align="center">객실명</th>
             <th style="width:9%;" align="center">기준/최대</th>
             <th style="width:8%;" align="center">박수</th>
             <th class="people" style="width:40%" align="center">인원</th>             
             <th style="width:14%;" align="center">기본금액</th>
             <th style="width:14%;" align="center">이용금액</th>
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
    	 	</select>
    	 	</td>
    	 	<td>
            <b style="align-content: center;">성인</b>
            <select name="adult" class="reserve_checkbox" style="align-content: center;" OnChange="chkUser(0, this, '<%=roomdto.getPerson_max() %>', '10000');">
                <option value="0" selected>0</option>                                
                <option value="1" >1</option>                                
                <option value="2" >2</option>                                
                <option value="3" >3</option>                                
                <option value="4" >4</option>                                
                <option value="5" >5</option>                                
                <option value="6" >6</option>                                
                <option value="7" >7</option>                                
                <option value="8" >8</option>                                
                <option value="9" >9</option>                                
                <option value="10" >10</option>                                
                <option value="11" >11</option>                                
                <option value="12" >12</option>                                
                <option value="13" >13</option>                                
                <option value="14" >14</option>                                
                <option value="15" >15</option>                              
            </select>
            <b style="align-content: center;">소아</b>
            <select name="child" class="reserve_checkbox" style="align-content: center;" OnChange="chkUser(0, this, '<%=roomdto.getPerson_max() %>', '10000');">
                <option value="0" selected>0</option>                                
                <option value="1">1</option>                                
                <option value="2">2</option>                                
                <option value="3">3</option>                                
                <option value="4">4</option>                                
                <option value="5">5</option>                                
                <option value="6">6</option>                                
                <option value="7">7</option>                                
                <option value="8">8</option>                                
                <option value="9">9</option>                                
                <option value="10">10</option>                                
                <option value="11">11</option>                                
                <option value="12">12</option>                                
                <option value="13">13</option>                                
                <option value="14">14</option>                                
                <option value="15">15</option>                   
            </select>
            <b style="align-content: center;">유아</b>
            <select name="baby" class="reserve_checkbox" style="align-content: center;" OnChange="chkUser(0, this, '<%=roomdto.getPerson_max() %>', '10000');">                
                <option value="0" selected>0</option>                                
                <option value="1">1</option>                                
                <option value="2">2</option>                                
                <option value="3">3</option>                                
                <option value="4">4</option>                                
                <option value="5">5</option>                                
                <option value="6">6</option>                                
                <option value="7">7</option>                                
                <option value="8">8</option>                                
                <option value="9">9</option>                                
                <option value="10">10</option>                                
                <option value="11">11</option>                                
                <option value="12">12</option>                                
                <option value="13">13</option>                                
                <option value="14">14</option>                                
                <option value="15">15</option>  
            </select>
        	</td>
    	 	
    	 	<td><%=resdto.getPerson_total() %></td>
    	 	<td><%=roomdto.getPrice_basic() %></td>
    	 	<td><%=resdto.getPrice_res() %></td>
    	 </tr>    	 
    	 <%
     }     
     %>
  
       
    </table>
    </div>
</div>


</body>
</html>