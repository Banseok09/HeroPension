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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%!
public String processUploadedFile(FileItem fileItem, String dir, JspWriter out) throws IOException{
	String fileName = fileItem.getName();
	long sizeInBytes = fileItem.getSize();
	
	// 업로드한 파일이 정상일 경우
	if(sizeInBytes>0){    // c://temp\abc.jpg  c:\\temp/abc.jpg
		int idx = fileName.lastIndexOf("\\"); // \가 있는 마지막 위치를 찾아옴
		if(idx==-1){ //못찾았을 경우
			idx = fileName.lastIndexOf("/");  // /가 있는 마지막 위치를 찾아옴
		}
		fileName = fileName.substring(idx+1); // idx값 이후부터 끝까지의 값
		try{
		File uploadedFile = new File(dir, fileName);
		fileItem.write(uploadedFile);
		}catch(Exception e){}
	}
	return fileName;
}

%>

<%
String command = request.getParameter("command");
switch(command){
case "list" :
	response.sendRedirect("./bbslist.jsp");
	break; 
case "write" :
	response.sendRedirect("./bbswrite.jsp");
	break; 
case "writeAf" :
	
	break; 
case "update" :
	response.sendRedirect("./bbsupdate.jsp");
	break; 
case "detail" :
	int seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("bbsdetail.jsp?seq="+ seq);
	//pageContext.forward("bbsdetail.jsp?seq="+ seq);
	break; 
}
%>
</body>
</html>