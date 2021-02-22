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

	<div class="container">
		<h1>식당 정보 등록 페이지</h1>
		<form action="storeRegisterAction.do" enctype="multipart/form-data" method="post">
			<h2>식당 필수 정보</h2>
			<div class="must">
				<table>
					<tr>
						<th>식당 이름</th>
						<td><input type="text" name="name" placeholder="식당 상호명을 입력해주세요"></td>
					</tr>
					<tr>
						<th>식당 대표 전화번호</th>
						<td>
							<input type="text" name="tel1" class="tel"> - 
							<input type="text" name="tel2" class="tel"> -
							<input type="text" name="tel3" class="tel">
						</td>
					</tr>
					<tr>
						<th>식당 주소</th>
						<td><input type="text" name="addr" placeholder="식당 지번주소를 입력해주세요"></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td><input type="text" name="license" placeholder="사업자등록번호를 입력해주세요"></td>
					</tr>
					<tr>
						<th>사업자등록증 첨부</th>
						<td>
							<input type="file" name="file" value="파일 선택">
						</td>
					</tr>
				</table>
			</div>
			<h2>식당 상세 정보(선택)</h2>
			<div class="add">
				<table>
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
			</div>
			
			<button type="submit" id="btn_register">식당 등록</button>
			
		</form>
	</div>
</body>
</html>