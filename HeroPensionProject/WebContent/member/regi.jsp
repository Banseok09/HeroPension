<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../image/favicon-96x96.png">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../css/regi.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align:right">
<a href="../index.jsp">HOME</a>
</div>
<%
String test=  "tEST입니다.";
%>

<div class="center">
<h1>회원등록</h1>
<br>
<form id="_regiForm" method="post">
<input type="hidden" name="command" value="regiAf">
<div class="form-group">

	<input type="text" id="_userid" name="id" class="form-control input-lg"
	placeholder="&#xf007; user ID" style="font-family: FontAwesome; font-size: 20px">

	<span id="id_check_text"></span>	

	<input type="text" id="_pwd" name="pwd" class="form-control input-lg"
	placeholder="&#xf023; password" style="font-family: FontAwesome; font-size: 20px">
	<span id="pw_check_text"> </span>
	
	<input type="text" id="_pwd_same" name="pwd_same" class="form-control input-lg"
	placeholder="&#xf09c; password 확인" style="font-family: FontAwesome; font-size: 20px">
	<span id="pw_same_check_text"> </span>
	
	<input type="text" id="_name" name="name" class="form-control input-lg"
	placeholder="&#xf2c3; 이름" style="font-family: FontAwesome; font-size: 20px">
	<span id="name_check_text"> </span>

	<input type="text" id="_email" name="email" class="form-control input-lg"
	placeholder="&#xf0e0; E-Mail" style="font-family: FontAwesome; font-size: 20px">
	<span id="email_check_text"> </span>
	
	<input type="text" id="_phone" name="phone" class="form-control input-lg"
	placeholder="&#xf098; 전화번호" style="font-family: FontAwesome; font-size: 20px">
	<span id="phone_check_text"> </span>

	<input type="button" id="_btnRegi" value="회원가입" class="btn btn-primary btn-lg btn-block">
</div>
</form>
<a href="./memberController.jsp?command=login" >로그인</a>
</div>



<script type="text/javascript" src="../js/regi.js" ></script> 

</body>    
</html>