<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/storeCheck.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
	<div class="body">
		<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
			<h1>식당 등록 확인 페이지</h1><br>
			<div>
				<h2>식당 필수 정보</h2>
				<table class="must">
					<tr>
						<th>식당 이름</th>
						<td><p>${dto.store_name }</p></td>
					</tr>
					<tr>
						<th>식당 대표 전화번호</th>
						<td><p>${dto.store_tel }</p></td>
					</tr>
					<tr>
						<th>식당 주소</th>
						<td><p>${dto.store_addr }</p></td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td><p>${dto.store_license }</p></td>
					</tr>
					<tr>
						<th>사업자등록증</th>
						<td><p><a href="file_download.do?writer=${dto.store_id}&fileName=${dto.store_file}">${dto.store_file}</a></p></td>
					</tr>
				</table>
				<h2>식당 상세 정보(선택)</h2>
				<table class="add">
					<tr>
						<th>식당 영업시간</th>
						<td><pre>${dto.store_time }</pre></td>
					</tr>
					<tr>
						<th>식당 소개</th>
						<td><pre>${dto.store_introduce }</pre></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><p>${dto.category_name}</p></td>
					</tr>
				</table>
			</div>
			<a href="storeCheckConfirm.do?store_id=${dto.store_id }">식당 등록 승인</a> 
			<a href="storeCheckReject.do?store_id=${dto.store_id }">식당 등록 거절</a>
		</div>
	</div>
</body>
</html>