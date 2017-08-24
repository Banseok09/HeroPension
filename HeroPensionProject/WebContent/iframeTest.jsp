<%@page import="jdbc.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% DBConn.initConnect(); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<iframe src="./room/roomInfoImg.jsp?seq_room=3&info_room=반했어%20:%20복층(침대룸+거실+주방+화장실)"
 width="1000" height="800">

</iframe>
<button id="test">test</button>
<script type="text/javascript">
$(document).ready(function(){
	$("#test").click(function(){
		alert("hello");
		$("iframe").attr('src','./room/roomInfoImg.jsp?seq_room=4&info_room=럭셔리%20:%20복층(침대룸+거실+주방+화장실)');
	})
});
</script>

</body>
</html>