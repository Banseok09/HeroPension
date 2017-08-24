<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="margin:0 auto">
<table style="background-color: pink; width:1200px">
<tr height=50>
<td><a id="pension" href="memberManager.jsp">회원 관리</a></td>
<td><a id="enterprise" href="enterpriseAdmin.jsp">업체 관리</a></td>
<td><a id="enterprise" href="pensionManager.jsp">펜션 관리</a></td>
<td><a id="noticebbs" href="noticebbs.jsp">공지사항 게시판 관리</a></td>
<td><a id="reviewbbs" href="reviewbbs.jsp">리뷰 게시판 관리</a></td>
</tr>
</table>
<div id="include_page" style="width:1200px; margin:0 auto">
	<%-- <jsp:include page="noticebbs.jsp"></jsp:include> --%>
</div>

<script type="text/javascript">

</script>

</body>
</html>