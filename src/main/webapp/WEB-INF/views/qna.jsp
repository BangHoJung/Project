<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/qna.css" media="screen and (min-width:1024px)">
<script type="text/javascript">
	$(function(){
		if(${requestScope.deleteAction == true}){
			alert("삭제 성공!!");
			}
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
	})

	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="board_container">
		<h3>Q&A</h3>
		<table class="board">
			<tr>
				<th class="qno">글번호</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
			</tr>
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td class="qno">${dto.qna_no}</td>
				<td class="title" id="qna"><a href="qnaDetailView.do?qna_no=${dto.qna_no}"> ${dto.qna_title}
				</a></td>
				<td class="writer">${dto.qna_member_id}</td>
				<td >${dto.qna_date}</td>
			</tr>
		<c:if test="${dto.qna_response != null }">
			<tr>
				<td style="display: hidden"></td>
				<td id="qna_answer">
					<a href="/qnaAnswerDetailView.do?qna_no=${dto.qna_no}">
						└ RE : ${dto.qna_title }
					</a>
				</td>
				<td>관리자</td>
				<td>${dto.qna_response_date}</td>
			</tr>
		</c:if>
		</c:forEach>
		    <tr>
				<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="qnaView.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
							<a href="qnaView.do?pageNo=${i }">${ i}</a>
						</c:forEach>
						<c:if test="${pagging.nextPageGroup }">
							<a href="qnaView.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
						<a href="/qnaWrite.do" class="btn_writer">글쓰기</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>