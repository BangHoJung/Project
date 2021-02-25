<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/review.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
	
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<form action="reviewRegisterAction.do" enctype="multipart/form-data" method="post">
			<input type="hidden" name="store_id" value="${requestScope.store.store_id }">
			<h2>${requestScope.store.store_name }</h2>
			<p>식당에 대한 후기를 작성해주세요.</p>
			<hr>
			<h4>항목별 평점</h4>
			<p>메뉴선택 후 평가</p>
			<c:forEach var="menu" items="${requestScope.menuList }">
				<p>
					<input type="hidden" name="menu_id" value="${menu.menu_id }">
					메뉴 이름 : ${menu.menu_name }
					메뉴 가격 : ${menu.menu_price }
				</p>
			</c:forEach>
			<input type="hidden" name="review_score_menu">
			<p>가격 평가 : </p>
			<input type="hidden" name="review_score_price">
			<p>서비스 평가 : </p>
			<input type="hidden" name="review_score_service">
			<hr>
			<h4>방문 후기 작성</h4>
			<textarea rows="" cols="" placeholder="음식,서비스,분위기,위생상태 등의 식당 방문 후기를 적어주세요">
				
			</textarea>
			<hr>
			<h4>후기 사진 등록</h4>
			<p>직접 촬영한 메뉴,가게 인테리어 등의 사진을 등록해주세요</p>
			<input type="file" name="photo">
			
			<button type="button">후기 등록</button>		
		</form>
	</div>	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>