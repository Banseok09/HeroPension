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
case "list" :
	response.sendRedirect("./bbslist.jsp");
	break; 
case "write" :
	response.sendRedirect("./bbswrite.jsp");
	break; 
}
%>
</body>
</html>