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
int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));
String pension_name = request.getParameter("pension_name");

%>
<div class="center">
<form action="reviewBbsController.jsp?command=writeAf" method="POST" enctype="multipart/form-data">
	<table class="table table-bordered">
	<col width="200"><col width="500">
	<tr>
		<td>펜션 명</td>
		<td><%=pension_name %></td>
	</tr>
	<tr>
		<td><label for="id">아이디</label></td>
		<td><input type="text" id="id" name="id" readonly="readonly"
			 class="form-control" style="background-color: white"
			 size="50" value="<%=mem.getId() %>" ></td>
	</tr>
	
	<tr>
		<td><label for="title">제목</label></td>
		<td><input type="text" id="title" name="title" size="50" class="form-control"></td>
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
/* $(document).ready(function(){
	$("#writeBtn").click(function(){
		alert("hello");
		return;
	});
}); */
</script>


</body>    
</html>