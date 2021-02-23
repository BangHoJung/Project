<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name='viewport' content='width=device-width, initial-scale=1'> -->
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="lib/js/jquery-3.5.1.min.js"></script>
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
<style type="text/css">


</style>
<style type="text/css">
.container{
border: 1px solid black;
}
</style>
</head>
<body>
<form action="mypage.do" method="post">

<div class="top">

<div class="hader">
<h2 class="title">taste factory</h2>
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



<form action="memBer_Update.do" method="post">
		 <span>아이디</span><br><input type="text" name="id" id="id" placeholder="${sessionScope.id }" disabled> <span>아이디는 수정 할수 없습니다</span> <br>
		 <p id="id_form_check"></p> 
		 <span>변경 하실 암호를 입력해주세요</span><br><input type="password" name="pass" id="pass" placeholder="암호는 필수 항목입니다." maxlength="20"><br>
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