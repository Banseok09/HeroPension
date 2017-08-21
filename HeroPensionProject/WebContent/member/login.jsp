<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../image/favicon-96x96.png">
<title>login</title>
<!-- ajax + jQuery -->
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
<input type="hidden" name="command" value="loginAf">
<div class="input-group-lg">
	<input type="text" id="_userid" name="id" class="form-control input-lg"
	 placeholder="&#xf007; user ID" style="font-family: FontAwesome; font-size: 20px">

	<input type="text" id="_pwd" name="pwd" size="10" class="form-control input-lg"
	placeholder="&#xf023; password" style="font-family: FontAwesome; font-size: 20px">

	<input type="button" id="_btnLogin" value="로그인" class="btn btn-lg btn-success btn-block">
	<input type="checkbox" id="_chk_save_id"><label for="_chk_save_id"> 아이디 저장</label>
</div>
</form>

<p>아직 계정이 없으신가요? &nbsp; <a href="./regi.jsp">회원가입</a></p>
</div>
<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>
