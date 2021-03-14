<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>위시리스트</title>
<link rel="stylesheet" href="/css/wishlist_view.css" media="screen  and (min-width:768px)">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
 @media (max-width: 414px){
  .container input{
   width: 150px;
   padding-bottom: 5px;
    }
  }
  .container input{
   padding-bottom: 5px;
  }
 .container span{
  display: inline-block;
  margin-right: 10px;
  font-size: 1vw;
 }
 .btn{
  background-color: #FA0050;
  color: white;
  padding: 4px 12px;
 }
 #pass_update_check_frm{
  margin-top: 20%;
 }
 
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
	var nextPage = 2;
	$(function() {
		("#more").click(function() {
			var data = "nextPage="+nextPage;
			$.ajax({
				url : "wishListNextList.do",
				data : data,
				method : 'get',
				success : function(d) {
					var json = JSON.parse(d);
					console.log(json);
					var list = json.list;
					nextPage = json.nextPage;
					if(nextPage=="0") {
						$("#more").css("display","none");
					}
					var result="";
					for(i=0;i<list.length;i++) {
						result += "<a href='storeDetailView.do?store_id="+list[i].store_id+"'>";
						result += "<img src='image_load.do?writer="+list[i].store_id+"&fileName="+list[i].store_photo+"&divide=store'><br>";
						result += "<div class='search_store_detail'>";
						result += "<p id='result_name'>"+list[i].store_name+"</p>";
						result += "<p id='result_addr'>"+list[i].store_addr+"</p><p id='result_addr'>&nbsp|&nbsp"+list[i].store_time+"</p>";
						result += "<p id='result_intro'>"+list[i].store_introduce+"</p>";
						result += "<p>조회수 : "+list[i].store_count+" ";
						result += "리뷰수 : "+(list[i].review/10).toFixed(0)+" ";
						result += "리뷰 별점 : "+(list[i].review%10).toFixed(1);
						result += "<p id='result_category'>"+list[i].store_category+"</p></div></a><hr>";
					}
					$(".wish_result").html(result);
				}
			});
			
		});
	});
</script>
</head>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
	<div class="wish_detail">
		<div class="wish_result">
			<c:forEach var="dto" items="${requestScope.list }">
				<a href="storeDetailView.do?store_id=${dto.store_id }" class="wish">
					<img src="image_load.do?writer=${dto.store_id }&fileName=${dto.store_photo}&divide=store"><br>
					<div class="search_store_detail">
					<p id="result_name">${dto.store_name }</p>
					<p id="result_addr">${dto.store_addr }</p><p id="result_addr">&nbsp|&nbsp${dto.store_time}</p>
					<p id="result_intro">${dto.store_introduce }</p>
					<p>조회수 : ${dto.store_count }  
						리뷰수 : <fmt:parseNumber var= "review_count" integerOnly= "true" value= "${dto.review/10} " /> ${review_count }
						리뷰 별점 : <fmt:formatNumber  value="${dto.review%10}" pattern=".0" />
					<p id="result_category">${dto.store_category}</p>
					</div>
				</a>
				<hr>
			</c:forEach>
			<button id="more">더보기</button>
		</div>
	</div>
  
 </div>
</div>
</body>
</html>