<%@page import="java.util.List"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="pension.PensionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3>펜션관리 페이지</h3>

<a href="../index.jsp">Home</a>
<a href="./admin.jsp">관리자페이지</a>

<div>
<table border="1px solid black" align="center">
<col width="50px"><col width="200px"><col width="200px"><col width="200px"><col width="200px">
	<tr>
		<th bgcolor="#34C8D8">번호</th><th bgcolor="#34C8D8">펜션 ID</th>
		<th bgcolor="#34C8D8">펜션명</th><th bgcolor="#34C8D8">펜션 삭제</th>
	</tr>
	<%
		IPensionDao dao = PensionDao.getInstance();
		List<PensionDto> list = dao.getPensionList();
		
	//	int number = 1;
		for(PensionDto dto : list){
			%>
			<tr>
				<td><%=dto.getSeq_pen() %></td>
				<td><%=dto.getId() %></td>			
				<td><%=dto.getName_pen() %></td>
				<td><%= %></td>
				<td align="center">
					<a class="btn btn-lg btn-success" href="./AdminController.jsp?command=req_true&id=<%=dto.getId() %>"><i class="fa fa-circle-o" aria-hidden="true"></i></a>
					<a class="btn btn-lg btn-danger" href="./AdminController.jsp?command=req_false&id=<%=dto.getId() %>"><i class="fa fa-times" aria-hidden="true"></i></a>
				</td>
			</tr>			
			<%
	//		number++;
		}
			
	
	
	%>

</table>
</div>

</body>
</html>