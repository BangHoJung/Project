<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>footer</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	/* @media screen and (max-width:360px){
	} */
</style>
<link rel="stylesheet" href="pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="pc.css" media="screen and (min-width:1024px)">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<footer class="clear">
		<ul>
			<li>대충 대표 이름</li>
			<li>전화번호 010-0000-0000</li>
			<li>이메일 asdasdasd@sadasd.com</li>
			
		</ul>
	</footer>
	
</body>
</html>



