<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정페이지</title>
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
<style>
	.notice_update_container h3{
		color: black;
		width: 800px;
		margin-bottom:20px;
		font-size: 20px;
		font-weight: bold;
	}
	.notice_update_container table{
		width: 600px;
		border: 1px solid #e8e8e8;
		margin: 0 auto;
	}
	.notice_update_container{
		width:800px;
		margin:20px auto;
		border-collapse: collapse;
		font-size: 12px;
	}
	.notice_update_container button{
		width: 50px;
		height: 30px;
	}
	.notice_update_container th{
		width:100px;
		border-collapse: collapse;
		font-weight: bold;
	}
	.notice_update_container tr{
		margin: 20px;
		border-collapse: collapse;
		height: 50px;
	}
	.notice_update_container td{
		width:500px;
		border-collapse: collapse;
	}
	.notice_update_container textarea{
		width:400px;
		height:100px;
		resize: none;		
		border: 1px solid gray;
	}
	.notice_update_container .input_size{
		border:none;
		width:400px;
		height: 30px;
		border-bottom: 1px solid gray;
	}
 
</style>
</head>
<body>
<c:if test="${sessionScope.grade==2}">
<jsp:include page="header.jsp"></jsp:include>
	<div class="notice_update_container">
		<h3>공지사항 수정</h3>
		<form  id="notice_update_frm">
			<input type="hidden" name="notice_no" value="${requestScope.notice.notice_no }">
			<table>
				<tr>
					<th>제목</th>
					<td><input class="input_size" type="text" name="notice_title" value="${requestScope.notice.notice_title }"></td>
				</tr>
				<tr>
					<th style="white-space: ">내용</th><td><textarea name="notice_content" >${requestScope.notice.notice_content }</textarea></td>
				</tr>
				<tr>
				    <td>
				    </td>
					<td style="text-align: right;">
					    <input  type="button" onclick="history.back();" value="취소">
						<button class="btn" type="button" id="btn_notice_update">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</c:if>
</body>
</html>