<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/main.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
	$(function(){
		$("#pop").html($(window).width());
		$(window).resize(function() {
			$("#pop").html($(window).width());
		});		
	});

	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="notice_container">
			<h3>공지사항</h3>
			<table>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				<tr>
					<td><p>[공지] Taste Factory 계정 사칭 주의 안내<br>
					2021년 2월 12일 </p></td>
				</tr>
				
			</table>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>