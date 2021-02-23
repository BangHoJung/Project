<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/main.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
	$(function(){
		$("#pop").html($(window).width());
		$(window).resize(function() {
			$("#pop").html($(window).width());
		});		
	});
	 $(document).ready(function(){
	      $('.slider').bxSlider({
	      auto: true
	      })
	    });
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
	})
</script>
</head>
<body>
	<header>
		<div id="login">
			<a href="/" id="logo"><img src="/img/logo2.jpg"></a>
			<div class="search">
			<input type="text" name="search" placeholder="찾고싶은 식당이나 지역을 검색하세요." ><button>검색</button>
			</div>
			<div class="right">
				<c:if test="${sessionScope.login != null && sessionScope.login == true}">
			<p> ${sessionScope.name } 님이 로그인 하셨습니다. | <a href="myPageView.do">마이페이지</a><br>
			<a href="/logout.do">로그아웃</a></p>
			</c:if>
			<c:if test="${sessionScope.login == null || sessionScope.login == false}">
					<p><a href="/loginView.do">로그인</a> | <a href="/registerView.do">회원가입</a></p>
			</c:if>
			</div>
		</div>
	</header>
		<nav>
			<ul>
				<li><a href="/introduce.do">업체 소개</a></li>
				<li><a href="/guide.do">이용안내</a></li>
				<li><a href="/notice.do">공지사항</a></li>
				<li><a href="/qnaView.do">Q&A</a></li>
			</ul>
				<button class="right" id="random">랜덤 메뉴 추천</button>
		</nav>
		
		
		<div class="slider">
    <div><img src="https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_960_720.jpg"></div>
    <div><img src="https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberry-2023404_960_720.jpg"></div>
    <div><img src="https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_960_720.jpg"></div>
  		</div>
  		
		
		<div id="theme">
		<h3>월간 베스트!</h3><br>
		<div class="figure">
		<figure>
			<figcaption>
			figure
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			figure
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			figure
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			figure
			</figcaption>
		</figure>
		</div>
		<h3>주간 베스트!</h3><br>
		<div class="figure">
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		</div>
		<h3>테마</h3><br>
		<div class="figure">
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		<figure>
			<figcaption>
			</figcaption>
		</figure>
		</div>
		</div>
		<footer class="clear">
		<ul>
			<li>대충 대표 이름</li>
			<li>전화번호 010-0000-0000</li>
			<li>이메일 asdasdasd@sadasd.com</li>
			
		</ul>
	</footer>
	
	</body>
</html>
	