<%@page import="pension.PensionDto"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>pensionController.jsp</title>
</head>
<body>

	<%
		String command = request.getParameter("command");

		switch (command) {
			case "pensionList":
				response.sendRedirect("./pensionList.jsp");
				break;
			case "pensionAdd":
				response.sendRedirect("./pensionAdd.jsp");
				break;
			case "pensionAddAf":
				String id = request.getParameter("id");
				String name_pen = request.getParameter("name_pen");
				String address = request.getParameter("address");
				String phone = request.getParameter("phone");
				String checkin_time = request.getParameter("checkin_time");
				String checkout_time = request.getParameter("checkout_time");
				int pickup = Integer.parseInt(request.getParameter("pickup"));
				String season_start = request.getParameter("season_start");
				String season_end = request.getParameter("season_end");
				int price_person = Integer.parseInt(request.getParameter("price_person"));
				int price_bbq = Integer.parseInt(request.getParameter("price_bbq"));
				String info_pen = request.getParameter("info_pen");
				String directions = request.getParameter("directions");
				String x_coordinate = request.getParameter("x_coordinate");
				String y_coordinate = request.getParameter("Y_coordinate");
				
				IPensionDao dao = PensionDao.getInstance();

				boolean isS = dao.addPension(new PensionDto(0, id, name_pen, address, phone, checkin_time,
						checkout_time, pickup, season_start, season_end, price_person, price_bbq, info_pen, directions,
						x_coordinate, y_coordinate, 0));

				if (isS) {
			%>
			<script type="text/javascript">
				alert('펜션을 추가하였습니다');
				location.href = "../index.jsp";
			</script>
			<%
				} else {
			%>
			<script type="text/javascript">
				alert('펜션을 추가하지 못 하였습니다');
				location.href = "../index.jsp";
			</script>
			<%
				}			
				break;
			case "PensionMyList":
				response.sendRedirect("./PensionMyList.jsp");

		}
	%>

</body>
</html>