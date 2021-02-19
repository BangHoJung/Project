<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../css/pc.css" media="screen and (min-width:1024px)">
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

</script>
</head>
<body>
	<header>
		<div id="login">
			<a href="main" id="logo"><img src="https://cdn.pixabay.com/photo/2013/10/07/10/30/eat-191902_960_720.jpg"></a>
			<input type="text" placeholder="찾고싶은 식당이나 지역을 검색하세요." >
			<div class="right">
					<p><a href="login">로그인</a> | <a href="register">회원가입</a></p>
			</div>
		</div>
	</header>
		<nav>
			<ul>
				<li><a href="#">업체 소개</a></li>
				<li><a href="#">이용안내</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">Q&A</a></li>
			</ul>
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
	