<%@page import="bbs.BbsDto"%>
<%@page import="bbs.BbsDao"%>
<%@page import="bbs.iBbsDao"%>
<%@page import="member.MemberDto"%>
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
MemberDto mem = null;
mem = (MemberDto)ologin;

iBbsDao dao = BbsDao.getInstance();
int seq = Integer.parseInt(request.getParameter("seq"));
BbsDto bbs = dao.getBbs(seq);

%>


<div class="center">
<h1>글 수정</h1>
<form action="bbsupdateAf.jsp" method="POST">
	<input type="hidden" name="seq" value="<%=seq %>">
	<table class="table table-bordered">
	<col width="100"><col width="500">
	<tr>
		<td><label>아이디</label></td>
		<td>
		<input type="text" name="id" readonly="readonly"
			 class="form-control" style="background-color: white"
			 size="50" value="<%=mem.getId() %>" >
		</td>
	</tr>
	
	<tr>
		<td><label>제목</label></td>
		<td>
		<input type="text" name="title" size="50" value="<%=bbs.getTitle() %>"
		 class="form-control">
		</td>
	</tr>
	
	<tr>
		<td><label>내용</label></td>
		<td>
			<textarea rows="10" cols="50" name="content" class="form-control"><%=bbs.getContent() %></textarea>
			</td>
	</tr>
	<tr>
		<td colspan="2" align=center>
		<input type="submit" id="updateBtn" value="글수정"
			   class="btn btn-success" style="width:150px">
		</td>
	</tr>
	</table>
</form>
<a href="bbslist.jsp">글목록</a><br>
</div>


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