<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/store_register.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function getPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						document.getElementById("addr").value = roadAddr;
						var guideTextBox = document.getElementById("guide");
						guideTextBox.style.display = 'block';
					}
				}).open();
	}
</script>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("form").on("submit",function(e) {
			if($("input[name='name']").val().length == 0) {
				alert("식당 이름을 입력하세요");
				e.preventDefault();
				return false;
			}
			else if($("input[name='tel1']").val().length == 0 || $("input[name='tel2']").val().length == 0 || $("input[name='tel3']").val().length == 0) {
				alert("식당 대표번호를 입력하세요");
				e.preventDefault();
				return false;
			}
			else if($("input[name='addr']").val().length == 0) {
				alert("식당 지번주소를 입력하세요");
				e.preventDefault();
				return false;
			}
			else if($("input[name='license']").val().length == 0) {
				alert("사업자등록번호를 입력하세요");
				e.preventDefault();
				return false;
			}
			else if($("input[name='file']").val().length == 0) {
				alert("사업자등록증 파일을 첨부하세요");
				e.preventDefault();
				return false;
			}
			else if($("input[name='photo']").val().length == 0) {
				alert("식당 대표사진을 첨부하세요");
				e.preventDefault();
				return false;
			}
			$.each($("input[name='menu_name']"), function(index,item) {
				if($(item).val() == null || $(item).val() == "") {
					alert("모든 메뉴 이름을 정확히 입력해주세요");
					e.preventDefault();
					return false;
				}
			});
			
			$.each($("input[name='menu_price']"), function(index,item) {
				console.log($(item).val());
				if($(item).val() == null || $(item).val() == "") {
					alert("모든 메뉴 가격을 정확히 입력해주세요");
					e.preventDefault();
					return false;
				}
			});
			
			
		});
		
		$("#plus").click(function() {
			$("#menu_table tbody").children().first().before("<tr><td><input type=\"text\" name=\"menu_name\" placeholder=\"메뉴 이름 입력\" ></td>"
			 + "<td><input type=\"text\" name=\"menu_price\" placeholder=\"메뉴 가격 입력\" ></td>"
			 + "<td><input type=\"file\" name=\"menu_photo\"></td>");
			
		});
		
		$("#minus").click(function() {
			$("#menu_table tbody").children().siblings().first().remove();
		});
		
		$(document).on("change","input[name=\"photo\"]", function() {
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['png','jpg','jpeg','jfif']) == -1) {
		  	     alert("이미지 형식의 파일('png','jpg','jpeg','jfif')만 등록가능합니다");
		  	     $(this).val(""); // input file 파일명을 다시 지워준다.
		  	     return;
		 	  }
		});
		
		
		$(document).on("change","input[name=\"menu_photo\"]", function() {
			var ext = $(this).val().split('.').pop().toLowerCase();
			var name = $(this).val().split('\\').pop().split('.')[0];
			var txt = $(this).parent().siblings().children("input[name='menu_name']").val();
			// if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
			if($.inArray(ext, ['png','jpg','jpeg','jfif']) == -1) {
		  	     alert("이미지 형식의 파일('png','jpg','jpeg','jfif')만 등록가능합니다");
		  	     $(this).val(""); // input file 파일명을 다시 지워준다.
		  	     return;
		 	  }
			if(name != txt) {
				alert("메뉴이름과 동일한 파일명의 이미지를 등록해주세요");
				 $(this).val(""); // input file 파일명을 다시 지워준다.
				 return;
			}
		});
		
		
	});

	
</script>
</head>
<body>

	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
	<div class="body">
		<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
			<form action="storeRegisterAction.do" enctype="multipart/form-data" method="post">
				<h1>식당 정보 등록 페이지</h1>
				<div id="layout">
					<h2>식당 필수 정보</h2>
					<table class="must">
						<tr>
							<th>식당 이름</th>
							<td><input type="text" name="name" placeholder="식당 상호명을 입력해주세요"></td>
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
								<input type="file" name="file">
							</td>
						</tr>
						<tr>
							<th>식당 대표사진</th>
							<td>
								<input type="file" name="photo"><br>
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
									<option value="카테고리">카테고리</option>
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
								</select>
							</td>
						</tr>
					</table>
					<h2>식당 메뉴 정보</h2>
					<%-- <input type="hidden" name="store_id" value="${store_id}"> --%>
					<button id="plus" type="button">메뉴 추가</button> <button id="minus" type="button">메뉴 삭제</button><br>
					<table id="menu_table">
						<thead>
						<tr>
							<th>메뉴 이름(한글)</th>
							<th>메뉴 가격(숫자)</th>
							<th>메뉴 사진</th>
						</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="menu_name" placeholder="메뉴 이름 입력" ></td>
								<td><input type="text" name="menu_price" placeholder="메뉴 가격 입력" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"></td>
								<td><input type="file" name="menu_photo"></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" id="btn_register">식당 등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>