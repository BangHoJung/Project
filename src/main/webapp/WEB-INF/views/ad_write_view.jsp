<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/ad_write_view.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

	<c:if test="${sessionScope.login == null  || sessionScope.grade == 0 }">		
				<script>
					alert("권한이 없습니다.");
					location.href="/";
				</script>
	</c:if>

	
	<jsp:include page="/templete/mypage_header.jsp"></jsp:include>

	
	<div class="body">
	<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
		<div class="container">
		<h2>광고신청</h2>
			<form action="AdWriteAction.do" method="post">
				<table>
					<tr>
						<th>작성자</th>
						<td>
							${sessionScope.id }		
						</td>
					</tr>
					<tr>
						<th>식당 선택</th>
						<td>
							<select name="ad_store_id">
								<c:forEach var="dto" items="${storeList }">
									<option value="${dto.store_id }">${dto.store_id }</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
					<tr id="content">
						<th style="vertical-align: top;">내용</th>
						<td>
							<textarea name="ad_content"></textarea>
						</td>
					</tr>
					<!-- 첨부 파일 
					<tr>
						<td colspan="2" id="file_form">
							<p><input type="file" name="ad_file"> 
							<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
							<p><input type="file" name="ad_file"></p>
							<p><input type="file" name="ad_file"></p>
						</td>
					</tr>
					-->
					<tr>
						<td><a href="javascript:history.back();" class="btn">뒤로가기</a></td>
						<td style="text-align: right;">	<button class="btn">작성완료</button></td>
					</tr>
				</table>
			</form>
		</div>	
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>