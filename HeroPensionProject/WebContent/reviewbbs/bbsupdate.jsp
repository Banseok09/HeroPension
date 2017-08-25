<%@page import="reviewBBS.ReviewBbsDto"%>
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbswrite.jsp JSP Project 170807</title>
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
mem = (MemberDTO)ologin;

IReviewBbsDao dao = ReviewBbsDao.getInstance();
int seq = Integer.parseInt(request.getParameter("seq"));
ReviewBbsDto bbs = dao.getBbs(seq);
int seq_pen = bbs.getSeq_pen();
String pension_name = dao.getPensionName(seq_pen);

%>


<div class="center">
<h1>글 수정</h1>
<form action="bbsupdateAf.jsp" method="POST">
	<input type="hidden" name="seq" value="<%=seq %>">
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
		<td>제목</td>
		<td><%=bbs.getTitle() %></td>
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
		<td><textarea rows="10" id="content" cols="50" name="content" class="form-control"><%=bbs.getContent() %></textarea> </td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" id="writeBtn" class="btn btn-warning">
				<i class="fa fa-pencil-square-o">&nbsp; 수정하기</i>
			</button>
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