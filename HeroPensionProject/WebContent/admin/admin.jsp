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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

<td><a id="pension" href="memberManager.jsp">회원 관리</a></td>
<td><a id="enterprise" href="enterpriseAdmin.jsp">업체 관리</a></td>
<td><a id="enterprise" href="pensionManager.jsp">펜션 관리</a></td>
<td><a id="noticebbs" href="noticebbs.jsp">공지사항 게시판 관리</a></td>
<td><a id="reviewbbs" href="reviewbbs.jsp">리뷰 게시판 관리</a></td>

</tr>
</table>
<!--<div id="include_page" style="width:1250px; margin:0 auto">
	<iframe src="./noticebbs.jsp" width="1200px" height="800px" style="border:none"></iframe>
</div> -->

<div id="piechart"></div>

<script type="text/javascript">

$(document).ready(function(){
	$("a#noticebbs").click(function(){
		
	});
});

// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  ['Work', 8],
  ['Friends', 2],
  ['Eat', 2],
  ['TV', 3],
  ['Gym', 2],
  ['Sleep', 7]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'My Average Day', 'width':400, 'height':300};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>

</body>
</html>