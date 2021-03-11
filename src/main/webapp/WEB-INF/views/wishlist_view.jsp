<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>비밀번호 확인하기</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
 @media (max-width: 414px){
  .container input{
   width: 150px;
   padding-bottom: 5px;
    }
  }
  .container input{
   padding-bottom: 5px;
  }
 .container span{
  display: inline-block;
  margin-right: 10px;
  font-size: 1vw;
 }
 .btn{
  background-color: #FA0050;
  color: white;
  padding: 4px 12px;
 }
 #pass_update_check_frm{
  margin-top: 20%;
 }
 
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>

</script>
</head>
<body>
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
  <table>
  	<tr>
  		<th>
  			위시리스트 만드는중
  		</th>
  	</tr>
 	<c:forEach var="dto" items="${requestScope.list }">
  	<tr>
  		<td>
  			${dto.wish_list_member_id} 
  		</td>
  	</tr>
  	</c:forEach>
  </table>
</div>
</div>
</body>
</html>