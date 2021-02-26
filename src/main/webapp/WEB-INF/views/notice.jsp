<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/nav.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
	})
	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="notice_container">
			<h3>공지사항</h3>
	         <table>
			   <c:forEach var="notice" items="${requestScope.list}">
				<tr>
					<td>
					 ${notice.notice_no}
				    </td>
				    <td>
				    <a href="noticeDetailView.do?notice_no=${notice.notice_no}">${notice.notice_title}</a>
				    </td>
				</tr>
			   </c:forEach>
			</table>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>