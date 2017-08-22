
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsDetail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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

iBbsDao dao = BbsDao.getInstance();
BbsDto bbs = dao.getBbs(seq);
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

dao.addReadcount(seq); // 조회수 증가

%>

<div class="center">
<h1>글 세부 정보</h1>

<table class="table table-bordered">
<col width="100"> <col width="500">
<tr>
	<td>작성자</td><td><%=bbs.getId() %></td>
</tr>
<tr>
	<td>제목</td><td><%=bbs.getTitle() %></td>
</tr>
<tr>
	<td>작성일</td><td><%=bbs.getWdate() %></td>
</tr>
<tr>
	<td>조회수</td><td><%=bbs.getReadcount() %></td>
</tr>
<tr>
	<td>정보</td><td><%=bbs.getRef()%>-<%=bbs.getStep()%>-<%=bbs.getDepth()%></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea rows="10" cols="50" name="content" 
	readonly="readonly" class="form-control" style="background: white"><%=bbs.getContent() %></textarea></td>
</tr>
<tr>
	<td>작성일</td><td><%=bbs.getWdate() %></td>
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
MemberDto ldto = (MemberDto)ologin;
if(bbs.getId().equals(ldto.getId())){
	%>
	<a class="btn btn-link" href="bbsupdate.jsp?seq=<%=bbs.getSeq() %>">글수정</a>
	<a class="btn btn-link" href="bbsdelete.jsp?seq=<%=bbs.getSeq() %>">글삭제</a>
	<%
}
%>


</div>
</body>    
</html>