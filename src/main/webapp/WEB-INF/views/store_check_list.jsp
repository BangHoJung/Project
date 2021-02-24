<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/storeCheckList.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("tr").click(function() {
			console.log($(this).children().eq(2).html());
			var store_id = $(this).children().eq(1).html()+"_"+$(this).children().eq(2).html();
			location.href = "storeCheckView.do?store_id="+store_id;
		});
	});
</script>
</head>
<body>
	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
	<div class="body">
		<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
			<h1> 식당 등록 신청 현황</h1><br>
			<div class="wrapper">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>사업자명</th>
							<th>식당 상호명</th>
							<th>사업자등록번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="store" items="${requestScope.list }">
							<tr>
								<td>${store.store_member_id }</td>
								<td>${store.store_name }</td>
								<td>${store.store_license }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>