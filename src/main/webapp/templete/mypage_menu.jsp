<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 메뉴</title>
<style type="text/css">
@media (max-width:768px){
 .menulist{
	display: none;
}
}
.list{
width: 200px;
height: 60px;
list-style-type: none;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
font-size: 150%;
}
.menulist{
float: left;
}
.maintitle{

margin: 0px;
margin-bottom: 1%;
}

 .list > a{
  color: black;
 }
 .list > a:hover{
 color: gray;
 text-decoration: none;
 }
.see{
float:right;
}
.see > a{
	color: black;
}
.see > a:hover {
	text-decoration: none;
	color: gray;
}
.menulist > ul{
	margin: 0px;
	padding: 0px;
}
.body{
	display: flex;
	justify-content: space-around;
	margin-top: 2%;
}
</style>
</head>
<body>
<div class="menulist">
<ul>
<li class="list"> <a href="#">회원정보 수정</a> </li>
<li class="list"><a href="#">1:1문의 하기</a></li>
<c:choose>
	<c:when test="${sessionScope.grade == 1}">
		<li class="list"><a href="storeRegisterView.do">식당 정보 등록</a></li>
	</c:when>
	<c:otherwise>
		<li class="list"><a href="storeCheckListView.do">식당 등록 신청 조회</a></li>
	</c:otherwise>
</c:choose>
<li class="list"><a href="#">공지사항</a></li>
<li class="list"><a href="#">위키리스트</a></li>
<li class="list"><a href="#">나의 리뷰</a></li>
<li class="list"><a href="insertUpdateAddressView.do">나의 주소</a></li>
<li class="list"><a href="userMessageView.do">쪽지함</a></li>
</ul>
</div>
</body>
</html>