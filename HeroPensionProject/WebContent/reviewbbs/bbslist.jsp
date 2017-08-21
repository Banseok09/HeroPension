<%@page import="reviewBBS.ReviewBbsDto"%>
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@page import="reviewBBS.PagingBean"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>bbslist</title>
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
}
th, td{
	text-align: center;
}
.title{ text-align: left;}
</style>
</head>
<body>

<%-- <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
MemberDao.getInstance();
if(ologin==null){%>
	<script type="text/javascript">
		alert("로그인 해주십시오");
		location.href = "index.jsp";
	</script>
<%}else{
	mem = (MemberDto)ologin;
} %> --%>

<%!
public String arrow(int depth){
	String rs = "<img src='image/arrow.png' width='20px' height='20px'>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	String ts = "";
	
	for(int i=0; i<depth; i++) ts+= nbsp;
	return depth==0?"":ts+rs;
}
%>

<h3>환영합니다park님 반갑습니다.</h3>

<a href="memberController.jsp?command=logout">로그아웃</a>
<a href="memberController.jsp?command=signout" id="signout">회원탈퇴</a>
<hr>
<%

PagingBean paging = new PagingBean();

if(request.getParameter("nowPage")==null) paging.setNowPage(1);
else paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));

String search_type = request.getParameter("search_type");
String search_key = request.getParameter("search_key");

if(search_type==null) search_type="";
if(search_key==null) search_key=""; 

IReviewBbsDao dao = ReviewBbsDao.getInstance();
List<ReviewBbsDto> bbslist = dao.getReviewBbsList(paging);

%>
<div class="center">
<h1>게시판</h1>
<a href="bbswrite.jsp">글쓰기</a>

<table class="table table-striped table-bordered">
<col width="50"><col width="400"><col width="50"><col width="50">
<thead>
<tr>
<th>번호</th><th class="title">제목</th><th>작성자</th><th>조회수</th>
</tr>
</thead>

<tbody>
<% for(int i=0; i<bbslist.size(); i++){
	ReviewBbsDto bbs = bbslist.get(i);
	%>
	<tr>
		<td><%=i+1 %></td>
		<td class="title">
			<%=arrow(bbs.getDepth())%>
			<% if(bbs.getDel()==0){ %>
			<a href="bbsdetail.jsp?seq=<%=bbs.getReview_seq()%>"><%=bbs.getTitle() %> </a>
			<%} else { %>
				삭제된 글입니다.
			<%} %>
		</td>
		<td><%=bbs.getId() %></td>
		<td><%=bbs.getReadcount() %></td>
	</tr>
<%} %>
	<tr>
	<td colspan="5">
	<jsp:include page="paging.jsp">
		<jsp:param name="actionPath" value="bbslist.jsp"/>
		<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage()) %>" />
		<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount()) %>" />
		<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage()) %>" />
		<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount()) %>" />
	</jsp:include>
	</td>
	</tr>

</tbody>

</table>

<form action="bbslist.jsp" style="text-align: center" class="form-group">
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
</script>
</body>
</html>