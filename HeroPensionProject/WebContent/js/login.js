$(document).ready(function(){	
	var user_id = $.cookie("user_id");
	if(user_id != null){
		$("#_userid").val(user_id);
		$("#_chk_save_id").attr("checked", "checked");
	}

	$("#_btnLogin").click(function(){
		if($("#_userid").val()==""){
			alert("아이디를 입력해주십시오");
			$("#_userid").focus();
		}else if($("#_pwd").val()==""){
			alert("비밀번호를 입력해주십시오");
			$("#_pwd").focus();
		}else{
			if($("#_chk_save_id").is(":checked")){	
				$.cookie("user_id", $("#_userid").val(), {path:"/", expires:365});
			}else{	$.cookie("user_id", null, {path:"/", expires:-1});}
			$("#_loginForm").attr("action", "./memberController.jsp").submit();
		}
	});
	
	$("#_userid").keypress(function(event){
		if(event.which =='13'){
			event.preventDefault();
			$("#_pwd").focus();
		}
	});
	
	$("#_pwd").keypress(function(event){
		if(event.which =='13'){
			event.preventDefault();
			$("#_btnLogin").focus();
		}
	});
	
	$("#_chk_save_id").click(function(){
		if($(this).is(":checked")){	
			$.cookie("user_id", $("#_userid").val(), {path:"/", expires:365});
		}else{	$.cookie("user_id", null, {path:"/", expires:-1});}
	});
});