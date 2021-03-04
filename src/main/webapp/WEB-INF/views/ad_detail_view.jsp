<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/ad_detail_view.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

	<c:if test="${sessionScope.login == null  || sessionScope.grade == 0 }">		
				<script>
					alert("권한이 없습니다.");
					location.href="/";
				</script>
	</c:if>

	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>

	
	<div class="body">
	<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
		<h3>광고신청</h3>
			<table>
				<tr>
					<tr>
						<th>작성자</th>
						<td>
							${requestScope.ad.ad_store_id}			
						</td>
					</tr>
					<tr>
						<th>승인</th>
						<td>	<!-- 버튼 승인->미승인 전환필요 / status가 0인데도 otherwise 출력  -->
						<c:choose>			
							<c:when test="${requestScope.ad_status != 0}">완료</c:when>
							<c:otherwise>확인안함</c:otherwise>		
						</c:choose>
						</td>
					</tr>
					<tr id="content">
						<th style="vertical-align: top;">내용</th>
						<td>
							${requestScope.ad.ad_content }
						</td>
					</tr>
					
					<!-- 첨부파일 view 기능 추가 -->
					
					
					<%-- <tr>
						<th><a href="AdListView.do" class="btn">목록보기</a></th>
						<td style="text-align: right;">
						<c:if test="${sessionScope.id == requestScope.ad.ad_store_id}">
							<a href="#" class="btn">수정</a>
							<a href="deleteAd.do?bno=${requestScope.advertisement.ad_no }" class="btn">삭제</a>
						</c:if>
						</td>
					</tr> --%>
				</table>
			</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>