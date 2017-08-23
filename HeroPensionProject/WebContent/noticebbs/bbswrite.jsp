<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbswrite.jsp JSP Project 170807</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.center{
	margin: auto;
	width: 700px;
	padding: 10px;
}
table{
	margin: auto;
	border: 0;
}
</style>
</head>
<body>
<%
/* Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
System.out.println(mem.toString()); */
%>
<h1>글쓰기</h1>

<div class="center">
<form action="bbswriteAf.jsp" method="POST">
	<table class="table table-bordered">
	<col width="200"><col width="500">
	<tr>
		<td><label>아이디</label></td>
		<td><input type="text" name="id" readonly="readonly"
			 class="form-control" style="background-color: white"
			 size="50" value="<%="park" %>" ></td>
	</tr>
	
	<tr>
		<td><label>제목</label></td>
		<td><input type="text" name="title" size="50" class="form-control"></td>
	</tr>
	
	<tr>
		<td><label>내용</label></td>
		<td><textarea rows="10" cols="50" name="content" class="form-control"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" id="writeBtn" value="글쓰기" class="btn btn-success">
		</td>
	</tr>
	</table>
</form>
</div>
<a href="bbslist.jsp">글목록</a><br>
<a href=#>로그아웃</a>

<script>
/* $(document).ready(function(){
	$("#writeBtn").click(function(){
		alert("hello");
		return;
	});
}); */
</script>


</body>    
</html>