
<%@page import="reviewBBS.ReviewBbsDao"%>
<%@page import="reviewBBS.IReviewBbsDao"%>
<%@page import="noticeBBS.NoticeBbsDto"%>
<%@page import="noticeBBS.NoticeBbsDao"%>
<%@page import="noticeBBS.INoticeBbsDao"%>
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
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminController</title>
</head>
<body>


<%
String command = request.getParameter("command");
INoticeBbsDao noticeDao = NoticeBbsDao.getInstance();
IReviewBbsDao reviewDao = ReviewBbsDao.getInstance();
IenterpriseDao dao = enterpriseDao.getInstance();
boolean isS;
switch(command){
case "login" :
	response.sendRedirect("./admin.jsp");
	break;
case "admin": response.sendRedirect("./enterpriseAdmin.jsp"); break;

case "enterregi" : response.sendRedirect("./enterpriseRegi.jsp"); break;

case "enterlogin" : 	
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	enterpriseDto ent = new enterpriseDto(id, pw, name, email, phone, null, -1, 0);
	isS = dao.addEnterprise(ent);
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
	response.sendRedirect("./noticebbs.jsp");
	break;
case "noticewrite":
	response.sendRedirect("./noticewrite.jsp");
	break;
case "noticewriteAf":
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	NoticeBbsDto dto = new NoticeBbsDto(id,title,content);
	isS = noticeDao.writeBbs(dto);
	if(isS){
		%>
		<script type="text/javascript">
			alert("공지사항 작성 성공");
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("공지사항 작성 실패");
		</script>
		<%
	}
	response.sendRedirect("./noticebbs.jsp");
	break;
case "noticedetail":
	int seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("./noticedetail.jsp?seq="+seq);
	break;
case "noticeupdate":
	seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("./noticeupdate.jsp?seq="+seq);
	break;
	
case "noticeupdateAf":
	seq = Integer.parseInt(request.getParameter("seq"));
	id = request.getParameter("id");          
	title = request.getParameter("title");    
	content = request.getParameter("content");
	NoticeBbsDto bbs = new NoticeBbsDto(id,title,content);
	isS = noticeDao.updateBbs(bbs, seq);
	if(isS){
		%>
		<script type="text/javascript">
			alert("공지사항 수정 성공");
			location.href = "./noticedetail.jsp?seq=<%=seq%>";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("공지사항 수정 실패");
			location.href = "./noticeupdate.jsp?seq=<%=seq%>";
		</script>
		<%
	}
	break;
	
case "noticedelete":
	seq = Integer.parseInt(request.getParameter("seq"));
	isS = noticeDao.deleteBbs(seq);
	if(isS){%>
		<script type="text/javascript">alert("글을 삭제했습니다.");</script>
		
	<%}else{%>		
		<script type="text/javascript">alert("글을 삭제하지 못했습니다.");</script>
		<%
	}
	response.sendRedirect("./noticebbs.jsp");
	break;
case "reviewdetail":
	seq = Integer.parseInt(request.getParameter("seq"));
	response.sendRedirect("./reviewdetail.jsp?seq="+seq);
	break;
case "reviewdelete":
	seq = Integer.parseInt(request.getParameter("seq"));
	isS = reviewDao.deleteBbs(seq);
	response.sendRedirect("./reviewbbs.jsp");
	break;
}

%>
</body>
</html>