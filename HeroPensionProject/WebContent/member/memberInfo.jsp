<%@page import="reservation.reservDao"%>
<%@page import="reservation.IreservDao"%>
<%@page import="member.MemberDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
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
<h1>개인 정보 페이지</h1>
<a href="../index.jsp">Home</a>
<hr>
<h2>회원 정보</h2>
<table class="table table-bordered">
<tr>
<th>아이디</th><td><%=mem.getId() %></td>
<th>이름</th><td><%=mem.getName() %></td>
</tr>
<tr>
<th>전화번호</th><td><%=mem.getPhone() %></td>
<th>이메일</th><td><%=mem.getEmail() %></td>
</tr>
<tr>
<th>가입일</th><td><%=mem.getRegidate() %></td>
<th>정보 수정</th>
<td>
<a href="memberController.jsp?command=update" class="btn btn-warning" id="bbs_update">
		<i class="fa fa-pencil">&nbsp; 수정</i>
</a>
</td>
</tr>
</table>
<br>

<h2>ㅇ</h2>
<%
	IreservDao dao = reservDao.getInstance();
%>
<table class="table table-bordered">
<tr>
<th>펜션명</th><th>방이름</th><th>체크인</th><th>체크아웃</th><th>인원수</th><th>가격</th>
</tr>
</table>

<h2>다녀간 펜션</h2>
<%

%>
<table class="table table-bordered">
<tr>
<th>펜션명</th><th>방이름</th><th>체크인</th><th>체크아웃</th><th>인원수</th><th>가격</th>
</tr>
</table>

</body>
</html>