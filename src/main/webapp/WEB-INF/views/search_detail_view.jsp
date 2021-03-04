<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/search_detail_view.css" media="screen  and (min-width:768px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a").click(function() {
			$(this).children("div").children("span").val();
			console.log($(this).children("div").children("span").html());
			location.href="storeDetailView.do?store_id="+$(this).children("div").children("span").html();
		});
		
		$("button").click(function() {
			
		});
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<c:forEach var="dto" items="${menuList }">
		<label><a href="#none"><div>
			<span>${dto.store_id }</span>
			<img src="image_load.do?writer=${dto.store_id }&fileName=${dto.store_photo}&divide=store"><br>
			<p>${dto.store_id }</p>
			<p>${dto.store_addr }</p>
			<p>조회수 : ${dto.store_count }  
				리뷰수 : <fmt:parseNumber var= "review_count" integerOnly= "true" value= "${dto.review/10} " /> ${review_count }
				리뷰 별점 : <fmt:formatNumber  value="${dto.review%10}" pattern=".0" />
				
			<%-- 리뷰수 : ${dto.review } --%></p>
		</div></a></label>
		<br><hr>
		</c:forEach>
		<button>더보기</button>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>