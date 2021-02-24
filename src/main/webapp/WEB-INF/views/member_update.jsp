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
	var tel = result.split("-");
	
	$("#tel1").val(tel[0]);
	$("#tel2").val(tel[1]);
	$("#tel3").val(tel[2]);
    var categoryResult = $("#category").val();
    var categoryArr=categoryResult.split("#");
    var category="";
    for (var i=0;i< categoryArr.length; i++) {
	    category ="#"+categoryArr[i];
     if(category == $('input:checkbox[id="category1"]').val())
     {$('input:checkbox[id="category1"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category2"]').val())
     {$('input:checkbox[id="category2"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category3"]').val())
     {$('input:checkbox[id="category3"]').attr("checked", true);}  
     if(category == $('input:checkbox[id="category4"]').val())
     {$('input:checkbox[id="category4"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category5"]').val())
     {$('input:checkbox[id="category5"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category6"]').val())
     {$('input:checkbox[id="category6"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category7"]').val())
     {$('input:checkbox[id="category7"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category8"]').val())
     {$('input:checkbox[id="category8"]').attr("checked", true);}
     if(category == $('input:checkbox[id="category9"]').val())
     {$('input:checkbox[id="category9"]').attr("checked", true);}
	}
    var count = $("input:checkbox[name=category]:checked").length;
	if(count==3){$("input:checkbox:not(:checked)").attr("disabled", "disabled");} 
    
    //#양식|#한식|#중식 ---배열에 넣고 하나씩 꺼내오게 # 구분자로 구분 --> "#"+arr[0]=??  value=#??
     

    
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
	$("#btn_update").click(function() {
		event.preventDefault();
		
		if($("#name").val().trim().length == 0){alert("이름을 입력해주세요");$("#name").focus();return false;};
		if($("#tel1").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel1").focus();return false;};
		if($("#tel1").val().trim().length<2){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel1").focus();return false;}
		if($("#tel2").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel2").focus();return false;};
		if($("#tel2").val().trim().length<3){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel2").focus();return false;}
		if($("#tel3").val().trim().length == 0){alert("연락처를 입력해주세요");$("#tel3").focus();return false;};
		if($("#tel3").val().trim().length<4){alert("전화번호 형식에 맞는 연락처를 입력해주세요                     예)031-388-8474 010-1111-1111");$("#tel3").focus();return false;}
		if($("input:checkbox[name=category]:checked").length==0){alert("카테고리는 최소 한개는 선택해야됩니다.");return false;};	
		$("#frm_update").submit();
	});
	$("#btn_cansel").click(function() {		
           location.href="/";
	});
});

</script>
<style type="text/css">
.body{
text-align: left;
margin: 0 auto;


}
.main{

margin: 0 auto;

}
.in{
margin: 0 auto;

padding-left: 37%;

}
.id, .namee, .titletel, .cate {
font-size: 25px;
margin: 2%;
}


.tel1, .tel2, .tel3{
width: 5%;
text-align: center;

}
@media screen and (max-width: 768px){

}
</style>

</head>
<body>
<input type="text" style="display: none;" value="${sessionScope.tel}" id="tel">
<input type="text" style="display: none;" value="${sessionScope.category}" id="category">
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body ">


<jsp:include  page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container main">
<!-- id="frm_update" -->
<form action="memberUpdateAction.do" method="post" id="frm_update" class="in">
		
		 <span class="id" >아이디</span> <br>
		
		<input type="text" name="id" id="id"  value="${sessionScope.id}" readonly>
	
		 <span>아이디는 수정 할수 없습니다</span>
		
		 
		 
		 <p id="pass_form_check"></p> 
		 <span class="namee">이름</span><br><input VALUE="${sessionScope.name}" type="text" name="name" id="name"  oninput="this.value = this.value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');"><br>
	   
	     <p id="name_form_check"></p>
	     <span class="titletel">전화번호</span><br><input class="tel1" type="text" name="tel1" placeholder="연락처는 필수 항목입니다" id="tel1" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
	     <span class="dash">―</span><input class="tel2" type="text" name="tel2" maxlength="4" id="tel2"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><span class="dash">―</span>
	     <input  class="tel3" type="text" name="tel3" id="tel3" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
		
			<p id="tel_form_check"></p>
					
			<span class="cate">변경하실 음식 카테고리</span><br>
				
				<p style="color: #FA0050; margin-top: 1%;"> ※ 카테고리는 최대 3개까지 선택 가능합니다</p>
				<input type="checkbox" name="category" id="category1" value="#한식"><span class="category">한식</span>
				<input type="checkbox" name="category" id="category2" value="#양식"><span class="category">양식</span>
				<input type="checkbox" name="category" id="category3" value="#일식"><span class="category">일식</span>
				<input type="checkbox" name="category" id="category4" value="#중식"><span class="category">중식</span>
				<input type="checkbox" name="category" id="category5" value="#패스트푸드"><span class="category">패스트푸드</span><br>
				<input type="checkbox" name="category" id="category6" value="#찜.탕"><span class="category">찜.탕</span>
				<input type="checkbox" name="category" id="category7" value="#디저트"><span class="category">디저트</span>
				<input type="checkbox" name="category" id="category8" value="#치킨"><span class="category">치킨</span>
				<input type="checkbox" name="category" id="category9" value="#피자"><span class="category">피자</span>
			<br><br><button id="btn_update" class="btn">수정</button>&ensp;<button type="button" id="btn_cansel" class="btn">취소</button>
          
 
 </form>





</div>

</div>
 


</body>
</html>