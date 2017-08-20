<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="./image/favicon-96x96.png">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영웅펜션 - 실시간 최저가 예약 사이트</title>

<!-- ajax + jQeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font awesome icon -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0 auto; text-align:center " >
<div style="text-align:right">
<a href="./member/memberController.jsp?command=login">로그인</a>
<a href="./member/memberController.jsp?command=regi">회원가입</a>
</div>

<h1 style="align:center">
<!-- 스파이더맨 이미지 -->
<img src="./image/spiderman.jpg" width="100" height="100">
HERO Pension
<!-- 아이언맨 이미지 -->
<img src="./image/ironman.jpg" width="100" height="100">

</h1>
<!-- Font Awesone(fa) 아이콘 example -->
<h2>
	<i class="fa fa-cog fa-spin"></i>
	영업준비중
	<i class="fa fa-spinner fa-pulse"></i>
</h2>
<div style="width:700px; margin: 0 auto">
	<div class="form-group">
	<div class="input-group input-group-lg">
		<input type="text" class="form-control" placeholder="&#xf002; 검색" style="font-family: FontAwesome">
		<span class="input-group-btn">
	        <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
	    </span>
	</div>
	</div>
</div>
<script>

</script>
</body>
</html>