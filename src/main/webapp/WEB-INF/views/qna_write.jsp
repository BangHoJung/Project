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
<script type="text/javascript">
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
	})
</script>
</head>
<body>
	<c:if test="${sessionScope.login == null || sessionScope.login == false  }">
		<c:set var="page" target="${sessionScope }" value="${pageContext.request.requestURI}${pageContext.request.queryString }" property="resultPage" scope="session"/>
		${pageContext.request.requestURI}${pageContext.request.queryString }
		<script>
			alert("로그인을 하셔야 이용할수 있습니다.");
			location.href="loginView.do";
		</script>
	</c:if>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="qna_write_container">
		<h3>Q&A작성</h3>
		<form action="qnaWriteAction.do" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="hidden" name="qna_member_id" value="${sessionScope.id }">
						${sessionScope.name }
					</td>
				</tr>
				<tr>
					<th style="vertical-align: top;">내용</th><td><textarea name="qna_content"></textarea></td>
				</tr>
				<tr>
					<th><a href="qnaView.do?pageNo=${requestScope.pageNo == null ? 1 : requestScope.pageNo }" class="btn">목록보기</a></th>
					<td style="text-align: right;">
						<button type="submit" class="btn">글쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>