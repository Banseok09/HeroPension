<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="reviewBBS.ReviewBbsDto"%>
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
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
IReviewBbsDao reviewDao = ReviewBbsDao.getInstance();
boolean isS;
String command = request.getParameter("command");
switch(command){
case "list" :
	response.sendRedirect("./bbslist.jsp");
	break; 
case "write" :
	response.sendRedirect("./bbswrite.jsp");
	break; 
case "writeAf" :
	int seq_pen = Integer.parseInt(request.getParameter("seq_pen"));
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int rate = Integer.parseInt(request.getParameter("rate"));
	
	System.out.println("seq_pen::::" + seq_pen);
	
	ReviewBbsDto review = new ReviewBbsDto(seq_pen, id, title, content, rate);
	isS = reviewDao.writeBbs(review);
	if(isS){
		response.sendRedirect("./bbslist.jsp");
	}else{
		response.sendRedirect("./bbslist.jsp");
	}
	break; 
case "update" :
	%>
	<script>
		alert("Hi");
	</script>
	<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("./bbsupdate.jsp?seq="+seq);
	break; 
case "detail" :
	seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("bbsdetail.jsp?seq="+ seq);
	break; 
}
%>
</body>
</html>