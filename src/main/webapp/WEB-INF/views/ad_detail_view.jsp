<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="ad_datail_view_container">
	<h3>광고신청</h3>
		<table>
			<tr>
				<tr>
					<th>작성자</th>
					<td>
						${requestScope.ad_store_id}			
					</td>
				</tr>
				<tr id="content">
					<th style="vertical-align: top;">내용</th>
					<td>
						${requestScope.ad_comment }
					</td>
				</tr>
				
				<!-- 첨부파일 view 기능 추가 -->
				
				
				<tr>
					<th><a href="javascript:history.back();" class="btn">목록보기</a></th>
					<td style="text-align: right;">
					<c:if test="${sessionScope.id == requestScope.ad_store_id}">
						<a href="#" class="btn">수정</a>
						<a href="deleteAd.do?bno=${requestScope.ad_bno }" class="btn">삭제</a>
					</c:if>
						<a href="#" class="btn">이전글</a>
						<a href="#" class="btn">다음글</a>
						
					</td>
				</tr>
			</table>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>