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
<style type="text/css">
body{
margin:0 auto; 
text-align:center;
}
a{
	color: white;
}
table{
	margin:0 auto;
	width:1200px;
	background-color: #32c969; 
}
td:hover{
	background-color: #208745;
}
</style>

</head>
<body >
<table>
<col width="300"><col width="300"><col width="300"><col width="300">
<tr height=50>
<td><a id="enterprise">업체 관리</a></td>
<td><a id="pension" >펜션 관리</a></td>
<td><a id="noticebbs">공지사항 게시판 관리</a></td>
<td><a id="reviewbbs">리뷰 게시판 관리</a></td>
</tr>
</table>
<div id="include_page" style="width:1250px; margin:0 auto">
	<iframe src="./noticebbs.jsp" width="1200px" height="800px" style="border:none"></iframe>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("a#noticebbs").click(function(){
		
	});
});
</script>

</body>
</html>