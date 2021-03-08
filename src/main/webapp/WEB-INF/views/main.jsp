<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="../css/main.css" media="screen and (min-width:768px)">
<script type="text/javascript">

	 $(document).ready(function(){
	      $('.slider').bxSlider({
	      auto: true
	      })
	    });
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
		$("#btn_search").click(function() {
			var addr;
			if(${sessionScope.login == null} || ${sessionScope.login == false}) {
				addr = "";
			}
			else {
				var temp = "${sessionScope.address}";
				var temp2 = temp.split("구");
				console.log(temp2);
				addr = temp2[0] + "구";
			}
			location.href="searchDetailView.do?addr="+addr+"&search="+$("input[name='search']").val();
		});
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="main_container">
		<div class="slider">
		    <div><img class="slider_img" src="https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404_960_720.jpg"></div>
		    <div><img class="slider_img" src="https://cdn.pixabay.com/photo/2017/11/16/18/51/kagyana-2955466_960_720.jpg"></div>
		    <div><img class="slider_img" src="https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_960_720.jpg"></div>
  		</div>
		<div id="theme">
			<h4>월간 별점 베스트!</h4> <a href="bestStoreListView.do?type=month_score">더보기</a> <br>
			<div class="figure">
				<c:forEach var="dto" items="${monthScoreList}" begin="0" end="3" >
					<figure>
						<figcaption>
							<a href="storeDetailView.do?store_id=${dto.store_id}"><img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="img"></a>
							<p id="store_name">${dto.store_name}</p>
							<p >${dto.store_category}</p>
							<p >${dto.store_addr}</p>
						</figcaption>
					</figure>
				</c:forEach>
				</div>
			</div>
		<div id="theme">
			<h4>월간 리뷰수 베스트!</h4> <a href="bestStoreListView.do?type=month_review">더보기</a> <br>
			<div class="figure">
				<c:forEach var="dto" items="${monthReviewCountList}" begin="0" end="3">
					<figure>
						<figcaption>
							<a href="storeDetailView.do?store_id=${dto.store_id}"><img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="img"></a>
							<p id="store_name">${dto.store_name}</p>
							<p >${dto.store_category}</p>
							<p >${dto.store_addr}</p>
						</figcaption>
					</figure>
				</c:forEach>
			</div>
		</div>
		<div id="theme">
			<h4>주간 별점 베스트!</h4> <a href="bestStoreListView.do?type=week_score">더보기</a> <br>
			<div class="figure">
				<c:forEach var="dto" items="${weekScoreList}" begin="0" end="3">
					<figure>
						<figcaption>
							<a href="storeDetailView.do?store_id=${dto.store_id}"><img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="img"></a>
							<p id="store_name">${dto.store_name}</p>
							<p >${dto.store_category}</p>
							<p >${dto.store_addr}</p>
						</figcaption>
					</figure>
				</c:forEach>
			</div>
		</div>
		<div id="theme">
			<h4>주간 리뷰수 베스트!</h4> <a href="bestStoreListView.do?type=week_review">더보기</a> <br>
			<div class="figure">
				<c:forEach var="dto" items="${weekReviewCountList}" begin="0" end="3">
					<figure>
						<figcaption>
							<a href="storeDetailView.do?store_id=${dto.store_id}"><img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="img"></a>
							<p id="store_name">${dto.store_name}</p>
							<p >${dto.store_category}</p>
							<p >${dto.store_addr}</p>
						</figcaption>
					</figure>
				</c:forEach>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
