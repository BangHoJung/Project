<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/mobile_qna_detail.css" media="screen and (max-width:767px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(function(){
		if(${requestScope.QnAupdateSuccess == true}){alert("수정 성공!!");}
		$("#pop").html($(window).width());
		$(window).resize(function() {
			$("#pop").html($(window).width());
		});
			$("#random").click(function(){
				alert('추천 메뉴는 ooo입니다');
	    });
	});
	</script>
</head>
<body>
	<jsp:include page="mobile_header.jsp"></jsp:include>
	<div class="qna_detail_container">
		<h3>Q&A</h3>
		<table id="form">
			<tr>
				<th class="col-xs-2">제목</th>
				<td class="col-xs-8">
					${requestScope.qna.qna_title }
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					${requestScope.qna.qna_member_id }
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>
					${requestScope.qna.qna_date }
				</td>
			</tr>
			<tr >
				<td colspan="2" id="content">
					${requestScope.qna.qna_content }
				</td>
			</tr>
		</table>
		<table id="btn">
			<tr>
				<th>
					<c:if test="${sessionScope.grade == '2'}">
					<c:if test="${requestSope.qna.qna_response == null}">
					<a href="/qnaAnswerView.do?qna_no=${requestScope.qna.qna_no }" class="btn">답변하기</a>
					</c:if>
					</c:if>
				</th>
				<td style="text-align: right;">
					<c:if test="${sessionScope.id == requestScope.qna.qna_member_id}">
					<a href="/qnaUpdateView.do?qna_no=${requestScope.qna.qna_no}" class="btn">수정</a>
					<a href="/qnaDeleteAction.do?qna_no=${requestScope.qna.qna_no }" class="btn">삭제</a>
					<a href="qnaView.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="btn">목록보기</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="mobile_footer.jsp"></jsp:include>
</body>
</html>