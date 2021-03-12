<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/review_register.css" media="screen  and (min-width:768px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(".btn_menu").click( function() {
			console.log($(this).siblings("input").val());
			$("input[name='menu_no']").val($(this).siblings("input").val());
			$("#menu").css("display","inline-block");
			//$(this).html("<span class='glyphicon glyphicon-ok'></span> " + $(this).html());
			$(this).children("span").addClass('glyphicon glyphicon-ok');
			$(this).addClass('btn_menu_select');
			$(this).parent("span").siblings().each( function (index,item) {
				$(item).children().children("span").removeClass('glyphicon glyphicon-ok');
				$(item).children().removeClass('btn_menu_select');
			});
			
		});
		
		var menu = -1;
		$("#menu a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#menu a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#menu a").eq(i).children("span").html("☆");
			}
		});
		$("#menu a").mouseleave(function() {
			for(i=0;i<=menu;i++) {
				$("#menu a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#menu a").eq(i).children("span").html("☆");
			}
		});
		$("#menu a").click(function() {
			menu = $(this).index();
			$("input[name='review_score_menu']").val(menu);
		});
		
		var price = -1;
		$("#price a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#price a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#price a").eq(i).children("span").html("☆");
			}
		});
		$("#price a").mouseleave(function() {
			for(i=0;i<=price;i++) {
				$("#price a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#price a").eq(i).children("span").html("☆");
			}
		});
		$("#price a").click(function() {
			price = $(this).index();
			$("input[name='review_score_price']").val(price);
		});
		
		var service = -1;
		$("#service a").mouseenter(function() {
			for(i=0;i<=$(this).index();i++) {
				$("#service a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#service a").eq(i).children("span").html("☆");
			}
		});
		$("#service a").mouseleave(function() {
			for(i=0;i<=service;i++) {
				$("#service a").eq(i).children("span").html("★");
			}
			for( ; i<5;i++) {
				$("#service a").eq(i).children("span").html("☆");
			}
		});
		$("#service a").click(function() {
			service = $(this).index();
			$("input[name='review_score_service']").val(service);
		});
		
		$("input[name='photo']").change(function(e) {
			var ext = $(this).val().split('.').pop().toLowerCase();
			// if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
			if($.inArray(ext, ['png','jpg','jpeg']) == -1) {
		  	     alert("이미지 형식의 파일('png','jpg','jpeg')만 등록가능합니다");
		  	     $(this).val(""); // input file 파일명을 다시 지워준다.
		  	     return;
		 	  }
		});
		
		$("form").on("submit",function(e) {
			if(menu == -1) {
				alert("메뉴에 대해 평가해주세요");
				e.preventDefault();
			}
			else if(price == -1) {
				alert("가격에 대해 평가해주세요");
				e.preventDefault();
			}
			else if(service == -1) {
				alert("서비스에 대해 평가해주세요");
				e.preventDefault();
			}
			else if($("textarea").val().length == 0) {
				alert("방문 후기에 대해 작성해주세요");
				e.preventDefault();
			}
			else if($("#check").is(":checked") == false) {
				alert("주의사항을 확인해주세요");
				e.preventDefault();
			}
		});
		
	});
</script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<form action="reviewRegisterAction.do" enctype="multipart/form-data" method="post">
		<div class="container">
			<input type="hidden" name="store_id" value="${requestScope.store.store_id }">
			<h1>'${requestScope.store.store_name }' 평가하기</h1>
			<hr>
			<h3>항목별 평점<span class="star">*</span></h3>
			<div class="main">
				<p>평가할 메뉴를 선택하고 평가해주세요</p>
				<c:forEach var="menu" items="${requestScope.menuList }">
				<span>
					<input type="hidden" value="${menu.menu_id}">
					<button type="button" class="btn_menu"><span></span> ${menu.menu_name }</button>
				</span>
				</c:forEach>
				<input type="hidden" name="menu_no">
				<br>
				<div id="menu">
					메뉴 평가 : 
					<span class="a"><c:forEach begin="1" end="5" var="index">
						<a href="#none" ><span >☆</span></a>
					</c:forEach></span>
				</div>
				<input type="hidden" name="review_score_menu">
				<div id="price">
					가격 평가 : 
					<span class="a"><c:forEach begin="1" end="5" var="index">
						<a href="#none" ><span>☆</span></a>
					</c:forEach></span>
				</div>
				<input type="hidden" name="review_score_price">
				<div id="service">
					서비스 평가 : 
					<span class="a"><c:forEach begin="1" end="5" var="index">
						<a href="#none" ><span >☆</span></a>
					</c:forEach></span>
				</div>
				<input type="hidden" name="review_score_service">
			</div>
			<hr>
			<h3>방문 후기 작성</h3>
			<textarea placeholder="음식,서비스,분위기,위생상태 등의 식당 방문 후기를 적어주세요" name="review_content"></textarea>
			<hr>
			<h3>후기 사진 등록</h3>
			<p>직접 촬영한 메뉴,가게 인테리어 등의 사진을 등록해주세요</p>
			<input type="file" name="photo">
			<hr>
			<label><input type="checkbox" id="check"> 주의사항 확인
			</label>
			<p class="warning">의도적인 비방목적,홍보성글 또는 비속어가 들어간 경우 경고조치 될 수 있습니다.</p>
			<hr>
			<div class="center">
				<button type="submit" id="btn_register">후기 등록</button>
			</div>		
		</div>	
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>