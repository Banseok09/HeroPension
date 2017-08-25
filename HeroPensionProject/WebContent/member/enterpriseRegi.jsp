<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가맹정 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../css/ent_regi.css?ver=3" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="text-align:right">
<a href="../index.jsp">HOME</a>
</div>

<div class="center">
<h1>가맹정 등록</h1>
<br>
<form id="_enterpriseForm" method="post">
<input type="hidden" name="command" value="enterlogin">
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
	
	<input type="text" id="_enter_name" name="name" class="form-control input-lg"
	placeholder="&#xf015; 업체명" style="font-family: FontAwesome; font-size: 20px">
	<span id="entername_check_text"> </span>

	<input type="text" id="_email" name="email" class="form-control input-lg"
	placeholder="&#xf0e0; E-Mail" style="font-family: FontAwesome; font-size: 20px">
	<span id="email_check_text"> </span>
	
	<input type="text" id="_phone" name="phone" class="form-control input-lg"
	placeholder="&#xf098; 전화번호" style="font-family: FontAwesome; font-size: 20px">
	<span id="phone_check_text"> </span>

	<input type="button" id="_btnEnterprise" value="가맹점등록" class="btn btn-primary btn-lg btn-block">
</div>
</form>
<a href="./memberController.jsp?command=login" >로그인</a>
</div>


<script type="text/javascript">
var id_checked = false;
var pw_checked = false;
var pw_same_checked = false;
var enter_name_checked = false;
var email_checked = false;
var phone_checked = false;
function allChecked(){
	return id_checked
	    && pw_checked
	    && pw_same_checked
	    && enter_name_checked
	    && email_checked
	    && phone_checked;
}

$(document).ready(function(){
	$("#_userid").blur(function(){
		var idText = $("#_userid").val();
		var regExp = /^[a-zA-Z][\w-]{6,14}$/;	
		$.ajax({
			type:"post",
			url:"./check.jsp?command=idCheck",
			data:{"_userid":idText}
		}).done(function(data){		
			if($.trim(data) == 'YES'){	// 사용 가능 할때				
				if(regExp.test(idText)){
					$("#_userid").css("border","2px solid #4CAF50");
					$("#id_check_text").css("font-size","10px").css("color","#4CAF50");
					$("#id_check_text").text("멋진 아이디네요!");
					id_checked=true;
				}else{
					$("#_userid").css("border","2px solid red");
					$("#id_check_text").css("font-size","10px").css("color","red");
					$("#id_check_text").text("영어로 시작하는 7~15자리 영문,숫자 조합으로 만들어주세요");
					id_checked=false;
				} 
			}else{	// 이미 사용중 일 때
				if(!regExp.test(idText)){
					$("#_userid").css("border","2px solid red");
					$("#id_check_text").css("font-size","10px").css("color","red");
					$("#id_check_text").text("영어로 시작하는 7~15자리 영문,숫자 조합으로 만들어주세요");
					id_checked=false;
				}else{
					$("#_userid").css("border","2px solid red");
					$("#id_check_text").css("font-size","10px").css("color","red");
					$("#id_check_text").text("이미 사용중인 아이디입니다");
					id_checked=false;
				}				
			}			
		});		

	});
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
	
	$("#_enter_name").blur(function(){
		var enternameText = $("#_enter_name").val();
		// 한글이나 영문 2글자이상 30글자 이하
		var regExp  = /^.*(?=^[\sa-zA-Z가-힣]{2,30}$)(?=.*[a-zA-Z|가-힣]).*$/;
		
		if(enternameText==""){
			$("#_enter_name").css("border","2px solid red");
			$("#entername_check_text").css("font-size","10px").css("color","red");
			$("#entername_check_text").text("필수 입력 사항입니다.");
			enter_name_checked = false;
			return;
		}
					
		if(regExp.test(enternameText)){
			$("#_enter_name").css("border","2px solid #4CAF50");
			$("#entername_check_text").css("font-size","10px").css("color","#4CAF50");
			$("#entername_check_text").text("멋진 펜션이군요!");
			enter_name_checked = true;
		}else{
			$("#_enter_name").css("border","2px solid red");
			$("#entername_check_text").css("font-size","10px").css("color","red");
			$("#entername_check_text").text("영어 또는 한글로 2자리 이상 30자리 이하로 입력해주세요");
			enter_name_checked = false;
		}
	});
	
	$("#_email").blur(function(){
		var emailText = $("#_email").val();
		var regExp  = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,20}\.[a-zA-Z]{2,3}$/;
		
		$.ajax({
			type:"post",
			url:"./check.jsp?command=emailCheck",
			data:{"_email":emailText}
		}).done(function(data){								
			if($.trim(data) == 'YES'){		// 사용 가능할때
			//	alert("사용가능");
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
			}else{		// 중복일때							
			//	alert("사용불가");
				if(!regExp.test(emailText)){
					$("#_email").css("border","2px solid red");
					$("#email_check_text").css("font-size","10px").css("color","red");
					$("#email_check_text").text("이메일 형식을 확인해주세요");
					email_checked = false;
				}else{
					$("#_email").css("border","2px solid red");
					$("#email_check_text").css("font-size","10px").css("color","red");
					$("#email_check_text").text("이미 사용중인 이메일 입니다");
					email_checked = false;
				}
			}
		});
		
	});
	
	$("#_phone").blur(function(){
		var phoneText = $("#_phone").val();
		var regExp = /^0[0-9]{2}-[0-9]{3,4}-[0-9]{4}$/;
		
		$.ajax({
			type:"post",
			url:"./check.jsp?command=phoneCheck",
			data:{"_phone":phoneText}
		}).done(function(data){				
			if($.trim(data) == 'YES'){
		//		alert("사용가능");
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
			}else{
		//		alert("사용불가");
				if(!regExp.test(phoneText)){
					$("#_phone").css("border","2px solid red");
					$("#phone_check_text").css("font-size","10px").css("color","red");
					$("#phone_check_text").text("전화번호 형식을 확인해주세요");
					phone_checked = false;
				}else{
					$("#_phone").css("border","2px solid red");
					$("#phone_check_text").css("font-size","10px").css("color","red");
					$("#phone_check_text").text("이미 사용중인 전화번호 입니다");
					phone_checked = false;
				}
			}
			
		});		
	});
	
	$("#_btnEnterprise").click(function(){
		if(!allChecked()){
			alert("모든 항목을 정확히 기입해주세요");
		}else{			
			$("#_enterpriseForm").attr("action", "./AdminController.jsp").submit();
		}
		
	});
});
</script>




</body>
</html>














