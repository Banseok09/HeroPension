
<%@page import="member.MemberDao"%>
<%@page import="member.MemberDTO"%>
<%@page import="noticeBBS.NoticeBbsDto"%>
<%@page import="noticeBBS.NoticeBbsDao"%>
<%@page import="noticeBBS.INoticeBbsDao"%>
<%@page import="reviewBBS.ReviewBbsDto"%>
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
Object ologin = session.getAttribute("login");
MemberDTO mem = null;
MemberDao.getInstance();
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
<%
String seqStr = request.getParameter("seq");
int seq = Integer.parseInt(seqStr.trim());

INoticeBbsDao dao = NoticeBbsDao.getInstance();
NoticeBbsDto bbs = dao.getBbs(seq);
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
<h1>공지사항</h1>

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
	<td>내용</td>
	<td><textarea rows="10" cols="50" name="content" 
	readonly="readonly" class="form-control" style="background: white"><%=bbs.getContent() %></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<form id="form" method="post" style="text-align:center">
			<input type="hidden" name="seq" value="<%=seq %>">
			<input type="button" class="btn btn-success" id="bbs_update" value="수정">
			<input type="button" class="btn btn-warning" id="bbs_delete" value="삭제">
		</form>
	</td>

</tr>

</table>



<br>
<a href="AdminController.jsp?command=noticebbs" class="btn btn-link">글목록</a>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("#bbs_update").click(function(){
		$("#form").attr("action", "./AdminController.jsp?command=noticeupdate").submit();
	});
	$("#bbs_delete").click(function(){
		var del = confirm("정말로 삭제하시겠습니까?");
		if(del){
			$("#form").attr("action", "./AdminController.jsp?command=noticedelete").submit();
		}
	});
});


</script>
</body>    
</html>