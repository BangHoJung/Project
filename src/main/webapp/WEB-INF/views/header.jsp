<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="pc.css" media="screen and (min-width:1024px)">
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
			<a href="#">사이트 이름</a>
			<input type="text" placeholder="찾고싶은 식당이나 지역을 검색하세요.">
			<figure class="right">
				<figcaption> 
					<p><a href="#">로그인</a> | <a href="#">회원가입</a></p>
				</figcaption>
			</figure>
		</div>
	</header>
</body>
</html>