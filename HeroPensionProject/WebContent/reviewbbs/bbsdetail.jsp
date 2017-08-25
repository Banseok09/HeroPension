
<%@page import="member.MemberDTO"%>
<%@page import="reviewBBS.ReviewBbsDto"%>
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsDetail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.center{
	margin: auto;
	width: 800px;
	padding: 10px
}
table{
	margin: auto;
}
</style>
</head>
<body>

<%
String seqStr = request.getParameter("seq");
int seq = Integer.parseInt(seqStr.trim());

IReviewBbsDao dao = ReviewBbsDao.getInstance();
ReviewBbsDto bbs = dao.getBbs(seq);
if(bbs==null){
	%>
	<script type="text/javascript">
		alert("글이 존재하지 않습니다.");
		location.href = "bbslist.jsp";
	</script>
	<%
}
if(bbs.getDel()==1){
	%>
	<script type="text/javascript">
		alert("삭제된 글입니다.");
		location.href = "bbslist.jsp";
	</script>
	<%
}
int seq_pen = bbs.getSeq_pen();
String pension_name = dao.getPensionName(seq_pen);

dao.addReadcount(seq); // 조회수 증가

%>

<div class="center">
<h1>리뷰</h1>

<table class="table table-bordered">
<col width="70"><col width="200"><col width="70"><col width="70"><col width="70"><col width="70">
<tr>
	<td>펜션명</td><td colspan="5"><%=pension_name %></td>
</tr>
<tr>
	<td>작성자</td><td colspan="5"><%=bbs.getId() %></td>
</tr>
<tr>
	<td>제목</td><td colspan="5"><%=bbs.getTitle() %></td>
</tr>
<tr>
	<td>작성일</td><td><%=bbs.getWdate() %></td>
	<td>조회수</td><td><%=bbs.getReadcount() %></td>
	<td>평점</td>
	<td>
	<%for(int i=0; i< 5; i++){ 
	if(i<bbs.getRate()){%>
		<i class="fa fa-star"></i>
	<%}else{ %>
		<i class="fa fa-star-o"></i>
	<% }
	} %>
	</td>
</tr>
<tr>
	<td>내용</td>
	<td colspan="5"><textarea rows="10" cols="50" name="content" 
	readonly="readonly" class="form-control" style="border:none !important;background: white"><%=bbs.getContent() %></textarea></td>
</tr>


</table>

<form action="answer.jsp" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
<input type="submit" class="btn btn-success" value="답글">
</form>

<br>
<a href="bbslist.jsp" class="btn btn-link">글목록</a>
<%
Object ologin = (Object)session.getAttribute("login");
MemberDTO mem = (MemberDTO)ologin;
if(bbs.getId().equals(mem.getId())){
	%>
	<a class="btn btn-link" href="reviewBbsController.jsp?command=update&seq=<%=seq %>">글수정</a>
	<a class="btn btn-link" href="bbsdelete.jsp?seq=<%=seq %>">글삭제</a>
	<%
}
%>


</div>
</body>    
</html>