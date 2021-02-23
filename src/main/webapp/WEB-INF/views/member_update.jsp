<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="lib/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(function () {
	if(${sessionScope.registerSuccess == false}){alert("회원가입이 실패했습니다");};
	$("#btn_check_result").blur();
	
	var result=$("#tel").val();
	var tel=result.split("-");
	
	$("#tel1").val(tel[0]);
	$("#tel2").val(tel[1]);
	$("#tel3").val(tel[2]);
	
	
    
	$("#pass").keyup(function() {
		var length = $("#pass").val().trim().length
		if(length<6){
			$("#pass_form_check").css("color", "red");
			$("#pass_form_check").html("암호는 6자리 이상 입력해주세요");
		}
		else{
			$("#pass_form_check").css("color", "blue");
			$("#pass_form_check").html("사용가능한 형식입니다");
		}
	});
	$("#tel1").keyup(function() {
		var length = $("#tel1").val().trim().length
		if(length<2){
			$("#tel_form_check").css("color", "red");
			$("#tel_form_check").html("잘못된 형식입니다.<br>예) 02-333-1111, 010-1111-1234 , 0507-1111-1111");
		}
		else{
			$("#tel_form_check").css("color", "blue");
			$("#tel_form_check").html("사용가능한 형식입니다");
		}
	});
	$("#tel2").keyup(function() {
		var length = $("#tel2").val().trim().length
		if(length<3){
			$("#tel_form_check").css("color", "red");
			$("#tel_form_check").html("잘못된 형식입니다.<br>예) 02-333-1111, 010-1111-1234 , 0507-1111-1111");
		}
		else{
			$("#tel_form_check").css("color", "blue");
			$("#tel_form_check").html("사용가능한 형식입니다");
		}
	});
	$("#tel3").keyup(function() {
		var length = $("#tel3").val().trim().length
		if(length<4){
			$("#tel_form_check").css("color", "red");
			$("#tel_form_check").html("잘못된 형식입니다.<br>예) 02-333-1111, 010-1111-1234 , 0507-1111-1111");
		}
		else{
			$("#tel_form_check").css("color", "blue");
			$("#tel_form_check").html("사용가능한 형식입니다");
		}
	});
	$("#name").keyup(function() {
		var length = $("#name").val().trim().length
		if(length==0){
			$("#name_form_check").css("color", "red");
			$("#name_form_check").html("한글로 입력해주세요");
		}
		else{
			$("#name_form_check").html("");
		}
	});		
	$("input:checkbox[name=category]").click(function() {
   var count = $("input:checkbox[name=category]:checked").length;
		if(count==3){
          $("input:checkbox:not(:checked)").attr("disabled", "disabled");
         }else {
           $("input[name=category]:checkbox").removeAttr("disabled");
          }
	});	
	$("#btn_register").click(function() {
	 var prevID=$("input:text[name=prev_id]").val()
	 var id=$("input:text[name=id]").val();
		event.preventDefault();

		if($("#pass").val().trim().length == 0){alert("암호를 입력해주세요");$("#pass").focus();return false;};
		if($("#pass").val().trim().length < 6){alert("암호는 6글자이상 입력해주세요");$("#pass").focus();return false;};
		if($("#name").val().trim().length == 0){alert("이름을 입력해주세요");$("#name").focus();return false;};
		if($("#tel1").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel1").focus();return false;};
		if($("#tel1").val().trim().length<2){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel1").focus();return false;}
		if($("#tel2").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel2").focus();return false;};
		if($("#tel2").val().trim().length<3){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel2").focus();return false;}
		if($("#tel3").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel3").focus();return false;};
		if($("#tel3").val().trim().length<4){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel3").focus();return false;}
		if($("#postcode").val().length == 0){alert("주소는 필수항목입니다.");$("#getPost").click();return false;};
		if($("input:checkbox[name=category]:checked").length==0){alert("카테고리는 최소 한개는 선택해야됩니다.");return false;};	
		$("#frm_register").submit();
	});
	$("#btn_cansel").click(function() {		
           location.href="/";
	});
});

</script>
<style type="text/css">


</style>
<style type="text/css">
.container{
border: 1px solid black;
}
</style>
</head>
<body>
<input type="text" style="display: none;" id="tel" value="${sessionScope.tel}">

<form action="mypage.do" method="post">

<div class="top">

<div class="hader">
<h2 class="title"> <a href="/" class="a" style=" color: white;">taste factory</a></h2>

<div class="locomotion"> <p class="logout"> <a href="logout.do">로그아웃</a></p></div>
</div>

<div  class="total">
<div class="profile">
<img alt="" src="img/login.png" class="loginimg">
<div class="fosizs">
<p class="name">닉네임</p> 
<p class="grade">Lv.등급</p>
<p class="Balance">다음등급까지 14.222point남으셨습니다</p>
</div>
</div>

<div class="pointtotal">
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
  <p> 적립금</p>
 </div>
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
 <p> 적립금</p>
 </div>
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
 <p> 적립금</p>
 </div>
 </div>
</div>
</div>

<div class="body">
<div class="menulist">
<ul>
<li class="list"> <a href="#">회원정보 수정</a> </li>
<li class="list"><a href="#">1:1문의 하기</a></li>
<li class="list"><a href="#">업체 정보 등록</a></li>
<li class="list"><a href="#">공지사항</a></li>
<li class="list"><a href="#">위키리스트</a></li>
<li class="list"><a href="#">나의 리뷰</a></li>
<li class="list"><a href="#">쪽지함</a></li>
</ul>
</div>


<div class="container">
<div class="row"> 
<div class="col-xs-12">
<h3 class="maintitle"> 회원 정보 수정  </h3>
<hr>
</div>

<form action="memberUpdateView.do" method="post">
		 <span>아이디</span><br><input type="text" name="id" id="id" placeholder="${sessionScope.id}" disabled> <span>아이디는 수정 할수 없습니다</span> <br>
		 <p id="id_form_check"></p> 
		 <span>암호 입력</span><br><input type="password" name="pass" id="pass" placeholder="변경 할 비밀번호" maxlength="20"><br>
		 <p id="pass_form_check"></p> 
		 <span>이름</span><br><input VALUE="${sessionScope.name}" type="text" name="name" id="name"  oninput="this.value = this.value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');"><br>
	     <p id="name_form_check"></p>
	     <span>전화번호</span><br><input type="text" name="tel1" placeholder="연락처는 필수 항목입니다" id="tel1" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
	     <span class="dash">―</span><input type="text" name="tel2" maxlength="4" id="tel2"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><span class="dash">―</span>
	     <input type="text" name="tel3" id="tel3" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
			<p id="tel_form_check"></p>
					
				<b><span>변경하실 음식 카테고리</span></b><br>
				
				 ※ 카테고리는 최대 3개까지 선택 가능합니다<br><br>
				<input type="checkbox" name="category" value="#한식"><span class="category">한식</span>
				<input type="checkbox" name="category" value="#양식"><span class="category">양식</span>
				<input type="checkbox" name="category" value="#일식"><span class="category">일식</span>
				<input type="checkbox" name="category" value="#중식"><span class="category">중식</span>
				<input type="checkbox" name="category" value="#패스트푸드"><span class="category">패스트푸드</span><br>
				<input type="checkbox" name="category" value="#찜.탕"><span class="category">찜.탕</span>
				<input type="checkbox" name="category" value="#디저트"><span class="category">디저트</span>
				<input type="checkbox" name="category" value="#치킨"><span class="category">치킨</span>
				<input type="checkbox" name="category" value="#피자"><span class="category">피자</span>
			<br><br><button id="btn_register" class="btn">수정</button>&ensp;<button type="button" id="btn_cansel" class="btn">취소</button>
		</form>





</div>
</div>
</div>
 


 </form>
</body>
</html>