<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/register.css">
</head>
<body>
	<%-- <jsp:include page=""></jsp:include> <!-- header --> --%>
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
	
	
	<div id="container">
		<h1>회원가입</h1>
		<form action="register.do" method="post">
			<label>아이디 <input type="text" name="id"></label>	   <br>			
			<label>암호 <input type="password" name="pass"></label>   <br>		
			<label>이름 <input type="text" name="name"></label>	   <br>	
			<label>연락처 <input type="text" name="tel"></label>	   <br>	
			<label>주소 <input type="text" name="addr"></label>	   <br>	
			<label>선호하는 음식 카테고리
				<select>
					<option>한식</option>
					<option>양식</option>
					<option>중식</option>
				</select>
		 	</label>		 										  <br>
			<button type="submit">확인</button>
		</form>
	</div>

	<%-- <jsp:include page=""></jsp:include> <!-- footer --> --%>
		<footer class="clear">
		<ul>
			<li>대충 대표 이름</li>
			<li>전화번호 010-0000-0000</li>
			<li>이메일 asdasdasd@sadasd.com</li>
			
		</ul>
	</footer>
</body>
</html>