<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDao"%>
<%@page import="member.IMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<h3>가맹정 승인 페이지</h3>

<a href="../index.jsp">Home</a>
<a href="./admin.jsp">관리자페이지</a>

<div>
<table border="1px solid black" align="center">
<col width="50px"><col width="200px"><col width="200px"><col width="200px"><col width="200px">
	<tr>
		<th bgcolor="#34C8D8">번호</th><th bgcolor="#34C8D8">아이디</th>
		<th bgcolor="#34C8D8">이름</th><th bgcolor="#34C8D8">이메일</th>
	</tr>
	<%
	IMemberDao dao = MemberDao.getInstance();
	List<MemberDTO> list =  dao.getMemberList();
	
	int number = 1;
	for(MemberDTO dto : list){
		%>
		<tr>
			<td><%=number %></td>
			<td><%=dto.getId() %></td>			
			<td><%=dto.getName() %></td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<%
		number++;
	}
	%>

</table>
</div>

</body>
</html>












