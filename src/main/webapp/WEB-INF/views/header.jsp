<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	body {
		width: 1000px;
		margin: 0 auto;
		padding:0;
	}
	header {
		width: 1000px;
		height: 80px;
		position: relative;
	}
	
	#login .search {
		position: absolute;
		margin-left: 200px;
		margin-top: 20px;
		padding: 10px;
		border: 1px solid #fa0050;
		border-radius: 20px;
	}
	
	#login input {
		width: 300px;
		height: 20px;
		box-sizing: border-box;
		border: none;
	}
	
	#login .search button {
		margin-left: 5px; width : 50px;
		height: 20px;
		box-sizing: border-box;
		width: 50px;
		border: none;
		background-color: white;
		color: gray;
		font-weight: bold;
	}
	
	#logo img {
		margin-top:5px;
		width: 100px ;
		height: 70px;
		float: left;
	}
	
	#login p {
		margin-top: 40px;
		font-weight: bold;
		font-size: 12px;
		color: gray;
	}
	
	#login a:link, #login a:visited {
		color: gray;
		text-decoration: none;
	}
	
	.clear {
		clear: both;
	}
	
	.right {
		float: right;
	}
	
	nav {
		background-color:#fa0050;
		margin-bottom: 20px;
		height: 50px;
	}
	
	nav>ul {
		list-style-type: none;
		display: inline-block;
		font-size: 0px;
	}
	
	nav>ul>li {
		display: inline-block;
	}
	
	nav a:link, nav a:visited {
		width: 100px;
		height: 50px;
		padding: 15px 0px;
		font-size: 15px;
		line-height: 20px;
		text-align: center;
		box-sizing: border-box;
		display: inline-block;
		text-decoration: none;
		color:white;
	}
	
	nav button {
		width: 100px;
		margin-right:10px;
		font-size:15px;
		font-weight:bold;
		height: 50px;
		background-color: #fa0050;
		color: white;
		border: none;
	}
	
		margin:0;
		padding:0;
	}
</style>
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
			<li><a href="/guide.do">이용안내</a></li>
			<li><a href="/introduce.do">업체 소개</a></li>
			<li><a href="/notice.do">공지사항</a></li>
			<li><a href="/qnaView.do">Q&A</a></li>
		</ul>
		<button class="right" id="random">랜덤 메뉴 추천</button>
	</nav>
</body>
</html>