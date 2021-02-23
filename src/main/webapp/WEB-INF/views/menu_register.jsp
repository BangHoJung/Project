<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/menuRegister.css" media="screen  and (min-width:1024px)">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#plus").click(function() {
			console.log($("tbody").children().siblings().first().val());
			$("tbody").children().first().before("<tr><td><input type=\"text\" name=\"menu_name\" placeholder=\"메뉴 이름 입력\" ></td>"
			 + "<td><input type=\"text\" name=\"menu_price\" placeholder=\"메뉴 가격 입력\" ></td>"
			 + "<td><input type=\"file\" name=\"menu_photo\" ></td>");
		});
		
		$("#minus").click(function() {
			$("tbody").children().siblings().first().remove();
		});
		
		$("#submit").click(function(e) {
			$.each($("input[name='menu_name']"), function(index,item) {
				console.log(index + " , " + $(item).val());
				if($(item).val() == null || $(item).val() == "") {
					alert("모든 메뉴 이름을 정확히 입력해주세요");
					return false;
				}
			});
			
			$.each($("input[name='menu_price']"), function(index,item) {
				console.log(index + " , " + $(item).val());
				if($(item).val() == null || $(item).val() == "") {
					alert("모든 메뉴 가격을 정확히 입력해주세요");
					return false;
				}
			});
			
			$("#frm").submit();
		});
		
		
	});
</script>
</head>
<body>
	<div id="container">
		<h1>메뉴 정보 등록 페이지</h1>
		<div>
			<form action="menuRegisterAction.do" enctype="multipart/form-data" method="post" id="frm">
				<%-- <input type="hidden" name="store_id" value="${store_id}"> --%>
				<button id="plus" type="button">메뉴 추가</button> <button id="minus" type="button">메뉴 삭제</button><br>
				<table>
					<thead>
					<tr>
						<th>메뉴 이름(한글)</th>
						<th>메뉴 가격(숫자)</th>
						<th>메뉴 사진</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" name="menu_name" placeholder="메뉴 이름 입력" oninput="this.value = this.value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, '').replace(/(\..*)\./g, '$1');"></td>
							<td><input type="text" name="menu_price" placeholder="메뉴 가격 입력" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"></td>
							<td><input type="file" name="menu_photo" ></td>
						</tr>
					</tbody>
				</table>
				<button type="button" id="submit"> 메뉴 등록</button>
			</form>
		</div>
	</div>
</body>
</html>