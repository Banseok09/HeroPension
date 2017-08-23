<%@page import="member.MemberDao"%>
<%@page import="member.MemberDTO"%>
<%@page import="noticeBBS.NoticeBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="noticeBBS.NoticeBbsDao"%>
<%@page import="noticeBBS.INoticeBbsDao"%>
<%@page import="noticeBBS.PagingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.center{
	margin: auto;
	width: 100%;
	padding: 10px
}
table{
	margin: auto;
	vertical-align: center;
}
th, td{
	text-align: center;
	vertical-align: center !important;
}
.title{ text-align: left;}
</style>
</head>
<body style="margin:0 auto">

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

<%!
public String arrow(int depth){
	String rs = "<i class='fa fa-arrow-right'></i>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	String ts = "";
	
	for(int i=0; i<depth; i++) ts+= nbsp;
	return depth==0?"":ts+rs;
}
%>

<h3>공지사항 수정</h3>

<a href="../index.jsp">Home</a>
<a href="./admin.jsp">관리자페이지</a>
<hr>
<%

PagingBean paging = new PagingBean();

if(request.getParameter("nowPage")==null) paging.setNowPage(1);
else paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));

String search_type = request.getParameter("search_type");
String search_key = request.getParameter("search_key");

if(search_type==null) search_type="";
if(search_key==null) search_key=""; 

INoticeBbsDao dao = NoticeBbsDao.getInstance();
List<NoticeBbsDto> bbslist = dao.getBbsList(paging);

%>
<div class="center">
<table class="table table-striped table-bordered" style="width:1200px">
<col width="50"><col width="800"><col width="100"><col width="100"><col width="50"><col width="50">
<thead>
<tr>
<th>번호</th><th class="title">제목</th><th>작성자</th><th>조회수</th><th>수정</th><th>삭제</th>
</tr>
</thead>

<tbody>
<% for(int i=0; i<bbslist.size(); i++){
	NoticeBbsDto bbs = bbslist.get(i);
	%>
	<tr>
		<td><%=i+1 %></td>
		<td class="title">
			<%=arrow(bbs.getDepth())%>
			<% if(bbs.getDel()==0){ %>
			<a href="AdminController.jsp?command=noticedetail&seq=<%=bbs.getSeq_notice()%>"><%=bbs.getTitle() %> </a>
			<%} else { %>
				삭제된 글입니다.
			<%} %>
		</td>
		<td><%=bbs.getId() %></td>
		<td><%=bbs.getReadcount() %></td>
		<td>
			<form id="update_form">
				<input type="hidden" name="command" value="noticeupdate">
				<input type="hidden" name="seq" value="<%=bbs.getSeq_notice()%>">
				<button type="button" name="bbs_update"
				 class="btn btn-sm btn-warning"><i class="fa fa-minus-circle"></i></button>
			</form>
		</td>
		<td>
			<form id="del_form">
				<input type="hidden" name="command" value="noticedelete">
				<input type="hidden" name="seq" value="<%=bbs.getSeq_notice()%>">
				<button type="button" name="bbs_delete"
				 class="btn btn-sm btn-danger"><i class="fa fa-minus-circle"></i></button>
			</form>
		</td>
	</tr>
<%} %>
	<tr>
	<td colspan="6">
	<jsp:include page="paging.jsp">
		<jsp:param name="actionPath" value="noticebbs.jsp"/>
		<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage()) %>" />
		<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount()) %>" />
		<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage()) %>" />
		<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount()) %>" />
	</jsp:include>
	</td>
	</tr>

</tbody>

</table>


<form action="noticebbs.jsp" style="text-align: center" class="form-group">
		<div class="form-inline">
		<div class="form-group">
		<select name="search_type" class="form-control">
			<option value="id">아이디</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search_key" class="form-control" size="30">
		<input type="submit" class="btn btn-primary" value="검색">
		</div>
		</div>
</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("button[name=bbs_update]").click(function(){
		$("#update_form").attr("action", "./AdminController.jsp").submit();
	});
	$("button[name=bbs_delete]").click(function(){
		var del = confirm("정말로 삭제하시겠습니까?");
		if(del){
			$("#del_form").attr("action", "./AdminController.jsp").submit();
		}
	});
});

</script>
</body>
</html>