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
<th>가입일</th><td><%= %></td>
<th></th><td></td>
</tr>

</table>

</body>
</html>