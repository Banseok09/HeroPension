<%@page import="java.util.List"%>
<%@page import="room.RoomDao"%>
<%@page import="room.IRoomDao"%>
<%@page import="room.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>
<body>
<%
	String command = request.getParameter("command");

	int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));	

	switch(command){
		case "roomInfo" :				
			response.sendRedirect("./roomInfo.jsp?seq_pen="+seq_pen);
			break; 			
	}

/* 	
	String id = req.getParameter("id");
	CustUserService service = CustUserService.getInstance();
	CustUserBean cust = service.getCustUser(id);				
	req.setAttribute("cust", cust);
	dispatch("CustUpdate.jsp", req, resp);
 */
%>
</body>
</html>