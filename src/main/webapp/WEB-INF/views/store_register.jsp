<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/store_register.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<h1>사업자 등록</h1>
		<form action="business.do" id="business" name="business">
			<label>이름 <input type="text" name="name"></label>					<br>	
			<label>사업자 등록증 <input type="text" name="license"></label>		<br>			
			<label>상호명 <input type="text" name="store_name"></label>	   		<br>	
			<label>가게 주소 <input type="text" name="store_addr"></label>			<br>	
			<label>영업 시간 <input type="text" name="store_time"></label>			<br>	
			<label>가게 정보 <input type="text" name="store_introduce"></label>			<br>	
			<label>가게 연락처 <input type="text" name="store_tel"></label>			<br>	
			<label>카테고리 <input type="text" name="catagory"></label>			<br>	
			
		</form>
	</div>
</body>
</html>