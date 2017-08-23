<%@page import="admin.enterpriseDao"%>
<%@page import="admin.IenterpriseDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin.enterpriseDto"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDao"%>
<%@page import="member.IMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String command = request.getParameter("command");
IenterpriseDao dao = enterpriseDao.getInstance();

switch(command){
case "admin": response.sendRedirect("./enterpriseAdmin.jsp"); break;

case "enterregi" : response.sendRedirect("./enterpriseRegi.jsp"); break;

case "enterlogin" : 	
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	enterpriseDto ent = new enterpriseDto(id, pw, name, email, phone, null, -1, 0);
	
	boolean isS = dao.addEnterprise(ent);
	if(isS){
		%>
		<script type="text/javascript">
		alert("회원가입 성공");
		alert("관리자에게 가맹점 승인요청을 보냈습니다 !!");
		location.href = "../index.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("회원가입 실패");
		location.href = "./enterpriseRegi.jsp";
		</script>
		<%
	}
	%>
	
	<%	
	break;

case "req_true":
	String req_id = request.getParameter("id");
	isS = dao.req_answer(req_id, 2);
	if(isS){
		%>
		<script type="text/javascript">
		alert("승인하였습니다");
		location.href = "../index.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("승인실패");
		location.href = "./enterpriseRegi.jsp";
		</script>
		<%
	}
	break;
	
	
case "req_false":
	req_id = request.getParameter("id");
	isS = dao.req_answer(req_id, -2);
	if(isS){
		%>
		<script type="text/javascript">
		alert("거절하였습니다");
		location.href = "../index.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("거절 실패");
		location.href = "./enterpriseRegi.jsp";
		</script>
		<%
	}
	break;

	
case "pension" : 
	break; 	
	
case "reviewbbs":
	break;
	
case "noticebbs":
	break;
}
%>

</body>
</html>