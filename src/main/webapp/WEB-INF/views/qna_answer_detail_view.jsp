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
<link rel="stylesheet" href="../css/qna.css" media="screen and (min-width:1024px)">
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
		<div class="qna_detail_view_container">
			<h3>Q&A답변</h3>
			<table id="form">
					<tr>
					<th>제목</th>
					<td>
						${requestScope.qna.qna_title }
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						관리자			
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						${requestScope.qna.qna_response_date }
					</td>
				</tr>
				<tr >
					<td colspan="2" id="content">
						${requestScope.qna.qna_response }
					</td>
				</tr>
				
				
			</table>
			<table id="btn">
				<tr>
					<td><a href="qnaView.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="btn">목록보기</a></td>
				</tr>
			</table>				
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>