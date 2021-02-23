<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="ad_list_container">
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="dto" items="${sessionScope.list }">
				<td>${dto.ad_no}</td>
				<td><a href="AdDetailView.do?ad=${dto.ad_no}"> ${dto.ad_title}</a></td>
				<td>${dto.ad_store_id}</td>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>