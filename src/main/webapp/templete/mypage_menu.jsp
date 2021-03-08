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
<c:choose>
<c:when test="${sessionScope.grade == 2}">
<ul>
<li class="list"><a href="adminNoticeWriteView.do">공지사항 작성</a></li>
<li class="list"><a href="AdListView.do">광고 등록 신청 조회</a></li>
<li class="list"><a href="storeCheckListView.do">식당 등록 신청 조회</a></li>
<li class="list"><a href="adminReportCheckListView.do">신고 확인</a></li>
</ul>
</c:when>
<c:when test="${sessionScope.grade == 1 }">
<ul>
<li class="list"> <a href="memberUpdateView.do">회원정보 수정</a> </li>
<li class="list"> <a href="memberPassUpdateCheckView.do">비밀번호 변경하기</a></li>
<li class="list"><a href="storeRegisterView.do">식당 정보 등록</a></li>
<li class="list"> <a href="memberUpdateView.do">회원정보 수정</a> </li>
<li class="list"> <a href="#none">내 식당 정보</a></li>
<li class="list"><a href="AdWriteView.do">광고신청</a></li>
<li class="list"><a href="insertUpdateAddressView.do">나의 주소</a></li>
<li class="list"><a href="userMessageView.do">쪽지함</a></li>
</ul>
</c:when>
<c:otherwise>
<ul>
<li class="list"> <a href="memberUpdateView.do">회원정보 수정</a> </li>
<li class="list"> <a href="memberPassUpdateCheckView.do">비밀번호 변경하기</a></li>
<li class="list"><a href="storeRegisterView.do">식당 정보 등록</a></li>
<li class="list"><a href="#">위시리스트</a></li>
<li class="list"><a href="insertUpdateAddressView.do">나의 주소</a></li>
<li class="list"><a href="userMessageView.do">쪽지함</a></li>
</ul>
</c:otherwise>
</c:choose>
</div>
</body>
</html>