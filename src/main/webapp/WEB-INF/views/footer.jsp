<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>footer</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	/* @media screen and (max-width:360px){
	} */
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	/* @media screen and (max-width:360px){
	} */
</style>
<link rel="stylesheet" href="pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="main.css" media="screen and (min-width:1024px)">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<header>
		<div id="login">
			<a href="/" id="logo"><img src="https://cdn.pixabay.com/photo/2013/10/07/10/30/eat-191902_960_720.jpg"></a>
			<div class="search">
			<input type="text" name="search" placeholder="찾고싶은 식당이나 지역을 검색하세요." ><button>검색</button>
			</div>
			<div class="right">
				<c:if test="${sessionScope.login != null && sessionScope.login == true}">
			<p> ${sessionScope.name } 님이 로그인 하셨습니다. | <a href="#">마이페이지</a></p>
			</c:if>
			<c:if test="${sessionScope.login == null || sessionScope.login == false}">
					<p><a href="/loginView.do">로그인</a> | <a href="/registerView.do">회원가입</a></p>
			</c:if>
			</div>
		</div>
	</header>
		<nav>
			<ul>
				<li><a href="#">업체 소개</a></li>
				<li><a href="#">이용안내</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="/qnaView.do">Q&A</a></li>
			</ul>
				<button class="right" id="random">랜덤 메뉴 추천</button>
		</nav>
</body>
</html>


