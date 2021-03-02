<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="css/qna.css" media="screen and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		if(${requestScope.deleteAction == true}){
			alert("삭제 성공!!");
			}
		
	});
	$(function(){
		$("#random").click(function(){
			alert('추천 메뉴는 ooo입니다');
		})
		
	})
</script>
<style type="text/css">
		#qna_img{
			width: 1000px;
		}
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<img id="qna_img" alt="" src="/img/qna_img.jpg">
	<div id="board_container">
	
		<h3>내가 한 질문</h3>
		<table class="table">
			<tr>
				<th class="qno">글번호</th>
				<th class="qna_title">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
			</tr>
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td class="qno">${dto.qna_no}</td>
				<td class="qna_title" id="qna"><a href="qnaDetailView.do?qna_no=${dto.qna_no}"> ${dto.qna_title}
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
							<a href="qnaMypageView.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
							<a href="qnaMypageView.do?pageNo=${i }">${ i}</a>
						</c:forEach>
						<c:if test="${pagging.nextPageGroup }">
							<a href="qnaMypageView.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
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