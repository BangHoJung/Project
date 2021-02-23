<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/storeRegister.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						//document.getElementById('postcode').value = data.zonecode;
						//document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("addr").value = data.jibunAddress;
						var guideTextBox = document.getElementById("guide");
						guideTextBox.style.display = 'block';
					}
				}).open();
	}
</script>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn_register").click(function() {
			if($("input[name='name']").val().length == 0) {
				alert("식당 상호명을 입력하세요");
				return false;
			}
			else if($("input[name='tel']").val().length == 0) {
				alert("식당 대표번호를 입력하세요");
				return false;
			}
			else if($("input[name='addr']").val().length == 0) {
				alert("식당 지번주소를 입력하세요");
				return false;
			}
			else if($("input[name='license']").val().length == 0) {
				alert("사업자등록번호를 입력하세요");
				return false;
			}
			
		});
	});
</script>
</head>
<body>

	<div id="container">
		<h1>식당 정보 등록 페이지</h1>
		<div>
			<form action="storeRegisterAction.do" enctype="multipart/form-data" method="post">
				<h2>식당 필수 정보</h2>
				<table class="must">
					<tr>
						<th>식당 이름</th>
						<td><input type="text" name="name" placeholder="식당 상호명을 입력해주세요" oninput="this.value = this.value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');"></td>
					</tr>
					<tr>
						<th>식당 대표 전화번호</th>
						<td>
							<input type="text" name="tel1" class="tel" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> - 
							<input type="text" name="tel2" class="tel" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> -
							<input type="text" name="tel3" class="tel" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
						</td>
					</tr>
					<tr>
						<th>식당 주소</th>
						<td>
							<!-- <input type="text" name="addr" placeholder="식당 지번주소를 입력해주세요"> -->
							<input type="button" onclick="getPostcode()" value="주소 찾기" id="getPost"><br>
							<input type="text" name="addr" id="addr" readonly size="60" placeholder="지번주소">
							<span id="guide" style="color: #999; display: none"></span> 
						</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td><input type="text" name="license" placeholder="사업자등록번호를 입력해주세요" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"></td>
					</tr>
					<tr>
						<th>사업자등록증 첨부</th>
						<td>
							<input type="file" name="file" value="파일 선택">
						</td>
					</tr>
				</table>
				<h2>식당 상세 정보(선택)</h2>
				<table class="add">
					<tr>
						<th>식당 영업시간</th>
						<td><textarea rows="" cols="" name="time" placeholder="식당 영업시간을 입력해주세요"></textarea></td>
					</tr>
					<tr>
						<th>식당 소개</th>
						<td><textarea rows="" cols="" name="introduce" placeholder="식당 소개글을 입력해주세요"></textarea></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category">
								<option value="0">카테고리</option>
								<option value="1">한식</option>
								<option value="2">중식</option>
								<option value="3">일식</option>
							</select>
						</td>
					</tr>
				</table>
				<button type="submit" id="btn_register">식당 등록</button>
			</form>
		</div>
	</div>
</body>
</html>