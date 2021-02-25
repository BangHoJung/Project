<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reviewRegister.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".btn_menu").click( function() {
			console.log($(this).val());
			$("#menu").attr("visibility","visible");
		});
		
		var menu = -1;
		$("#menu a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#menu a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#menu a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#menu a").mouseleave(function() {
			for(i=0;i<=menu;i++) {
				$("#menu a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#menu a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#menu a").click(function() {
			menu = $(this).index();
			$("input[name='review_score_menu']").val(menu);
		});
		
		var price = -1;
		$("#price a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#price a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#price a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#price a").mouseleave(function() {
			for(i=0;i<=price;i++) {
				$("#price a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#price a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#price a").click(function() {
			price = $(this).index();
			$("input[name='review_score_price']").val(price);
		});
		
		var service = -1;
		$("#service a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#service a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#service a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#service a").mouseleave(function() {
			for(i=0;i<=service;i++) {
				$("#service a").eq(i).children("img").css("background-color","white");
			}
			for( ; i<5;i++) {
				$("#service a").eq(i).children("img").css("background-color","black");
			}
		});
		$("#service a").click(function() {
			service = $(this).index();
			$("input[name='review_score_service']").val(service);
		});
		
	});
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
			<p>평가할 메뉴를 선택해주세요</p>
			<c:forEach var="menu" items="${requestScope.menuList }">
				<input type="hidden" name="menu_id" value="${menu.menu_id }">
				<button type="button" class="btn_menu">${menu.menu_name }</button>
			</c:forEach>
			<br><br>
			<p id="menu">
				메뉴 평가 : 
				<span><c:forEach begin="1" end="5" var="index">
					<a href="#none" ><img src="/img/starcheck.png"></a>
				</c:forEach></span>
			</p>
			<input type="hidden" name="review_score_menu">
			<p id="price">
				가격 평가 : 
				<span><c:forEach begin="1" end="5" var="index">
					<a href="#none"><img src="/img/starcheck.png"></a>
				</c:forEach></span>
			</p>
			<input type="hidden" name="review_score_price">
			<p id="service">
				서비스 평가 : 
				<span><c:forEach begin="1" end="5" var="index">
					<a href="#none"><img src="/img/starcheck.png"></a>
				</c:forEach></span>
			</p>
			<input type="hidden" name="review_score_service">
			<hr>
			<h4>방문 후기 작성</h4>
			<textarea rows="" cols="" placeholder="음식,서비스,분위기,위생상태 등의 식당 방문 후기를 적어주세요">
				
			</textarea>
			<hr>
			<h4>후기 사진 등록</h4>
			<p>직접 촬영한 메뉴,가게 인테리어 등의 사진을 등록해주세요</p>
			<input type="file" name="photo">
			
			<button type="submit">후기 등록</button>		
		</form>
	</div>	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>