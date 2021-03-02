<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>공지사항 작성</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<style>
@media (max-width:768px){
.container{
  width: 414px; 
 } 
}
form{
 position: relative;
}
.table tr th{
 width: 10%;
}
.notice_title{
 width: 100%;
 }
.content{
 width: 100%;
 height: 500px;
}
.btn{
 background-color: #FA0050;
 color: white;
 position: absolute;
 right: 0;
}
</style>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
$(function () {
if(${sessionScope.grade !=2}){alert("잘못된 접근입니다.");history.back();}	
$("#btn_notice_write").click(function() {
	if($("#title").val().trim().length == 0){alert("제목을 입력해주세요");$("#title").focus();return false;};
	if($("#content").val().trim().length ==0){alert("내용을 입력해주세요");$("#content").focus();return false;};
	var data =$("#notice_write_frm").serialize();
	$.ajax({
		url : "adminNoticeWriteAction.do",
		data : data,
		method : "get",
		success:function(d){
			console.log(d);
			if(d=="true"){
				location.href="notice.do";
			}
			else{
				alert("작성이 실패했습니다");
				location.reload();
			}					
		}
		
	})
 });
});
</script>
</head>
<body>
<c:if test="${sessionScope.grade==2}">
<jsp:include page="/templete/mypage_header.jsp"></jsp:include>
<div class="body">
<jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
<div class="container">
<form id="notice_write_frm" method="get">
 <table class="table table bordered">
    <tr>
      <th>
       제목
      </th>
      <td>
        <input class="notice_title" type="text" name="title" id="title">
      </td>
    </tr>
    <tr>
      <th>
       내용
      </th>
       <td>
          <textarea class="content" name="content" id="content" style="resize: none;"></textarea>
      </td>
    </tr>
 </table>
 <button id="btn_notice_write" type="button" class="btn">작성하기</button>
 </form>
</div>
</div>
</c:if>
</body>
</html>