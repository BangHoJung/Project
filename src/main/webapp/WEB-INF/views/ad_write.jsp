<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 신청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="ad_write_container">
		<h2>광고신청</h2>
			<form action="AdWriteAction.do" method="post">
				<table>
					<tr>
						<th>제목</th>
					<td>
						<input type="text" name="ad_title">
					</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							${sessionScope.ad_store_id }			
						</td>
					</tr>
					<tr id="content">
						<th style="vertical-align: top;">내용</th>
						<td>
							<textarea name="ad_content"></textarea>
						</td>
					</tr>
					<!-- 첨부 파일 -->
					<tr>
						<td colspan="2" id="file_form">
							<p><input type="file" name="ad_file"> 
							<button type="button" id="plus">+</button> <button type="button" id="minus">-</button></p>
							<p><input type="file" name="ad_file"></p>
							<p><input type="file" name="ad_file"></p>
						</td>
					</tr>
					
					
					<tr>
						<th><a href="" class="btn">목록보기</a></th>
						<td style="text-align: right;">	<button>작성완료</button></td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>