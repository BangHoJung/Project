<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="ad_list_container">
		<table>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
			</tr>
			<c:if test="${requestScope.list ==null}">
				<script>
					location.href="main.do?pageNo=1";
				</script>
			</c:if>
			<c:forEach var="dto" items="${sessionScope.list }">
				<td>${dto.ad_no}</td>
				<td>${dto.ad_store_id}</td>
			</c:forEach>
			<tr>
			<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="index.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
						end="${pagging.endPageOfPageGroup}">
							<a href="index.do?pageNo=${i }">${ i}</a>
						</c:forEach>
					
						<c:if test="${pagging.nextPageGroup }">
							<a href="index.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
						<a href="boardWriteView.do" class="btn_writer">글쓰기</a>
					</div>
			</tr>
		</table>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>