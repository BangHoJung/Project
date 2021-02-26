<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/ad_list_view.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	.container{
		width: 780px;
		margin: 0 auto;
		padding:0;
	}
	table{
		width:700px;
		padding: 20px;
		border: 1px solid black; 
	}
</style>
</head>
<body>
	
	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>

	
	<div class="body">
	<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
		<table>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
			</tr>
			<c:if test="${requestScope.list ==null}">
				<script>
					location.href="main.do?pageNo=1";
				</script>
			</c:if>
			<c:forEach var="dto" items="${sessionScope.list }">
				<td>${dto.ad_no}</td>
				<td>${dto.ad_store_id}</td>
			</c:forEach>
			<tr>
			<td colspan="7">		<!-- 안나오뮤ㅠㅠㅠ -->
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
						<a href="AdWriteView.do" class="btn_writer" >글쓰기</a>
					</div>
			</tr>
		</table>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>