<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 확인하기</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
 @media (max-width: 414px){
  .container input{
   width: 150px;
   padding-bottom: 5px;
    }
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
 }
 #pass_update_check_frm{
  margin-top: 20%;
 }
 
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
	$("#pass").keydown(function(e) {
		if(e.keyCode==13){
			$("#btn_pass_update_check").click();
		}
	});
	$("#btn_pass_update_check").click(function() {
		var data =$("#pass_update_check_frm").serialize();
		$.ajax({
			url : "memberPassUpdateCheckAction.do",
			data : data,
			method : "post",
			success:function(d){
				console.log(d);
				if(d=="true"){
					location.href="memberPassUpdateView.do";
				}
				else{
					alert("비밀번호가 틀렸습니다 다시 확인해주세요.");
					location.reload();
				}					
			}
			
		})
	});
});
</script>
</head>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
  <form id="pass_update_check_frm" method="post">
    <input type="hidden" value="${sessionScope.id}" name="id" readonly>
    <span>현재 비밀번호</span><input type="password" name="pass" maxlength="20"><button class="btn" type="button" id="btn_pass_update_check">확인</button>
  </form>
</div>
</div>
</body>
</html>