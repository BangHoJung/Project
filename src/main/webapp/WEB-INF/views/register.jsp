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
</body>
</html>