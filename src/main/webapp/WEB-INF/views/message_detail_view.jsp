<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 Detail 페이지</title>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
if(${requestScope.Invalid_access ==true}){alert("잘못된 접근입니다.");history.back();}
$(function () {
	$("#btn_list_view").click(function() {
		location.href="userMessageView.do?pageNo="+${requestScope.pageNo};
	});
});
</script>
</head>
<body>
<hr>
관리자님이 내게 쓴 쪽지<br>
<b>보낸시간</b>&ensp;${requestScope.date}<br>
<hr>
<div style="white-space:pre;"><c:out value="${requestScope.content}" /></div>
<hr>
<button id="btn_list_view">목록보기</button>
</body>
</html>

