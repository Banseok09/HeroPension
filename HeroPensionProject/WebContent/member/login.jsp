<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../css/favicon-96x96.png">
<title>login</title>
<!-- ajax + jQeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- cookie -->
<script src="../js/jquery.cookie.js"></script>
<!-- bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font awesome icon -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div style="text-align:right">
<a href="../index.jsp">HOME</a>
</div>

<div class="center">
<h1>Login</h1>
<br>
<form id="_loginForm" method="post">
<div class="input-group-lg">
	<input type="hidden" name="command" value="loginAf">
	<input type="text" id="_userid" name="id" class="form-control input-lg"
	 placeholder="&#xf007; user ID" style="font-family: FontAwesome; font-size: 20px">

	<input type="text" id="_pwd" name="pwd" size="10" class="form-control input-lg"
	placeholder="&#xf023; password" style="font-family: FontAwesome; font-size: 20px">
	
	<input type="button" id="_btnLogin" value="로그인" class="btn btn-lg btn-success btn-block">
	<input type="checkbox" id="_chk_save_id"><label for="_chk_save_id"> 아이디 저장</label>
</div>
</form>

<p>아직 계정이 없으신가요? &nbsp; <a href="regi.jsp" >회원가입</a></p>
</div>
<script type="text/javascript">
$(document).ready(function(){	
	var user_id = $.cookie("user_id");
	if(user_id != null){
		$("#_userid").val(user_id);
		$("#_chk_save_id").attr("checked", "checked");
	}

	$("#_btnLogin").click(function(){
		if($("#_userid").val()==""){
			alert("아이디를 입력해주십시오");
			$("#_userid").focus();
		}else if($("#_pwd").val()==""){
			alert("비밀번호를 입력해주십시오");
			$("#_pwd").focus();
		}else{
			if($("#_chk_save_id").is(":checked")){	
				$.cookie("user_id", $("#_userid").val(), {path:"/", expires:365});
			}else{	$.cookie("user_id", null, {path:"/", expires:-1});}
			$("#_loginForm").attr("action", "./memberController.jsp").submit();
		}
	});
	
	$("#_userid").keypress(function(event){
		if(event.which =='13'){
			event.preventDefault();
			$("#_pwd").focus();
		}
	});
	
	$("#_pwd").keypress(function(event){
		if(event.which =='13'){
			event.preventDefault();
			$("#_btnLogin").focus();
		}
	});
	
	$("#_chk_save_id").click(function(){
		if($(this).is(":checked")){	
			$.cookie("user_id", $("#_userid").val(), {path:"/", expires:365});
		}else{	$.cookie("user_id", null, {path:"/", expires:-1});}
	});
});
</script>
</body>    
</html>