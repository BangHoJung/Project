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
	<div id="board_container">
	<h3>Q&A</h3>
		<table class="board">
			<tr>
				<th class="bno">글번호</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
				<th>조회수</th>
			</tr>
		<%--데이터 없어서 ㅎ --%>
		<%-- <c:if test="${requestScope.list ==null}">
			<script>
				location.href="main.do?pageNo=1";
				
			</script>
		</c:if> --%>
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td>${dto.bno }</td>
				<td><a href="boardView.do?bno=${dto.bno }"> ${dto.title }
					<c:if test="${dto.cCount > 0 }">
						[${dto.cCount}]
					</c:if>
				</a></td>
				<td>${dto.writer}</td>
				<td>${dto.bDate }</td>
				<td>${dto.bCount }</td>
			</tr>
		</c:forEach>
			<%--demo --%>
			<tr>
				<td>bno</td>
				<td>title</td>
				<td>writer</td>
				<td>date</td>
				<td>count</td>
			
			</tr>
			<tr>
				<td>bno</td>
				<td>title</td>
				<td>writer</td>
				<td>date</td>
				<td>count</td>
			
			</tr>
			<tr>
				<td>bno</td>
				<td>title</td>
				<td>writer</td>
				<td>date</td>
				<td>count</td>
			
			</tr>
			<tr>
				<td>bno</td>
				<td>title</td>
				<td>writer</td>
				<td>date</td>
				<td>count</td>
			
			</tr>
			<tr>
				<td>bno</td>
				<td>title</td>
				<td>writer</td>
				<td>date</td>
				<td>count</td>
			
			</tr>
		  <tr>
			<td colspan="7">
					<div class="page_bar">
						<c:if test="${pagging.previousPageGroup }">
							<a href="index.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
						</c:if>
						<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" 
						end="${pagging.endPageOfPageGroup}">
							<a href="index.do?pageNo=${i }">${ i}</a>
						</c:forEach>
					
						<c:if test="${pagging.nextPageGroup }">
							<a href="index.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
						</c:if>
						<a href="boardWriteView.do" class="btn_writer">글쓰기</a>
					</div>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>