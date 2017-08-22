<%@page import="member.MemberDTO"%>
<%@page import="member.IMemberDao"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
String command = request.getParameter("command");
IMemberDao dao = MemberDao.getInstance();

switch(command){
case "login" : response.sendRedirect("./login.jsp"); break; 
	
case "loginAf" : 
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	
			
//	IMemberDao dao = MemberDao.getInstance();

	MemberDTO dto = dao.login(id, pw);
	
//	System.out.println("dto.id : " + dto.getId());
	
	
	if(id.equals(dto.getId()) && pw.equals(dto.getPw())){
		%>
		<script type="text/javascript">
		alert("로그인");
		location.href = "../index.jsp";
		</script>				
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("아이디와 패스워드를 다시 확인하십시오");
		location.href = "./login.jsp";
		</script>			
		<%
	}
	%>
	
	<%
	break; 

case "regi" : response.sendRedirect("./regi.jsp"); break; 
	
case "regiAf" : 
	id = request.getParameter("id");
	pw = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	MemberDTO mem = new MemberDTO(id, pw, name, email, phone, 3, 0);
	
	boolean isS = dao.addMember(mem);
	if(isS){
		%>
		<script type="text/javascript">
		alert("회원가입");
		location.href = "../index.jsp";
	</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("회원가입 실패");
		location.href = "../index.jsp";
		</script>
		<%
	}
	%>
	
	<%		
	break; 
}
%>
</body>
</html>