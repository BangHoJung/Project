<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/mobile_guide.css" media="screen and (max-width:767px)">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script type="text/javascript">
$(function(){
	$("#random").click(function(){
		alert('추천 메뉴는 ooo입니다');
	})
})
	</script>
</head>
<body>
	<jsp:include page="mobile_header.jsp"></jsp:include>
	<div id="guide_container">
		<h4>Taste Factory는<br>

		빅데이터 기술력을 바탕으로<br>
		
		진짜 맛집, 숨은 맛집을 알려드립니다.
		</h4>
	
		<p>
		Taster Factory는 이용자분들이 편리하게 맛집을 찾을 수 있는 다양한 수단을 제공해드리고 있습니다.<br><br>


		1. 맛집, 지역, 음식 검색은 기본!<br><br>

		방문에 필요한 키워드로 검색해보세요.<br><br>

		빅데이터 분석을 통해 키워드에 맞는 맛집을 추천해드립니다.<br><br>
		
​

		2. 내주변 맛집<br><br>
		
		
		낯선 지역에 가서 뭐 먹을지 고민하지 마세요.<br><br>
		
		
		내 주변의 가볼만한 맛집들을 다이닝코드가 알려드려요.
		</p>
		
		<hr>
		
		<h4>
		여러분의 솔직한 맛집 후기에 대해서<br>

		네이버 페이(1건당 최대 300원)로 보답합니다.
		</h4>
		<p>
		내가 다녀온 맛집의 후기를 남겨주시면 후기 1건당 300 포인트를 적립해드립니다.<br><br>


		적립된 포인트는 네이버페이로 1:1 비율로 전환할 수 있습니다.<br><br>
		
		
		성실하고 꾸준한 활동으로 다코미식가 등급이 되시면, 후기 1건당 450 포인트까지 적립해드립니다.
		</p>
		
		<hr>
		
		<h4>
		믿을 수 있는 상세한 후기를 제공합니다.
		</h4>
		<p>
		본인 인증한 사용자들이 직접 작성한 솔직하고 상세한 맛집 후기들을 확인해보세요. <br>맛집에 대해서 궁금해할 모든 정보를 후기로 제공합니다.
		</p>
		<img src="/img/guide_img.png" class="col-xs-12">
	</div>
	<jsp:include page="mobile_footer.jsp"></jsp:include>
</body>
</html>