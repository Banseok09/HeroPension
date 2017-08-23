<%@page import="pension.PensionDto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도 샘플</title>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
int seq = Integer.parseInt(request.getParameter("seq"));
String sql = "SELECT * FROM PENSION WHERE SEQ_PEN=? ";
DBConn.initConnect();
Connection conn = DBConn.getConnection();
PreparedStatement psmt = conn.prepareStatement(sql);
psmt.setInt(1, seq);

ResultSet rs = psmt.executeQuery();

PensionDto dto = null;

if(rs.next()){
	int i=1;
	dto = new PensionDto(
			rs.getInt(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getInt(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getInt(i++),
			rs.getInt(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getString(i++),
			rs.getInt(i++));
}

%>
<h1><%=dto.getName_pen() %></h1>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3d933aec9db29d8486c548a2720a722"></script>
<%-- pensionDto dto = dao.getPension() --%>
<script type="text/javascript">
var x_coord = <%=dto.getX_coordinate()%>;
var y_coord = <%=dto.getY_coordinate()%>;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(x_coord, y_coord), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(x_coord, y_coord); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
	map: map,
	title: '<%=dto.getName_pen()%>',
	position: markerPosition,
});
var markerImage = new daum.maps.MarkerImage(
		/* 'http://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png', */
		'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
		/* './image/marker.png', */
	    new daum.maps.Size(26, 37), new daum.maps.Point(13, 34));
	marker.setImage(markerImage);

//마커가 지도 위에 표시되도록 설정합니다
//marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    
</script>
</body>
</html>