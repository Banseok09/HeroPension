<%@page import="pension.PensionDto"%>
<%@page import="java.util.List"%>
<%@page import="pension.PensionDao"%>
<%@page import="pension.IPensionDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[��� ����Ʈ]</title>

<!-- bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<%!
		// ��� ��ǥ �̹����� Ŭ���ϸ�, Pensiondetail.jsp �̵�
		public String showPenImg(PensionDto dto) {
			int seq = dto.getSeq_pen();
			
			String s = "";
			String url = "../room/roomController.jsp";
			String image = "<img alt='x' src='../image/PENSION_IMG/pension"+seq+"/pension"+seq+"_00.jpg'  width='200' height='100'>";
			
			s = String.format("<a href='%s?command=roomInfo&seq_pen=%d'>%s</a>", url, seq, image);
			
			System.out.println("img: " + image);
	
			return s;
		}

	// 15�� �̻� �Ǹ� ...���� ǥ���ϴ� �Լ�
	public String dot3(String msg) {
		String s = "";
		if (msg.length() >= 15) {
			s = msg.substring(0, 15);
			s += "...";
		} else {
			s = msg.trim();
		}
		return s;
	}

	// �� ��¥���� ���̺��� �����ϴ� �Լ�
	public String makeTable(PensionDto list) {
		String s = "";

		s = "<table align='center'>";
		s += "<tr>";
		s += "<td>";
		s += showPenImg(list);	// ��ǥ�̹��� ex)seq��ȣ_00.jpg -> 4_00.jpg
		s += "</td>";
		s += "<tr><td width='200' height='100'>";
		s += "<a href='../room/roomController.jsp?command=roomInfo&seq_pen=" + list.getSeq_pen() + "'>";
		s += dot3(("["+list.getAddress().substring(0, 2) + "] "+list.getName_pen()));
		s += "</a><br>";
		s += "50000��";
		s += "</td>";
		s += "</tr>";

		s += "</table>";

		return s;
	}
	%>

	<%
		IPensionDao dao = PensionDao.getInstance();
		List<PensionDto> penlist = dao.getPensionList();
	%>

	Hero ���!
	<br> ���� Ư���Ѱ� �ִ�! Ư���� ����� ã�´ٸ� ���Ⱑ ���̴�.

	<div id="pension" align="center">
		<table align="center" width="80%">
			<tr>
				<%
					for (int i = 0; i < penlist.size(); i++) {
				%>
				<td width="300">
					<%=makeTable(penlist.get(i)) %>					
				</td>
				<%
					if ((i + 1) % 5 == 0) {
				%>
			</tr>
			<tr>
			<%
					}

				}
			%>
			</tr>
		</table>
	</div>
</body>
</html>