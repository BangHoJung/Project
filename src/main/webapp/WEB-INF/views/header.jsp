<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="" media="screen and (min-width:768px)">
  <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/css/foundation.min.css" integrity="sha256-ogmFxjqiTMnZhxCqVmcqTvjfe1Y/ec4WaRj/aQPvn+I=" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/foundation-sites@6.6.3/dist/js/foundation.min.js" integrity="sha256-pRF3zifJRA9jXGv++b06qwtSqX1byFQOLjqa2PTEb2o=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
	}
	
	#header_box{
		width:100%;
		height: 60px;
		background-color:#fa0050;
	}
	header {
		height: 60px;
	}
	
	#logo img {
		position:absolute;
		margin-left:30px;
		margin:10px;
		height: 50px;
	}
	#login .search {
		position:absolute;
		margin-left: 250px;
		margin-top: 20px;
		height: 40px;
		padding-left:20px;
		box-sizing: border-box;
		color: gray;
		border: 1px solid #e8e8e8;;
		background-image: url("/img/search.png"); 
		background-size:20px;
		background-repeat: no-repeat;
		background-position:5px;
	}
	
	#login input {
		background-color:none;;
		width: 300px;
		height: 20px;
		box-sizing: border-box;
		border: none;
		margin:10px;
		font-size: 12px;
	}
	
	#login .search button {
		width : 80px;
		height: 40px;
		box-sizing: border-box;
		border: none;
		color: gray;
		font-size:12px;
	}
	#login .search button:hover {
		background-color: #fa0050;
		color: white;
		font-weight: bold;
	}
	#login p {
		margin-top: 25px;
		margin-right:10px;
		font-weight: bold;
		font-size: 12px;
		color: gray;
		display: inline-block;
		text-align: right;
	}
	
	#login a:link, #login a:visited {
		color: gray;
		text-decoration: none;
	}
	#login a:hover{
		font-weight: bold;
		color: #fa0050;
	}
	.clear {
		clear: both;
	}
	.right {
		float: right;
	}
	
	nav {
		background-color:none;
		margin: 30px 0;
		margin-top:10px;
		padding-left:50px;
		height: 20px;
		position: relative;
	}
	
	nav>ul {
		list-style-type: none;
		display: inline-block;
		font-size: 0px;
	}
	
	nav>ul>li {
		display: inline-block;
		padding-left:10px;
	}
	
	nav a:link, nav a:visited {
		width: 100px;
		height: 50px;
		padding: 15px 0px;
		font-size: 12px;
		line-height: 20px;
		text-align: center;
		box-sizing: border-box;
		display: inline-block;
		text-decoration: none;
		color:gray;
	}
	nav a:hover{
		font-weight: bold;
		color: #fa0050;
	}
	nav button {
		width: 50px;
		font-size:12px;
		font-weight:bold;
		color: gray;
		border: none;
		margin-right:10px;
	}
</style>
<script type="text/javascript">
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
	<div class="row">
	<div  class="small-12 columns" id="header_box"></div>
	</div>
	<div class="container header_container">
	<header>
		<div id="login">
			<a href="/" id="logo"><img src="/img/mainlogo2.png"></a>
			<div class="search">
				<input type="text" name="search" placeholder="찾고싶은 식당이나 지역을 검색하세요." ><button id="btn_search">검색</button>
			</div>
			<div class="right">
				<c:if test="${sessionScope.login != null && sessionScope.login == true}">
				<p> ${sessionScope.name } 님이 로그인 하셨습니다. <br>
				<a href="myPageView.do">마이페이지</a> | <a href="/logout.do" id="logout">로그아웃</a></p>
				</c:if>
				<c:if test="${sessionScope.login == null || sessionScope.login == false}">
				<p><a href="/loginView.do">로그인</a> | <a href="/registerView.do">회원가입</a></p>
			</c:if>
			</div>
		</div>
	</header>
	<nav>
		<ul>
			<li><a href="/guide.do">이용안내</a></li>
			<li><a href="/introduce.do">업체 소개</a></li>
			<li><a href="/notice.do">공지사항</a></li>
			<li><a href="/qnaView.do">Q&A</a></li>
		</ul>
		<button class="right" id="random">#</button>
	</nav>
	</div>
</body>
</html>