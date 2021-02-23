<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/main.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
	$(function(){
		$("#pop").html($(window).width());
		$(window).resize(function() {
			$("#pop").html($(window).width());
		});		
	});

	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="qna_datail_view_container">
			<h3>Q&A</h3>
			<table>
					<tr>
					<th>제목</th>
					<td>
						${requestScope.qna.qna_title }
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${requestScope.qna.qna_member_id}			
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						${requestScope.qna.qna_date }
					</td>
				</tr>
				<tr id="content">
					<th style="vertical-align: top;">내용</th>
					<td>
						${requestScope.qna.qna_content }
					</td>
				</tr>
				
				
				<%-- <c:if test="${sessionScope.login == true}">
				<tr>
					<td colspan="2">
						<div class="comment_form">
							<form id="comment">
							<input type="hidden" name="bno" value="${requestScope.board.bno }">
							<input type="hidden" name="writer" value="${sessionScope.id }">
							<span class="writer">${sessionScope.id }</span>
							<textarea name="content" maxlength="500"></textarea>
							<p class="length">0/500</p><hr>
							<p style="text-align: right;"><button type="button">등록</button></p>
							</form>							
						</div>
					</td>
				</tr> 
					</c:if>
				--%>
				<tr>
					<th><a href="javascript:history.back();" class="btn">목록보기</a></th>
					<td style="text-align: right;">
					<c:if test="${sessionScope.id == requestScope.qna.qna_member_id}">
						<a href="#" class="btn">수정</a>
						<a href="#" class="btn">삭제</a>
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