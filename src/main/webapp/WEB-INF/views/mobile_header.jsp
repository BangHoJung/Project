<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="" media="screen and (max-width:767px)"> 
  <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
 
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
	.box{
	    height: 30px;
	    background-color: #fa0050;
	}
	.searchbox{
		margin-left:20px;
		margin-top:20px;
		height: 40px;
		padding-left:10px;
		box-sizing: border-box;
		color: gray;
		background-image: url("/img/search.png"); 
		background-size:20px;
		background-repeat: no-repeat;
		background-position:5px;
	    width: 100px;
	}
	.search{
	    width: 150px;
	    height: 30px;
	    margin-top:5px;
	    margin-left:10px;
	    line-height:30px;
	    background-color:none;
	    border:none;
	    font-size: 10px;
	    border-bottom: 1px solid #e8e8e8;
	}
	.searchbox button{
		width : 50px;
		height: 30px;
		box-sizing: border-box;
		border: none;
		color: gray;
		font-size:12px;
	}
	.searchbox button:hover {
		background-color: #fa0050;
		color: white;
		font-weight: bold;
	}
	.img{
	    margin:10px;
		height: 40px;
	}
	.header_p p a{
		display:inline-block;
		margin-top:20px;
		font-size: 12px;
		font-weight: bold;
		color: gray;
		text-decoration: none;
	}
	.header_p p a:hover{
		font-weight: bold;
		color: #fa0050;
	}
	.font{
		text-align: right;
	}
	#random{
		float:right;
	}
	nav ul li{
		list-style-type: none;
		text-align: center;
	}
	nav li a{
		font-size: 12px;
		line-height: 20px;
		text-align: center;
		box-sizing: border-box;
		text-decoration: none;
		color:gray;
	}
	nav{
		background-color:none;
		margin-top:10px;
		height: 20px;
		margin-bottom: 20px;
	}
	nav a:hover{
		font-weight: bold;
		color: #fa0050;
		text-decoration: none;
	}
</style>
</head>
<body>
<div class="container">
	<div class="col-xs-12 box">
		<div id="header_box"></div>
	</div>
		<header>
			<div class="row">
				<div id="login" class="col-xs-3">
					<a href="/mb" id="logo"><img src="/img/mainlogo2.png"  class="img"></a> 
				</div>
			<div class="col-xs-6 searchbox"  >
		        	<input type="text" name="search" placeholder="검색어를 입력하세요." class="search"><button id="search_btn">검색</button>
			</div>
			<div class="right col-xs-2 font header_p">
				<c:if test="${sessionScope.login != null && sessionScope.login == true}">
				<p> <a href="myPageView.do">MyPage</a><br><a href="/logout.do" id="logout" class="logout">로그아웃</a></p>
				</c:if>
				<c:if test="${sessionScope.login == null || sessionScope.login == false}">
				<p><a href="/loginView.do" class="login" >로그인</a>
				<a href="/registerView.do" class="member">회원가입</a></p>
				</c:if>				
			</div>
			</div>
		</header>
		<!--  <button class="right" id="random">#</button>-->
	<nav>
		<ul>
			<li class="col-xs-3"><a href="/mbGuide.do"> 이용안내</a></li>
			<li class="col-xs-3"><a href="/mbIntroduce.do" >업체 소개</a></li>
			<li class="col-xs-3"><a href="/mbNotice.do" >공지사항</a></li>
			<li class="col-xs-3"><a href="/mbQnaView.do" >Q&A</a></li>
		</ul>		
	</nav>
</div>
</body>
</html>