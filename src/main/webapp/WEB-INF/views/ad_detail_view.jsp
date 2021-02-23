<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="ad_datail_view_container">
		<h3>광고신청</h3>
			<table>
					<tr>
					<th>제목</th>
					<td>
						${requestScope.ad_title }
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${requestScope.ad_store_id}			
					</td>
				</tr>
				<tr id="content">
					<th style="vertical-align: top;">내용</th>
					<td>
						${requestScope.ad_content }
					</td>
				</tr>
			</table>
		</div>
</body>
</html>