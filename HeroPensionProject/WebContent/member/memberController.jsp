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
switch(command){
case "login" :
	response.sendRedirect("./login.jsp");
	break; 
	
case "loginAf" : 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	/* dao 불러와서 로그인 처리*/
	%>
	<script type="text/javascript">
		alert("로그인");
		location.href = "../index.jsp";
	</script>
	<%
	break; 

case "regi" : 
	response.sendRedirect("./regi.jsp");
	break; 
	
case "regiAf" : 
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	/* MemberDto mem = new MemberDto(id,pw, ... ) */
			
	break; 
}
%>
</body>
</html>