<%@page import="member.MemberDao"%>
<%@page import="member.MemberDTO"%>
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
Object ologin = session.getAttribute("login");
MemberDTO mem = null;
if(ologin==null){%>
	<script type="text/javascript">
		alert("로그인 해주십시오");
		location.href = "../index.jsp";
	</script>
<%}else{
	mem = (MemberDTO)ologin;
	if(mem.getAuth()!=1){
		%>
		<script type="text/javascript">
			alert("관리자로 로그인 해주십시오");
			location.href = "../index.jsp";
		</script>
	<%
	}
} %>
<h1>글쓰기</h1>

<div class="center">
<form action="AdminController.jsp" method="POST">
	<input type="hidden" name="command" value="noticewriteAf">
	<table class="table table-bordered">
	<col width="200"><col width="500">
	<tr>
		<td><label>아이디</label></td>
		<td><input type="text" name="id" readonly="readonly"
			 class="form-control" style="background-color: white"
			 size="50" value="<%=mem.getId() %>" ></td>
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
<a href="./AdminController.jsp?command=noticebbs">글목록</a><br>

<script>

</script>


</body>    
</html>