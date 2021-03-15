<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name='viewport' content='width=device-width, initial-scale=1'> -->
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage_pc.css" media="screen and (min-width:768px)">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

 
</style>
</head>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
<c:if test="${requestScope.categoryCount==1}">
	<c:if test="${requestScope.fisrtList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.fisrtcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.fisrtList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.fisrtList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
</c:if>
<c:if test="${requestScope.categoryCount==2}">
	<c:if test="${requestScope.fisrtList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.fisrtcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.fisrtList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.fisrtList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
	<c:if test="${requestScope.secondList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.secondcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.secondList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.secondList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
</c:if>
<c:if test="${requestScope.categoryCount==3}">
	<c:if test="${requestScope.fisrtList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.fisrtcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.fisrtList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.fisrtList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
	<c:if test="${requestScope.secondList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.secondcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.secondList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.secondList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
	<c:if test="${requestScope.thirdList[0].store_id !=null}">
	<h3 class="store_items_box_category">${requestScope.thirdcategory}</h3><br>
    <div class="store_items_box">
		<c:forEach var="store" items="${requestScope.thirdList}">
			<figure class="store_item_box">
				<figcaption>
					<a href="storeDetailView.do?store_id=${store.store_id}"><img src="image_load.do?writer=${store.store_id}&fileName=${store.store_photo}&divide=store" class="store_img_items"></a>
					<p id="store_name">${store.store_name}</p>
					<p>${store.store_addr}</p>
				</figcaption>
			</figure>			
		</c:forEach>
	  </div>		
	</c:if>
	<c:if test="${requestScope.thirdList[0].store_id ==null}">
		<p class="store_list_null">카테고리에 맞는 식당이 없습니다</p>
	</c:if>
</c:if>
</div>
</div>
</body>
</html>