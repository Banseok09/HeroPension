<%@page import="member.MemberDTO"%>
<%@page import="member.IMemberDao"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
	System.out.println("id"+id);
	System.out.println("pw"+pw);
	
	MemberDTO dto = dao.login(id, pw);		
//	System.out.println("dtoid"+dto.getId());
//	System.out.println("dtopw"+dto.getPw());
	
	if(dto != null){
		session.setAttribute("login", dto);
		session.setMaxInactiveInterval(30 * 60);
		switch(dto.getAuth()){
		case 1: //admin
			%>
			<script type="text/javascript">
			alert("로그인");
			location.href = "../admin/AdminController.jsp?command=login";
			</script>
			<%	
		break;
		case 3:
			%>
		<script type="text/javascript">
		alert("로그인");
		location.href = "../index.jsp";
		</script>
		<%	
		break;
		}
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
	
	MemberDTO mem = new MemberDTO(id, pw, name, email, phone, 3, 0, null);
	
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
		location.href = "./regi.jsp";
		</script>
		<%
	}
	%>
	
	<%		
	break; 
case "info":
	response.sendRedirect("./memberInfo.jsp");	
	break;
case "update":
	response.sendRedirect("./memberDetail.jsp");
	break;

case "updateAf":
	id = request.getParameter("id");
	pw = request.getParameter("pwd");
 	name = request.getParameter("name");
	email = request.getParameter("email");
	phone = request.getParameter("phone");
	
	isS = dao.updateMem(id, pw, name, phone, email);
	if(isS){
		%>
		<script type="text/javascript">
		alert("수정 성공");
		location.href = "../index.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("수정 실패");
		location.href = "./memberDetail.jsp";
		</script>
		<%
	}
	
	break;
	
}


%>
</body>
</html>