<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 변경하기</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>

 #pass_update_frm{
  margin-top: 20%;
  width: 275px;
  position: relative;
 }
  .container input{
   padding-bottom: 5px;
  }
 .container span{
  display: inline-block;
  margin-right: 10px;
  font-size: 1vw;
 }
 .btn{
  background-color: #FA0050;
  color: white;
  padding: 4px 12px;
  position: absolute;
  right: 0;
 }
</style>
</head>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
	$("#passCheck").keydown(function(e) {
		if(e.keyCode==13){
			$("#btn_pass_update_check").click();
		}
	});
	$("#pass").keyup(function() {
		var length = $("#pass").val().trim().length
		if(length<6){
			$("#new_pass_form_check").css("color", "red");
			$("#new_pass_form_check").html("암호는 6자리 이상 입력해주세요");
		}
		else{
			$("#new_pass_form_check").css("color", "blue");
			$("#new_pass_form_check").html("사용가능한 형식입니다");
		}
	});
	$("#passCheck").keyup(function() {
		var pass = $("#pass").val();
		var passCheck = $("#passCheck").val();
		if(pass == passCheck){
			$("#new_pass_check_form_check").css("color", "blue");
			$("#new_pass_check_form_check").html("비밀번호가 일치합니다");
		}
		else{
			$("#new_pass_check_form_check").css("color", "red");
			$("#new_pass_check_form_check").html("비밀번호가 틀립니다 다시 입력해주세요");
		}
	});	
	$("#btn_pass_update").click(function() {
		if($("#pass").val().trim().length == 0){alert("암호를 입력해주세요");$("#pass").focus();return false;};
		if($("#pass").val().trim().length < 6){alert("암호는 6글자이상 입력해주세요");$("#pass").focus();return false;};
		if(!($("#pass").val()==$("#passCheck").val())){alert("비밀번호 확인은 필수입니다");$("#passCheck").focus();return false;}
		var data =$("#pass_update_frm").serialize();
		$.ajax({
			url : "memberPassUpdateAction.do",
			data : data,
			method : "post",
			success:function(d){
				console.log(d);
				if(d=="true"){
					location.href="logout.do";
				}
				else{
					alert("수정이 실패했습니다");
					location.reload();
				}					
			}
			
		})
	});
});
</script>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
  <form id="pass_update_frm" method="post">
    <input type="hidden" value="${sessionScope.id}" name="id" readonly>
    새 비밀번호&ensp;&ensp;&ensp;<input type="password" name="pass" maxlength="20" id="pass">
    <p id="new_pass_form_check"></p> 
    비밀번호 확인&ensp;<input type="password" name="passCheck" maxlength="20" id="passCheck">
    <p id="new_pass_check_form_check"></p> 
   <button class="btn" type="button" id="btn_pass_update">확인</button>
  </form>
</div>
</div>
</body>
</html>