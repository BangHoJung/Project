<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name='viewport' content='width=device-width, initial-scale=1'> -->
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage.css" type="text/css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">


</style>
</head>
<body>
<form action="mypage.do" method="post">

<jsp:include page="/templete/mypage_header.jsp"></jsp:include>

<div class="body">

<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>

<div class="container">
<div class="row"> 
<div class="col-xs-12">
<h3 class="maintitle"> 1:1문의하기  </h3>
<p class="see">  &lt; <a href="#"> 더보기 </a> > </p>
<table class="table">

<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>


<h3 class="maintitle"> 나의 리뷰</h3>
<p class="see">  &lt; <a href="#"> 더보기 </a> > </p>
<table class="table">


<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>
<h3 class="maintitle"> 위키리스트 </h3>
<p class="see">  &lt; <a href="#"> 더보기 </a> > </p>
<table class="table">
<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>
<h3 class="maintitle"> 나의 정보 </h3>
<p class="see">  &lt; <a href="#"> 더보기 </a> > </p>
<table class="table">
<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>
</div>
</div>
</div>
</div>
 </form>
</body>
</html>