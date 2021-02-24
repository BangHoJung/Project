<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/ad_write_view.css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div id="ad_write_container">
		<h2>광고신청</h2>
			<form action="AdWriteAction.do" method="post">
				<table>
					<tr>
						<th>작성자</th>
						<td>
							<input type="hidden" name="writer" value="${sessionScope.ad_store_id }">
							${sessionScope.ad_store_id }			
						</td>
					</tr>
					<tr id="content">
						<th style="vertical-align: top;">내용</th>
						<td>
							<textarea name="ad_comment"></textarea>
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
						<td style="text-align: right;">	<button>작성완료</button></td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html>