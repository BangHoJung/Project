<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메세지 Detail 페이지</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/message_detail_view_mobile.css" media="screen and (max-width:768px)">
<link rel="stylesheet" href="css/message_detail_view_pc.css" media="screen and (min-width:769px)">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
if(${requestScope.Invalid_access ==true}){alert("잘못된 접근입니다.");history.back();}
$(function () {
	$("#btn_list_view").click(function() {
		location.href="userMessageView.do?pageNo="+${requestScope.pageNo};
	});
	 $("#btn_delete").click(function() {       
	         if(confirm("정보를 삭제하시겠습니까?")==true){
	        	 location.href="deleteMessage.do?checkRow="+${requestScope.message_no};
	         }
		 });
});
</script>
</head>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
<hr>
<b>보낸 사람</b>&ensp;관리자<br>
<b>보낸시간</b>&ensp;${requestScope.date}<br>
<hr>
<div style="white-space:pre-wrap;" class="content_box"><c:out value="${requestScope.content}" /></div>
<hr>
<button type="button" id="btn_list_view" class="btn">목록보기</button>
<button type="button" id="btn_delete" class="btn">삭제하기</button>
</div>
</div>
</body>
</html>

