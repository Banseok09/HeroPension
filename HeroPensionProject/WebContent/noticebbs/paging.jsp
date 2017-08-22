<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<%
String actionPath = request.getParameter("actionPath"); // bbslist.jsp

String search_type = request.getParameter("search_type");
String search_key = request.getParameter("search_key");

String sNowPage = request.getParameter("nowPage");				// 현재 페이지
String sTotalCount = request.getParameter("totalCount");		// 올린 글수
String sCountPerPage = request.getParameter("countPerPage");	// 1페이지당 글 개수
String sBlockCount = request.getParameter("blockCount");		// 1블록당 페이지 개수

System.out.println("sNowPage: " + sNowPage);
System.out.println("sTotalCount: " + sTotalCount);
System.out.println("sCountPerPage?: " + sCountPerPage);
System.out.println("sBlockCount: " + sBlockCount);

int nowPage = (sNowPage==null || sNowPage.trim().equals(""))?1:Integer.parseInt(sNowPage);	
int totalCount = (sTotalCount==null || sTotalCount.trim().equals(""))?0:Integer.parseInt(sTotalCount);	
int countPerPage = (sCountPerPage==null || sCountPerPage.trim().equals(""))?1:Integer.parseInt(sCountPerPage);
int countPerBlock = (sBlockCount==null || sBlockCount.trim().equals(""))?1:Integer.parseInt(sBlockCount); 

System.out.println("nowPage: " + nowPage);
System.out.println("totalCount: " + totalCount);
System.out.println("countPerPage: " + countPerPage);
System.out.println("countPerBlock: " + countPerBlock);

int totalPage = (int)((totalCount-1)/countPerPage)+1;
System.out.println("totalPage: " + totalPage);

int totalBlock = (int)((totalPage-1)/countPerBlock);
int nowBlock = (int)((nowPage-1)/countPerBlock);

// [첫페이지][이전블록][이전페이지][1][2][3][다음페이지][다음블록][끝페이지]
int firstPage = 1;
int lastPage = totalPage;

/* prevBlockPage, nextBlockPage은 현재 페이지에서 블록당 페이지 수만큼 ±한 페이지 */
/* 15->5          15->25   */
int prevBlockPage =(nowBlock==0) ? prevBlockPage=1 : nowPage-countPerPage; // 현재 블록이 첫번째 블록일 경우 1

int nextBlockPage = nowPage+countPerPage;
if(nextBlockPage>totalPage) nextBlockPage = totalPage;  // 현재페이지+countPerPage가 총페이지보다 클경우 

int prevPage = (nowPage > 1) ? nowPage-1 : 1;
int nextPage = (nowPage < totalPage) ? nowPage+1: totalPage;

int startPage = nowBlock * countPerBlock + 1; // 현재 블록 첫번째 페이지
int endPage = countPerBlock * (nowBlock+1);   // 현재 블록 마지막 페이지
if(endPage > totalPage) endPage = totalPage;  // ex) 총페이지수가 86페이지일경우, 현재 블록의 페이지가 81부터 시작이라고 할때(startPage) 
										      //     endPage가 90이면 없는 페이지(87,88,89,90)의 링크를 생성하므로 endPage를 총 페이지수(86)으로 변경    

/* System.out.println("prevBlock: " + prevBlock);
System.out.println("nextBlock: " + nextBlock);
System.out.println("prevPage: " + prevPage);
System.out.println("nextPage: " + nextPage);
 */
%>
<script>
function gotoPage(pageNum){
	var objForm = document.frmPaging;
	objForm.nowPage.value = pageNum;
	objForm.submit(); //form의 action을 실행되도록 하는 기능
}
</script>

<form name="frmPaging" method="get" action="<%=actionPath %>">
	<%
	if(search_type!=null && search_key!=null && !search_type.equals("") && !search_key.equals("")){ %>
		<input type="hidden" name="search_type" value="<%=search_type %>">
		<input type="hidden" name="search_key" value="<%=search_key %>">
	<%}%>

	<input type="hidden" name="nowPage" value="">
	<div align="center">
		<div class="btn-group">
			<!-- 처음 페이지-->
			<a 
				<%if(nowPage!=1){ %>
					onclick="gotoPage('<%=firstPage%>')"
				<%} %>
				class="btn btn-default">
				<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
			</a>
			<!-- 이전 블록 페이지 -->
			<a 
				<%if(nowPage!=1){ %>
					onclick="gotoPage('<%=prevBlockPage%>')"
				<%} %>
				class="btn btn-default">
				<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>
			</a>
			<!-- 이전 페이지 -->
			<a
				<%if(nowPage!=1){ %>
					onclick="gotoPage('<%=prevPage%>')"
				<%} %>
				class="btn btn-default">
				<i class="fa fa-angle-left"></i>
			</a>
			
			<!-- [startPage]...[endPage]-->
			<% for(int i = startPage; i <=endPage; i++) { %>
				<a
					<% if(i!=nowPage){%>
						onclick="gotoPage('<%=i%>')" 
						class="btn btn-default"
					<%}else{ %>
						onclick=null
						style="font-weight: bold"
						class="btn btn-success"
					<%} %>
				><%=i %></a>
			<% }%>
			<!-- 다음 페이지 -->
			<a
				<%if(nowPage!=totalPage){ %>
					onclick="gotoPage('<%=nextPage%>')"
				<%} %>
				class="btn btn-default">
				<i class="fa fa-angle-right"></i>
			</a>
			<!-- 다음 블록 -->
			<a
				<%if(nowPage!=totalPage){ %>
					onclick="gotoPage('<%=nextBlockPage%>')"
					<%} %>
			class="btn btn-default">
				<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
			</a>
			<!-- 마지막 페이지-->
			<a
				<%if(nowPage!=totalPage){ %>
					onclick="gotoPage('<%=lastPage%>')"
				<%} %>	
				class="btn btn-default">
			<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
			</a>
		</div>
	</div>
</form>