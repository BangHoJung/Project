<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>상세 신고내용</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
.btn{
 background-color: #FA0050;
 color: white;
}
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
if(${sessionScope.login == null}||${sessionScope.login==false}||${sessionScope.grade !=2}){alert("잘못된 접근입니다.");history.back();}
if(${requestScope.error==true}){alert("예상치 못한 오류가 발생했습니다.");history.back();}
	$("#btn_list_view").click(function() {
		location.href="adminReportCheckListView.do?pageNo=${requestScope.pageNo}";
	});
	 $("#btn_delete").click(function() {       
	         if(confirm("정보를 삭제하시겠습니까?")==true){
                 var data="review_no=${requestScope.report.review_no}&pageNo=${requestScope.pageNo}&review_member_id=${requestScope.report.review_member_id}";              
	        	 $.ajax({
            	  url : "adminDeleteReportReview.do",
            	  data : data,
            	  method : "get",
            	  success:function(d){
            		  console.log(d);
            		  if(d=="true"){
            			  alert("리뷰 삭제성공");
            			  location.href="adminReportCheckListView.do?pageNo=${requestScope.pageNo}";
            		  }
            		  else if(d=="lastItem"){
            			alert("리뷰 삭제성공");
            			location.href="adminReportCheckListView.do?pageNo=${requestScope.pageNo-1}";
            		  }
            		  else{
            			  alert("리뷰 삭제실패");
            		  }
            			  
            	  }
              });
	         }
		 });
	 $("#btn_cansel").click(function() {
		 if(confirm("신고를 철회하시겠습니까?")==true){
			  var data="review_no=${requestScope.report.review_no}&pageNo=${requestScope.pageNo}&review_store_id=${requestScope.report.review_store_id}";              
	        	 $.ajax({
         	  url : "adminCanselReportReview.do",
         	  data : data,
         	  method : "get",
         	  success:function(d){
         		  console.log(d);
         		  if(d=="true"){
         			  alert("신고내역 처리성공");
         			  location.href="adminReportCheckListView.do?pageNo=${requestScope.pageNo}";
         		  }
         		  else if(d=="lastItem"){
         			alert("신고내역 처리성공");
         			location.href="adminReportCheckListView.do?pageNo=${requestScope.pageNo-1}";
         		  }
         		  else{
         			  alert("신고내역 처리실패");
         		  }
         			  
         	  }
           });
		 }
	 });
});
</script>
</head>
<body>
<c:if test="${sessionScope.grade==2}">
 <jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
<hr>
<b>아이디</b>&ensp;${requestScope.report.review_member_id}<br>
<hr>
<div style="white-space:pre-wrap;" class="content_box">
<img alt="" style="width: 50%" src="review_image_load.do?review_store_id=${requestScope.report.review_store_id}&review_member_id=${requestScope.report.review_member_id}&fileName=${requestScope.report.review_photo}">
<c:out value="${requestScope.report.review_content}"/>
</div>
<hr>
<button type="button" id="btn_list_view" class="btn">목록보기</button>
<button type="button" id="btn_cansel" class="btn">취소하기</button>
<button type="button" id="btn_delete" class="btn">삭제하기</button>
</div>
</div>
</c:if>
</body>
</html>