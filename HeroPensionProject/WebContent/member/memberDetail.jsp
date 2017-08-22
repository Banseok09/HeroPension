<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../image/favicon-96x96.png">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../css/regi.css" rel="stylesheet" type="text/css" />

<!-- <script type="text/javascript" src="../js/update.js" ></script>  -->
</head>
<body>
<div style="text-align:right">
<a href="../index.jsp">HOME</a>
</div>


<div class="center">
<h1>회원 정보 수정</h1>
<br>
<%
Object ologin = session.getAttribute("login");
MemberDTO mem = (MemberDTO)ologin;
%>

<form id="updateForm" method="post">
<input type="hidden" name="command" value="updateAf">
<div class="form-group">

	<input type="text" id="_userid" name="id" class="form-control input-lg"
	value="<%=mem.getId() %>" style="font-family: FontAwesome; font-size: 20px" readonly>

	<span id="id_check_text"></span>	

	<input type="text" id="_pwd" name="pwd" class="form-control input-lg"
	placeholder="&#xf023; password" style="font-family: FontAwesome; font-size: 20px">
	<span id="pw_check_text"> </span>
	
	<input type="text" id="_pwd_same" name="pwd_same" class="form-control input-lg"
	placeholder="&#xf09c; password 확인" style="font-family: FontAwesome; font-size: 20px">
	<span id="pw_same_check_text"> </span>
	
	<input type="text" id="_name" name="name" class="form-control input-lg"	value="<%=mem.getName() %>"
	placeholder="&#xf2c3; 이름" style="font-family: FontAwesome; font-size: 20px">
	<span id="name_check_text"> </span>

	<input type="text" id="_email" name="email" class="form-control input-lg" value="<%=mem.getEmail() %>"
	placeholder="&#xf0e0; E-Mail" style="font-family: FontAwesome; font-size: 20px">
	<span id="email_check_text"> </span>
	
	<input type="text" id="_phone" name="phone" class="form-control input-lg" value="<%=mem.getPhone() %>"
	placeholder="&#xf098; 전화번호" style="font-family: FontAwesome; font-size: 20px">
	<span id="phone_check_text"> </span>

	<input type="button" id="_btnUpdate" value="수정" class="btn btn-primary btn-lg btn-block">
</div>
</form>
</div>

<script type="text/javascript">
var pw_checked = false;
var pw_same_checked = false;
var name_checked = false;
var email_checked = false;
var phone_checked = false;
function allChecked(){
	return  pw_checked
	    && pw_same_checked
	    && email_checked
	    && phone_checked;
}

