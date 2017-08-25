
<%@page import="member.MemberDTO"%>
<%@page import="jdbc.DBConn"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% DBConn.initConnect(); %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="./image/favicon-96x96.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영웅펜션 - 실시간 최저가 예약 사이트</title>

<style type="text/css">
/* 상단 탐색에 검정색 배경색 추가 */
.topnav {
    background-color: #333;
    overflow: hidden;
}

/* 탐색 막대 안의 링크 스타일 지정 */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

/* 마우스 오버시 링크 색상 변경 */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* 활성 / 현재 링크에 색상 추가 */
.topnav a.active {
    background-color: #4CAF50;
    color: white;
}
</style>

<!-- ajax + jQeury -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font awesome icon -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="./css/index.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
</head>
<body>
<% MemberDTO dto = (MemberDTO)session.getAttribute("login"); %>

<div class="header">
<%
if(dto == null){
	%>
	<a href="./member/memberController.jsp?command=regi">회원가입</a>
	<%
}else if(dto.getAuth()==1){
	%>
	<a href="./admin/admin.jsp">관리자페이지</a>
	<%
}
%>
<a href="./noticebbs/noticeBbsController.jsp?command=list">공지사항</a>
<a href="./reviewbbs/reviewBbsController.jsp?command=list">리뷰게시판</a>
<a href="./member/memberController.jsp?command=info">회원 정보</a>
<a href="./admin/AdminController.jsp?command=enterregi">가맹점등록</a>
<a href="./admin/AdminController.jsp?command=admin">가맹점요청목록</a>
<% 
if(dto == null){
	%>
	<a href="./member/memberController.jsp?command=login">로그인</a>
	<%
}else{
	%>	
	<a href="./member/memberController.jsp?command=logout">로그아웃</a>
	<a href="./member/memberController.jsp?command=update">정보수정</a>
	<%
}
%>
</div>

<h1 style="align:center">
<!-- 스파이더맨 이미지 -->
<img src="./image/spiderman.jpg" width="100" height="100">
HERO Pension
<!-- 아이언맨 이미지 -->
<img src="./image/ironman.jpg" width="100" height="100">

</h1>
<!-- Font Awesone(fa) 아이콘 example -->
<h2><i class="fa fa-cog fa-spin"></i>영업준비중<i class="fa fa-spinner fa-pulse"></i></h2>
<div style="width:400px; margin: 0 auto">
	<div class="form-group">
	<div class="input-group input-group-lg">
		<input type="text" class="form-control" placeholder="&#xf002; 검색" style="font-family: FontAwesome">
		<span class="input-group-btn">
	        <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
	    </span>
	</div>
	</div>
</div>
<div class="gnb_menu">
	<div class="inner">
		<ul>
			<li class="top_gnb_menu first"><a href="/local/tobe_sub_main.asp?sidoCode=01&amp;sido_kind=1&amp;gugun_code=02" class="menu1">지역별펜션</a></li>
			<li class="top_gnb_menu"><a href="/search/reserve_search.asp" class="menu2">빈방검색</a></li>
			<li class="top_gnb_menu"><a href="/spa/spa_main.asp" class="menu3">스파펜션</a></li>
     		<li class="top_gnb_menu"><a href="/poolvilla/poolvilla_main.asp" class="menu11">풀빌라펜션</a></li>
			<li class="top_gnb_menu"><a href="/resort/tobe_mt.asp" class="menu5">워크샵/MT펜션</a></li>
     		<li class="top_gnb_menu"><a href="/pool/pool_main.asp" class="menu4">수영장펜션</a></li>
			<li class="top_gnb_menu last"><a href="/event/event_detail_list.asp" class="menu7">기획전</a></li>
		</ul>
	</div>
</div>


<!-- 메인 top header 시작  -->

<div id="hotel" class="tabcontent">
  <img src="./image/hotel1.jpg" width="1200px" height="300px">
</div>

<div id="child" class="tabcontent">
  <img src="./image/child1.jpg" width="1200px" height="300px">
</div>

<div id="waterPark" class="tabcontent">
  <img src="./image/waterPark1.jpg" width="1200px" height="300px">
</div>

<div id="GlamPing" class="tabcontent">
  <img src="./image/glamping1.jpg" width="1200px" height="300px">
</div> 
<div class="tablinkgroup">
	<button class="tablink" onclick="openCity('hotel', this, 'red')" id="defaultOpen">호텔급 펜션</button>
	<button class="tablink" onclick="openCity('child', this, 'green')">유아용 수영장</button>
	<button class="tablink" onclick="openCity('waterPark', this, 'blue')">워터파크</button>
	<button class="tablink" onclick="openCity('GlamPing', this, 'orange')">글램핑&카라반</button>
</div>
<br>
<script>
function openCity(option, elmnt, color) {
    // 기본적으로 class = "tabcontent"인 모든 요소 숨기기
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    
    // 모든 탭 / 단추의 배경색 제거
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }

    // 특정 탭 콘텐츠 표시
    document.getElementById(option).style.display = "block";

    // 탭 내용을 여는 데 사용되는 버튼에 특정 색상 추가
    elmnt.style.backgroundColor = color; 
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
<!-- 메인 top header 끝  -->
<br>

<div class="pension">
	<jsp:include page="./pension/pensionList.jsp"/>
</div>
<a href="./pension/pensionController.jsp?command=pensionAdd">펜션추가</a>
  
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-105155318-1', 'auto');
  ga('send', 'pageview');

</script>


<br>
<a href="./room/roomController.jsp?command=roomInfo&seq_pen=4" >룸 정보 보기</a>





</body>
</html>
