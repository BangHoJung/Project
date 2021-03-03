<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../css/mobile_qna.css" media="screen and (max-width:767px)">
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
<jsp:include page="mobile_header.jsp"></jsp:include>
	<div class="row">
	<img id="qna_img" alt="" src="/img/qna_img.jpg" class="col-xs-12">
	</div>
	<div id="board_container">
		<h3>내가 한 질문</h3>
		<div class="col-xs-12">
		<table class="table">
			<tr>
				<th class="qno">글번호</th>
				<th class="qna_title">제목</th>
				<th class="writer">작성자</th>
			</tr>
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td class="qno">${dto.qna_no}</td>
				<td class="qna_title" id="qna"><a href="mbQnaDetailView.do?qna_no=${dto.qna_no}"> ${dto.qna_title}
				</a></td>
				<td class="writer">${dto.qna_member_id}</td>
			</tr>
		<c:if test="${dto.qna_response != null }">
			<tr>
				<td style="display: hidden" class="qno"></td>
				<td class="qna_title" id="qna_answer">
					<a href="/mbQnaAnswerDetailView.do?qna_no=${dto.qna_no}">
						└ RE : ${dto.qna_title }
					</a>
				</td>
				<td class="writer">관리자</td>
			</tr>
		</c:if>
		</c:forEach>
		    <tr>
				<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="mbQnaMypageView.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
							<a href="mbQnaMypageView.do?pageNo=${i }">${ i}</a>
						</c:forEach>
						<c:if test="${pagging.nextPageGroup }">
							<a href="mbQnaMypageView.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
						<a href="/mbQnaWrite.do" class="btn_writer">글쓰기</a>
					</div>
				</td>
			</tr>
		</table>
		</div>
	</div>
	<jsp:include page="mobile_footer.jsp"></jsp:include>
</body>
</html>