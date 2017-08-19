<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../css/favicon-96x96.png">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	padding-top: 10px;
	width: 600px;
}
.borderless tr td{
	border: none !important;
	vertical-align: middle !important;
	font-size: 20px
}
</style>
</head>
<body>
<div style="text-align:right">
<a href="../index.jsp">HOME</a>
</div>

<div class="center">
<h1>회원등록</h1>
<form id="_regiForm" method="post">
<input type="hidden" name="command" value="regiAf">
<table class="table borderless">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="_userid" name="id" class="form-control input-lg" size="20">
		<div id="id_check_text"></div>
	</td>
	<td>
		<button type="button" id="idchkbtn" class="btn btn-info btn-lg">id체크</button>
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" id="_pwd" name="pwd" class="form-control input-lg" size="20">
	</td>
</tr>
<tr>
	<td class="align-middle">이름</td>
	<td>
		<input type="text" id="_name" name="name" class="form-control input-lg"size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" id="_email" name="email" class="form-control input-lg"size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" id="_btnRegi" value="회원가입" class="btn btn-info btn-lg btn-block">
	</td>

</tr>
</table>
</form>
<a href="./memberController.jsp?command=login" >로그인</a>
</div>


<script type="text/javascript">
$(document).ready(function(){
	$("#_btnRegi").click(function(){
		if($("#_userid").val()==""){
			alert("아이디를 입력해주십시오");
			$("#_userid").focus();
		}else{
			$("#_regiForm").attr("action", "./memberController.jsp").submit();
		}
	});
	
	$("#idchkbtn").click(function(){
	});
});

function whenerror(){
	alert('error');
}

</script>

</body>    
</html>