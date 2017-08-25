<%@page import="member.MemberDao"%>
<%@page import="member.IMemberDao"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[펜션 추가]</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 
</head>
<body>
	<%
		Object ologin = session.getAttribute("login");

		if (ologin == null) {
	%>
	<script type="text/javascript">
		alert('로그인 하십시오');
		location.href = history.back(-1);
		/* location.href = '../member/memberController.jsp?command=login'; */
	</script>
	<%
		return;
		}
		
		MemberDTO mem = (MemberDTO) ologin;
	%>
	<%-- 
	<%
		if (mem.getAuth() != 0 || mem.getAuth() != 1) {
	%>
	<script type="text/javascript">
		alert('일반회원은 펜션을 추가 할 수 없습니다');
		location.href = history.back(-1);
	</script>
	<%
		return;
		}
	%>
 --%>
 
<div id="id_pen" align="right">
	[<a href="../index.jsp">메인화면</a>]
	[<a href="../member/memberController.jsp?command=logout">로그아웃</a>]
	<br><br>

	<%=mem.getName() %>님 &nbsp;
	<a href="../member/memberController.jsp?command=update">정보수정</a>
	
	<% if(mem.getAuth()==2){	%>	<!-- 업체는 본인 펜션 목록보기 조회가능 -->
	<a href="../pension/pensionController.jsp?command=PensionMyList">펜션 목록</a>
	<%} %>	
	<hr>
</div>
 
 
 <!-- [0824 펜션 추가 시 사진추가, 권한 막기만 하면 끝] -->

	<h2>펜션추가</h2>

	<form action="./pensionController.jsp?command=pensionAddAf" method="post" name="addPensionfrm">
		<table border="1">
			<tr>
				<td>[ 펜션장 Id ]</td>
				<td>
					<%=mem.getId()%>
					<input type="hidden" name="id" value="<%=mem.getId()%>">
				</td>
			</tr>

			<tr>
				<td>[ 펜션 이름 ]</td>
				<td>
					<input type="text" name="name_pen" maxlength="50" size="20">
				</td>
			</tr>
			<tr>
				<td>[ 펜션 주소 ]</td>
				<td>
					<input type="text" id="address_pen" name="address">
					<input type="button" onclick="Address_PostCode()" value="주소 검색"><br>
					<input type="hidden" name="x_coordinate" id="x_coordinate">
					<input type="hidden" name="Y_coordinate" id="Y_coordinate">
					<input type="hidden" id="testAddress">	<!-- 위도/경도 가져오기 위해 주소 값 넣기 -->
				</td>
			</tr>
			<tr>
				<td>[ 문의전화 ]</td>
				<td>
					<input type="text" name="phone" value="<%=mem.getPhone()%>">
				</td>
			</tr>
			<tr>
				<td>[ 체크인 / 체크아웃 ]</td>
				<td>
					<select name="checkin_time">
					<%
						for (int i = 0; i < 24; i++) {
					%>
						<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
					</select>시 이후 /
					
					<select name="checkout_time">
					<%
						for (int i = 0; i < 24; i++) {
					%>
						<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
					</select>시 이전
				</td>
			</tr>
			<tr>
				<td>[ 픽업여부 ]</td>
				<td>
					<input type="radio" name="pickup" value="0" checked="checked">픽업 가능 
					<input type="radio" name="pickup" value="1">픽업 불가능
				</td>
			</tr>
			<tr>
				<td>[ 성수기 ]</td>
				<td>
					시작일: <input type="text" name="season_start" id="season_start" size="8"> ~ 
					종료일: <input type="text" name="season_end" id="season_end" size="8">
				</td>
			</tr>
			<tr>
				<td>[ 추가 인원 금액 ]</td>
				<td>
					<input type="text" name="price_person" onkeypress="return isNumberKey(event);">원
				</td>
			</tr>
			<tr>
				<td>[ 숯, 그 릴 비 용 ]</td>
				<td>
					<input type="text" name="price_bbq" onkeypress="return isNumberKey(event);">원
				</td>
			</tr>

			<tr>
				<td>[ 찾아오시는 길 ]</td>
				<td>
					<textarea rows="5" cols="65" name="directions"></textarea>
				</td>
			</tr>

			<tr>
				<td>[ 펜션 소개글 ]</td>
				<td>
					<textarea rows="10" cols="65" name="info_pen"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>


 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a3d933aec9db29d8486c548a2720a722&libraries=services"></script>
<script>	// 검색한 주소 위도와 경도 가져오기
function sample5() {	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(document.getElementById("testAddress").value, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {
	    	document.getElementById("x_coordinate").value = result[0].y;
	    	document.getElementById("Y_coordinate").value = result[0].x;
	    }
	});
}
</script>


<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>	// 주소 검색하기
function Address_PostCode() {	
	new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address_pen").value = "[" + data.zonecode + "]" + fullAddr;
            document.getElementById("testAddress").value = data.address;
            sample5();
		}
    }).open();
}
</script>

<script type="text/javascript">
	$(function() {
		$("#season_start").datepicker({
			dateFormat : "yy-mm-dd",
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				onSelect : function(d) {
					if ( ( $("#season_end").val() != "" ) && ( $("#season_start").val() > $("#season_end").val() ) ) {
						alert('종료일이 시작일보다 큽니다');
					}
				}
		});

		$("#season_end").datepicker({
			dateFormat : "yy-mm-dd",
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			onSelect : function(d) {
				if ( $("#season_start").val() > $("#season_end").val() ) {
					alert('종료일이 시작일보다 큽니다');
				}
			}
		});
	});

	function isNumberKey(evt) {
		var charcode = (evt.which) ? evt.which : evt.keyCode;

		if (charcode != 46 && charcode > 31 && (charcode<48 || charcode>57)) {
			return false;
		} else	return true;
	}
</script>

</body>
</html>