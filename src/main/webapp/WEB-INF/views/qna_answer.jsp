<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/qna_write.css" media="screen and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

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
	<div class="qna_write_container">
		<h3>Q&A답변</h3>
		<form action="qnaAnswerAction.do" method="post">
			<input type="hidden" name="qna_no" value="${requestScope.qna.qna_no }">
			<table id="inputTable">
				<tr>
					<th>제목</th>
					<td>
						${requestScope.qna.qna_title}
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${sessionScope.name }
					</td>
				</tr>
				<tr>
					<th style="vertical-align: top;">내용</th><td><textarea name="qna_response"></textarea></td>
				</tr>
				</table>
			<table id="btnTable">
				<tr id="btnRow">
					<th><a href="qnaView.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="btn">목록보기</a></th>
					<td  >
						<button type="submit" class="btn">답변하기</button>
					</td>
				</tr>
			</table>	
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>