$(document).ready(function(){	
	$("#_pwd").blur(function(){
		var pwText = $("#_pwd").val();
		if(pwText==""){
			$("#_pwd").css("border","2px solid red");
			$("#pw_check_text").css("font-size","10px").css("color","red");
			$("#pw_check_text").text("필수 입력 사항입니다.");
			pw_checked = false;
			return;
		}
		
		// 영대소문자, 숫자, 특수문자 포함 8~15자리
		/*var regExp  = /^.*(?=^[a-zA-Z\d!@#$%^&+=]{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;*/
		var regExp  = /^.*(?=^.{8,15}$)(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[~`!@#$%^&\*\+=\-\|\\_\{\}\[\]:;'"<>\,\.\?\/]).*$/;
		if(regExp.test(pwText)){
			$("#_pwd").css("border","2px solid #4CAF50");
			$("#pw_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#pw_check_text").text("좋은 비밀번호입니다!");
			pw_checked = true;
		}else{
			$("#_pwd").css("border","2px solid red");
			$("#pw_check_text").css("font-size","10px").css("color","red");
			$("#pw_check_text").text("영대소문자, 숫자, 특수문자 조합 8~15자리로 입력해주세요");
			pw_checked = false;
		}
	});
	
	$("#_pwd_same").blur(function(){
		var pwText = $("#_pwd").val();
		var pw_sameText = $("#_pwd_same").val();
		if(pw_sameText==""){
			$("#_pwd_same").css("border","2px solid red");
			$("#pw_same_check_text").css("font-size","10px").css("color","red");
			$("#pw_same_check_text").text("필수 입력 사항입니다.");
			pw_same_checked = false;
			return;
		}
		
		// pw 값과 pw_same값이 같으면
		if(pwText==pw_sameText){
			$("#_pwd_same").css("border","2px solid #4CAF50");
			$("#pw_same_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#pw_same_check_text").text("동일한 비밀번호를 입력하셨습니다.!");
			pw_same_checked = true;
		}else{
			$("#_pwd_same").css("border","2px solid red");
			$("#pw_same_check_text").css("font-size","10px").css("color","red");
			$("#pw_same_check_text").text("동일한 비밀번호를 입력하세요!");
			pw_same_checked = false;
		}
	});
	
	$("#_name").blur(function(){
		var nameText = $("#_name").val();
		if(nameText==""){
			$("#_name").css("border","2px solid red");
			$("#name_check_text").css("font-size","10px").css("color","red");
			$("#name_check_text").text("필수 입력 사항입니다.");
			name_checked = false;
			return;
		}
		
		// 한글이나 영문 2글자이상 30글자 이하
		var regExp  = /^.*(?=^[\sa-zA-Z가-힣]{2,30}$)(?=.*[a-zA-Z|가-힣]).*$/;
		if(regExp.test(nameText)){
			$("#_name").css("border","2px solid #4CAF50");
			$("#name_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#name_check_text").text("멋진 이름이군요!");
			name_checked = true;
		}else{
			$("#_name").css("border","2px solid red");
			$("#name_check_text").css("font-size","10px").css("color","red");
			$("#name_check_text").text("영어 또는 한글로 2자리 이상 30자리 이하로 입력해주세요");
			name_checked = false;
		}
	});
	
	$("#_email").blur(function(){
		var emailText = $("#_email").val();
		if(emailText==""){
			$("#_email").css("border","2px solid red");
			$("#email_check_text").css("font-size","10px").css("color","red");
			$("#email_check_text").text("필수 입력 사항입니다.");
			email_checked = false;
			return;
		}
		
		var regExp  = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,20}\.[a-zA-Z]{2,3}$/;
		if(regExp.test(emailText)){
			$("#_email").css("border","2px solid #4CAF50");
			$("#email_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#email_check_text").text("사용 가능한 이메일입니다.!");
			email_checked = true;
		}else{
			$("#_email").css("border","2px solid red");
			$("#email_check_text").css("font-size","10px").css("color","red");
			$("#email_check_text").text("이메일 형식을 확인해주세요");
			email_checked = false;
		}
	});
	$("#_phone").blur(function(){
		var phoneText = $("#_phone").val();
		if(phoneText==""){
			$("#_phone").css("border","2px solid red");
			$("#phone_check_text").css("font-size","10px").css("color","red");
			$("#phone_check_text").text("필수 입력 사항입니다.");
			phone_checked = false;
			return;
		}
		
		var regExp = /^0[0-9]{2}-[0-9]{3,4}-[0-9]{4}$/;
		if(regExp.test(phoneText)){
			$("#_phone").css("border","2px solid #4CAF50");
			$("#phone_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#phone_check_text").text("사용 가능한 전화번호입니다.!");
			phone_checked = true;
		}else{
			$("#_phone").css("border","2px solid red");
			$("#phone_check_text").css("font-size","10px").css("color","red");
			$("#phone_check_text").text("전화번호 형식을 확인해주세요");
			phone_checked = false;
		}
	});
	
	$("#_btnUpdate").click(function(){
		if(!allChecked()){
			alert("모든 항목을 정확히 기입해주세요");
		}else{
			$("#updateForm").attr("action", "./memberController.jsp").submit();
		}
		
	});
});


</script>

</body>
</html>











