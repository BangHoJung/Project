<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>공지사항 상세페이지</title>
<link rel="stylesheet" href="../css/notice_detail_view_pc.css" media="screen and (min-width:768px)">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style type="text/css">

</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
	if(${requestScope.Error}){alert("오류가 발생했습니다");history.back();}
	$("#btn_update_notice").click(function() {
 location.href="adminNoticeUpdateView.do?notice_no=${requestScope.notice.notice_no}&pageNo=${requestScope.pageNo}";
	});
	$("#btn_delete").click(function() {
		var data = $("#notice_delete_frm").serialize();
		$.ajax({
			url : "adminDeleteNotice.do",
		    data : data,
		    method : "get",
		    success:function(d){
		    	console.log(d);
		    	if(d=="true"){
		    	 alert("삭제 성공");
		    	 location.href="notice.do?pageNo=${requestScope.pageNo}";	
		    	}
		    	else if(d=="lastItem"){
		    		location.href="notice.do?pageNo=${requestScope.pageNo-1}";	
		    	}
		    	else{
		    		alert("삭제를 실패했습니다");
		    	}
		    		
		    }
		});
	});
	$("#btn_notice_list_view").click(function() {
		history.back();
	});
});
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="notice_detail_container">
		<h3>공지사항</h3>
		<table id="notice_table" class="table">
			<tr>
				<th>제목</th>
				<td>
					${requestScope.notice.notice_title}
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>
					${requestScope.notice.notice_date}
				</td>
			</tr>
			<tr >
				<td colspan="2" id="content">${requestScope.notice.notice_content}</td>
			</tr>
		</table>
		<c:if test="${sessionScope.grade==2}">
		  <button type="button" id="btn_update_notice" class="btn_update_notice">수정하기</button>
		  <form id="notice_delete_frm">
		  <input type="hidden" value="${requestScope.notice.notice_no}"  name="notice_no">
		  <input type="hidden" value="${requestScope.pageNo}"  name="pageNo">
		  <button type="button" id="btn_delete" class="btn_delete_notice">삭제하기</button>
		  </form>
		</c:if>
         <button type="button" id="btn_notice_list_view" class="btn_notice_list_view">목록보기</button>
		</div>
     </div>		
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>