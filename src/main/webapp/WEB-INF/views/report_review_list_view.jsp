<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>신고확인 리스트</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
.message_items a{
	color: black;
	text-decoration: none;
}
.page_bar{
	text-align: center;
}
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
 $(function() {
	if(${sessionScope.login == null}||${sessionScope.login==false}||${sessionScope.grade !=2}){alert("잘못된 접근입니다.");history.back();}
});
</script>
</head>
<body>
<c:if test="${sessionScope.grade==2}">
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
<h1>신고내역</h1>
<table class="table table-hover table-bordered">
 <tbody>
 <c:set var="page" value="${sessionScope.page}" scope="page" />
 <c:if test="${requestScope.report == null}">
     <tr><td colspan="3">신고내역이 없습니다</td></tr>
 </c:if>
    <c:forEach var="list" items="${requestScope.report}">
        <tr class="message_items">
           <td><a href="reviewReportDetailView.do?review_no=${list.review_no}&pageNo=${page.currentPage}">신고된 ${list.review_member_id}님의 리뷰</a></td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr class="page_bar">
		<td colspan="4" class="page_bar_items">
			<c:if test="${page.previousPageGroup }">
				<a href="adminReportCheckListView.do?pageNo=${page.startPageOfPageGroup-1}">◀</a>
			</c:if>		
			<c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
           <c:if test="${i==0}">
				<a href="adminReportCheckListView.do?pageNo=1">1</a>					
           </c:if>
		   <c:if test="${i!=0}">
				<a href="adminReportCheckListView.do?pageNo=${i}" id="link${i}">${i}</a>					
		      <script type="text/javascript">
		       if(${page.currentPage}==${i}){$("#link${i}").css("color", "red");}
		      </script>
           </c:if>					
			</c:forEach>
		<c:if test="${page.nextPageGroup }">
			<a href="adminReportCheckListView.do?pageNo=${page.endPageOfPageGroup+1}">▶</a>
		 </c:if>
		</td>
	</tr>
	</tfoot>
</table>
</div>
</div>
</c:if>
</body>
</html>