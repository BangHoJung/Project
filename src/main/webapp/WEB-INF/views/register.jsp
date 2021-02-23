<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/register_mobile.css" media="screen and (max-width:767px)">
<link rel="stylesheet" href="css/register_pc.css" media="screen and (min-width:768px)">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function getPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						document.getElementById("engAddress").value = data.addressEnglish;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
	function check_Duplication_ID(){
        var count=0;
		var prevID=$("input:text[name=prev_id]").val()
		var id=$("input:text[name=id]").val();
		var data="id="+id;
		$.ajax({
			data: data,
			url: "checkID.do",
			method: "get",
			async:false,
			success:function(d){
				console.log(d);
				alert(d);
				var result=d.toString();
				if(result=="중복된 아이디입니다."){$("#id").val("");}
				$("#prev_id").val(id);
				if(prevID == id){
				count++;
				console.log(count);
				}
				else{
					count=1;
				}	
				$("#btn_check_result").val(count);
			}
		});
	}
	
$(function () {
	$("#btn_check_result").blur();
	$("#prev_id").blur();
	$("#id").keyup(function() {
		var length = $("#id").val().trim().length
		if(length<4 && length > 0){
			$("#id_form_check").css("color", "red");
			$("#id_form_check").html("아이디는 4자리 이상 입력해주세요.");
		}
		else if(length==0){
			$("#id_form_check").css("color", "red");
			$("#id_form_check").html("아이디는 영어와 숫자로만 가능합니다.");
		}
		else{
			$("#id_form_check").css("color", "blue");
			$("#id_form_check").html("사용가능한 형식입니다");
		}
	});
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
		if($("#id").val().trim().length == 0){alert("아이디를 입력해주세요");$("#id").focus();return false;};
		if($("#id").val().trim().length < 4){alert("아이디는 4글자이상 입력해주세요");$("#id").focus();return false;};
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
		if(!(id == prevID)){alert("아이디 중복체크는 필수로 해야됩니다.");return false;}
		var data=$("#frm_register").serialize();
		$.ajax({
			data: data,
			url: "registerAction.do",
			method: "post",
			success:function(d){
				console.log(d);
				var result = d.toString();
				if(result.trim()==""){
					alert("잘못된 접근방법입니다.")
		        	location.href="registerView.do";
				}
				else if(result=="회원가입이 성공했습니다"){
		        	alert(result);
		        	location.href="loginView.do";
		        }
		        else{
		        	alert(result);
		        	location.href="registerView.do";
		        }
				}	
		  });			
	});
	$("#btn_cansel").click(function() {		
           location.href="/";
	});
});
</script>
</head>
<body>
	<div class="container">
		<h1 class="title">Taste Factory</h1>
		<form id="frm_register">
		<span>아이디</span><br><input type="text" name="id" id="id" placeholder="아이디는 필수 항목입니다." maxlength="14" oninput="this.value = this.value.replace(/[^a-zA-Z0-9]/g, '').replace(/(\..*)\./g, '$1');"><input type="button" class="btn" value="아아디 중복체크" onclick="check_Duplication_ID()"><input type="text" style="display:none;" readonly id="btn_check_result" value="0"><input type="text" style="display:none;" readonly id="prev_id" name="prev_id" value="" readonly><br>
		<p id="id_form_check"></p> 
		<span>암호</span><br><input type="password" name="pass" id="pass" placeholder="암호는 필수 항목입니다." maxlength="20"><br>
		<p id="pass_form_check"></p> 
		<span>이름</span><br><input type="text" name="name" id="name" placeholder="이름은 필수 항목입니다." oninput="this.value = this.value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');"><br>
	    <p id="name_form_check"></p>
	     <span>전화번호</span><br><input type="text" name="tel1" placeholder="연락처는 필수 항목입니다" id="tel1" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"><span class="dash">―</span><input type="text" name="tel2" maxlength="4" id="tel2"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><span class="dash">―</span><input type="text" name="tel3" id="tel3" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br>
			<p id="tel_form_check"></p>
			<span>주소</span><br><input type="text" id="postcode" placeholder="우편번호" readonly>
			<input type="button" onclick="getPostcode()"value="우편번호 찾기" class="btn" id="getPost"><br> 
			<input type="text" name="roadAddress" id="roadAddress" class="roadAddress" placeholder="도로명주소" size="60"><br>
			<input type="hidden" id="jibunAddress" placeholder="지번주소" size="60"> 
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" name="detailAddress" id="detailAddress" class="detailAddress" placeholder="상세주소" size="60"><br>
			<input type="hidden" id="extraAddress" placeholder="참고항목"size="60"> 
			<input type="hidden" id="engAddress" placeholder="영문주소" size="60"><br> 
				<b><span>선호하는 음식 카테고리</span></b><br>
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
			<br><br><button type="button" id="btn_register" class="btn">회원가입</button>&ensp;<button type="button" id="btn_cansel" class="btn">취소</button>
		</form>
	</div>
</body>
</html>