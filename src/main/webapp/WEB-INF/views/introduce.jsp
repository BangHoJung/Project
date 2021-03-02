<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/nav.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
$(function(){
	$("#random").click(function(){
		alert('추천 메뉴는 ooo입니다');
	})
})
</script>
<style type="text/css">
	#introduce_img{
		width: 1000px;
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<img id="introduce_img" alt="" src="/img/introduce_img.jpg">
	<h3 id="introduce_title">Taste Factory를 소개 합니다!</h3><br>
	<div class="introduce_container">
		<p>
			Taste Factory는	빅데이터 기술력을 바탕으로 진짜 맛집, 숨은 맛집을 알려드립니다.<br>
			<br>
			'미식'이란 공통 주제로 모인 사람들의 네트워크가 빅데이터 기술력과 결합하여,<br><br>
			 공신력 있고, 특별한 맛집 정보를 제공합니다.<br><br>
			 이제 낯선 지역에 가서 뭐 먹을지 고민하지 마세요.<br><br>
			내 주변의 가볼만한 맛집들을 Taste Factory가 알려드려요.<br><br>
			 당신이 기대하는 가장 정확하고 신뢰하는 맛집을 지금 Taste Factory에서 확인하세요!!
		</p>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>