<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/mobile_qna_detail.css" media="screen and (max-width:767px)">
<script type="text/javascript">
$(function(){
	$("#random").click(function(){
		alert('추천 메뉴는 ooo입니다');
	})
})
	</script>
</head>
<body>
	<jsp:include page="mobile_header.jsp"></jsp:include>
	<div class="qna_detail_container">
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
				<td>관리자</td>
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
				<td><a href="mbQnaView.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="btn">목록보기</a></td>
			</tr>
		</table>				
	</div>
	<jsp:include page="mobile_footer.jsp"></jsp:include>
</body>
</html>