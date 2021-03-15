<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/notice_pc.css" media="screen and (min-width:768px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		});
	})
	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
			<div class="notice_items_box">
			<h3>공지사항</h3>
	         <table class="table table-bordered">
				 <c:if test="${requestScope.noticeList==null}">
                   <tr><td colspan="4">공지사항이 없습니다</td></tr>
                 </c:if>
			   <c:forEach var="notice" items="${requestScope.noticeList}">
				<tr>
					<td style="width: 5%; text-align: center;">
					 ${notice.notice_no}
				    </td>
				    <td>
				    <a href="noticeDetailView.do?notice_no=${notice.notice_no}&pageNo=${requestScope.page.currentPage}" class="notice_items_link">${notice.notice_title}</a>
				    </td>
				    <td>
				     ${notice.notice_date} 
				    </td>
				</tr>
			   </c:forEach>
			     <tr>
			<tr class="page_bar">
		      <td colspan="4" class="page_bar_items">
			<c:if test="${page.previousPageGroup }">
				<a href="notice.do?pageNo=${page.startPageOfPageGroup-1}">◀</a>
			</c:if>		
			<c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
           <c:if test="${i==0}">
				<a href="notice.do?pageNo=1">1</a>					
           </c:if>
		   <c:if test="${i!=0}">
				<a href="notice.do?pageNo=${i}" id="link${i}">${i}</a>					
		      <script type="text/javascript">
		       if(${page.currentPage}==${i}){$("#link${i}").css("color", "red");}
		      </script>
           </c:if>					
			</c:forEach>
		<c:if test="${page.nextPageGroup }">
			<a href="notice.do?pageNo=${page.endPageOfPageGroup+1}">▶</a>
		 </c:if>
		    </td>
	      </tr>
	  </table>
	 </div>
	</div>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>