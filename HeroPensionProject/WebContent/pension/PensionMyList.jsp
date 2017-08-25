<%@page import="pension.PensionDto"%>
<%@page import="java.util.List"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@page import="pension.PagingBean"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[펜션 목록]IdPensionList.jsp</title>

<style type="text/css">
.center {
	margin: auto;
	width: 100%;
	padding: 10px
}

table {
	margin: auto;
}

th, td {
	text-align: center;
}

.title {
	text-align: left;
}
</style>

</head>
<body>
	<%
		Object ologin = session.getAttribute("login");

		if (ologin == null) {
	%>
	<script type="text/javascript">
		alert('로그인 하십시오');
		location.href = "../index.jsp";
		/* location.href = '../member/memberController.jsp?command=login'; */
	</script>
	<%
		return;
		}
		MemberDTO mem = (MemberDTO) ologin;
	%>

	<div id="id_pen" align="right">
		[<a href="../index.jsp">메인화면</a>] [<a
			href="../member/memberController.jsp?command=logout">로그아웃</a>] <br>
		<br>

		<%=mem.getName()%>님 &nbsp; <a
			href="../member/memberController.jsp?command=update">정보수정</a>
		<%
			if (mem.getAuth() == 2) {
		%>
		<!-- 업체는 본인 펜션 목록보기 조회가능 -->
		<a href="./pension/pensionController.jsp?command=pensionAdd">펜션 추가</a>
		<%
			}
		%>
		<hr>
	</div>

	<!-- 페이징 처리 정보 교환 -->
	<%
		PagingBean paging = new PagingBean();

		if (request.getParameter("nowPage") == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
		}
	%>
	
	<%
		IPensionDao pendao = PensionDao.getInstance();
		List<PensionDto> pen = null;
	%>
	

</body>
</html>