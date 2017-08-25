<%@page import="member.MemberDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
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
Object ologin = session.getAttribute("login");
MemberDTO mem = null;
MemberDao.getInstance();
if(ologin==null){%>
	<script type="text/javascript">
		alert("로그인 해주십시오");
		location.href = "../index.jsp";
	</script>
<% } 
mem = (MemberDTO)ologin;
%>
<h1>리뷰 작성</h1>
<%
/* int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));
String pension_name = request.getParameter("pension_name"); */

// test용 코드
int seq_pen = 4;
String pension_name = "가평 첫눈애 펜션";


%>
<div class="center">
<form action="reviewBbsController.jsp?command=writeAf" method="POST">
<input type="hidden" name="seq_pen" value="<%=seq_pen %>">
<input type="hidden" name="id" value="<%=mem.getId() %>">
	<table class="table table-bordered">
	<col width="200"><col width="500">
	<tr>
		<td>펜션 명</td>
		<td><%=pension_name %></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=mem.getId() %></td>
	</tr>
	
	<tr>
		<td><label for="title">제목</label></td>
		<td><input type="text" id="title" name="title" size="50" class="form-control"></td>
	</tr>
	<tr>
		<td><label for="title">평점</label></td>
		<td>
			<select name="rate" class="form-control" style="font-family: FontAwesome; width:200px">
				<!-- &#xf005; : 채워진 별   &#xf006; : 테두리만 있는 별-->
				<option value="1">&#xf005;&#xf006;&#xf006;&#xf006;&#xf006;</option>
				<option value="2">&#xf005;&#xf005;&#xf006;&#xf006;&#xf006;</option>
				<option value="3">&#xf005;&#xf005;&#xf005;&#xf006;&#xf006;</option>
				<option value="4">&#xf005;&#xf005;&#xf005;&#xf005;&#xf006;</option>
				<option value="5">&#xf005;&#xf005;&#xf005;&#xf005;&#xf005;</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="content">내용</label></td>
		<td><textarea rows="10" id="content" cols="50" name="content" class="form-control"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" id="writeBtn" class="btn btn-success">
				<i class="fa fa-pencil-square-o">&nbsp; 글쓰기</i>
			</button>
		</td>
	</tr>
	</table>
</form>
</div>
<a href="bbslist.jsp">글목록</a><br>

<script>
$(document).ready(function(){
	$("#writeBtn").click(function(){
		alert("hello");
		return;
	});
});
</script>


</body>    
</html>