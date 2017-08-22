<%@page import="member.MemberDao"%>
<%@page import="member.IMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
IMemberDao dao = MemberDao.getInstance();
String command = request.getParameter("command");

String userid = request.getParameter("_userid");
String email = request.getParameter("_email");
String phone = request.getParameter("_phone");
//System.out.println("userid : "+ userid);
System.out.println("email : "+ email);
System.out.println("phone : "+ phone);

if(command.equals("idCheck")){
	boolean loginCheck = true;
	String str = "";
	
	if(userid == null){
		userid = "";
	}
	if(!userid.equals("")){
		loginCheck = dao.idCheck(userid);
	}
	
	if(loginCheck){ // 계정이 존재할 때
		str = "NO";
		out.print(str);
	}else{ // 계정이 존재하지 않을 때
		str = "YES";
		out.print(str);
	}	
}

if(command.equals("emailCheck")){
	boolean emailCheck = true;
	String str = "";
	
	if(email == null){
		email = "";
	}
	if(!email.equals("")){
		emailCheck = dao.emailCheck(email);
	}
	
	if(emailCheck){ // 이메일이 존재할 때
		str = "NO";
		out.print(str);
	}else{ // 이메일이 존재하지 않을 때
		str = "YES";
		out.print(str);
	}	
}

if(command.equals("phoneCheck")){
	boolean phoneCheck = true;
	String str = "";
	
	if(phone == null){
		phone = "";
	}
	if(!phone.equals("")){
		phoneCheck = dao.phoneCheck(phone);
	}
	
	if(phoneCheck){ // 전화번호가 존재할 때
		str = "NO";
		out.print(str);
	}else{ // 전화번호가 존재하지 않을 때
		str = "YES";
		out.print(str);
	}	
}


%>	















