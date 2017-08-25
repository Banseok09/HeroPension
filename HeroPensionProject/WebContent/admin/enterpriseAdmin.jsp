<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.enterpriseDto"%>
<%@page import="admin.enterpriseDao"%>
<%@page import="admin.IenterpriseDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<title>가맹정 승인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%!
//1 -> 01
public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
	// 길이값이 2보다 작으면 앞에 0을 붙여라 ex) 01,02,03 ... 
	// 아니면 msg 뿌려라
}

// yyyy-mm-dd hh:mm:ss	Timestemp	<- String
// yyyy-mm-dd  Date <- String
public String toDates(String mdate){	
	String s = mdate.substring(0, 4) + "년"	 	// yyyy
			+ mdate.substring(5, 7) + "월"		// MM
			+ mdate.substring(8, 10) + "일"		// dd
			+ mdate.substring(11, 13) + ":"		// hh
			+ mdate.substring(14, 16);	// mm		
	return s;
}
%>

<h3>가맹정 승인 페이지</h3>

<a href="../index.jsp">Home</a>
<a href="./admin.jsp">관리자페이지</a>

<div>
<table border="1px solid black" align="center">
<col width="50px"><col width="200px"><col width="200px"><col width="200px"><col width="200px">
	<tr>
		<th bgcolor="#34C8D8">번호</th><th bgcolor="#34C8D8">아이디</th>
		<th bgcolor="#34C8D8">펜션명</th><th bgcolor="#34C8D8">가입일</th>
		<th bgcolor="#34C8D8">승인요청</th>
	</tr>
	<%
	IenterpriseDao dao = enterpriseDao.getInstance();
	List<enterpriseDto> list = dao.requestList();
	
	int number = 1;
	for(enterpriseDto dto : list){
		%>
		<tr>
			<td><%=number %></td>
			<td><%=dto.getId() %></td>			
			<td><%=dto.getName() %></td>
			<td><%=toDates(dto.getWdate()) %></td>
			<td align="center">
				<a class="btn btn-lg btn-success" href="./AdminController.jsp?command=req_true&id=<%=dto.getId() %>"><i class="fa fa-circle-o" aria-hidden="true"></i></a>
				<a class="btn btn-lg btn-danger" href="./AdminController.jsp?command=req_false&id=<%=dto.getId() %>"><i class="fa fa-times" aria-hidden="true"></i></a>
			</td>
		</tr>			
		<%
		number++;		
	}
	%>

</table>
</div>

</body>
</html>













