<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/ad_list_view.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

	<c:if test="${sessionScope.login == null  || sessionScope.grade != 2 }">		
				<script>
					alert("권한이 없습니다.");
					location.href="/";
				</script>
	</c:if>
	
	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>

	
	<div class="body">
	<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
		<table>
			<tr>
				<th>글번호</th>
				<th>신청식당</th>
				<th>내용</th>
				<th>승인여부</th>
			</tr>
	<!--		<c:if test="${requestScope.list ==null}">
					<script>
						location.href="AdListView.do?pageNo=1";
					</script>
				</c:if>  -->
			<c:forEach var="dto" items="${list }">
				<tr>
					<td class="ad_no">${dto.ad_no}</td>
					<td class="ad_store_id">${dto.ad_store_id}</td>
					<td class="ad_content">
						<a href="AdView.do?ad_no=${dto.ad_no}">${dto.ad_content }</a>
					</td>
					<td class="ad_status">		<!--  status가 0인데도 otherwise 출력  -->
						<c:choose>			
							<c:when test="${requestScope.ad_status != 0}">완료</c:when>
							<c:otherwise>확인 안함</c:otherwise>		
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="AdListView.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
						end="${pagging.endPageOfPageGroup}">
							<a href="AdListView.do?pageNo=${i }">${ i}</a>
						</c:forEach>
					
						<c:if test="${pagging.nextPageGroup }">
							<a href="AdListView.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
						<a href="AdWriteView.do" class="btn_writer" style="text-align: right;">글쓰기</a>
										<!-- 페이지 완성 후 삭제! -->
					</div>
			</td>
			</tr>
		</table>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>