<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>공지사항 수정페이지</title>
<link rel="stylesheet" href="../css/notice_update_view_pc.css" media="screen and (min-width:768px)">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
	if(${requestScope.Error} || ${sessionScope.grade !=2}){alert("오류 또는 잘못된 접근입니다");history.back();}
    $("#btn_notice_update").click(function() {
    	var data= $("#notice_update_frm").serialize();
    	$.ajax({
    		url : "adminNoticeUpdateAction.do",
    		data : data,
    		method : "get",
    		success:function(d){
    			console.log(d);
    			if(d=="true"){
    				alert("수정 성공");
    				location.href="notice.do?pageNo=${requestScope.pageNo}";
    			}
    			else{
    				alert("수정 실패");
    			}	
    		}
    	});
    });

});
</script>
</head>
<body>
<c:if test="${sessionScope.grade==2}">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<div class="notice_update_container">
		<h3>공지사항 수정</h3>
		<form  id="notice_update_frm">
			<input type="hidden" name="notice_no" value="${requestScope.notice.notice_no }">
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><input class="input_size" type="text" name="notice_title" value="${requestScope.notice.notice_title }"></td>
				</tr>
				<tr>
					<th style="white-space: ">내용</th><td><textarea name="notice_content" style="border: none;">${requestScope.notice.notice_content }</textarea></td>
				</tr>
				<tr>
					<td style="text-align: right;" colspan="2">
					    <input  class="btn_notice_cansel" type="button" onclick="history.back();" value="취소">
						<button class="btn_notice_update" type="button" id="btn_notice_update">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
 </div>	
<jsp:include page="footer.jsp"></jsp:include>
</c:if>
</body>
</html>