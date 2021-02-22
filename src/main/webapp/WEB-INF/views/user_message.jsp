<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>관리자가 보낸 메세지를 받는 함</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/user_message_mobile.css" media="screen and (max-width:768px)">
<link rel="stylesheet" href="css/user_message_pc.css" media="screen and (min-width:769px)">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
if(${requestScope.deleteComplete == false}){alert("삭제를 실패했습니다.");}
$(function () {
	 //최상단 체크박스 클릭
    $("#deleteAll").click(function(){
        //클릭되었으면
        if($("#deleteAll").prop("checked")){
            //input태그의 name이 delete인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=delete]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 delete인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=delete]").prop("checked",false);
        }
    });
	 $("#btn_delete").click(function() {
        var checkRow = "";
        $("input[name=delete]:checked").each(function() {
        	checkRow += $(this).val()+",";
        });
         checkRow=checkRow.substr(0,checkRow.lastIndexOf(","));
         if(checkRow ==""){alert("삭제할 대상을 선택하세요");return false;}
         
         if(confirm("정보를 삭제하시겠습니까?")==true){
        	 location.href="deleteMessage.do?checkRow="+checkRow;
         }
	 });
});
</script>
</head>
<body>
<div class="container">
<h1>내 쪽지함</h1>
<form id="frm" method="get">

   <table class="table table-hover table-bordered">

<thead>   
 <tr>
   <td>
     <input type="checkbox" name="deleteAll" id="deleteAll">
   </td>
   <th>
     보낸 사람
   </th>
   <th>
      제목
   </th>
   <th>
      상태
   </th>
 </tr>
 </thead>
 <tbody>
 <c:set var="page" value="${sessionScope.page}" scope="page" />
 <c:if test="${requestScope.message == null}">
     <td colspan="4">쪽지가 없습니다</td>
 </c:if>
    <c:forEach var="list" items="${requestScope.message}">
        <tr class="message_items">
           <td><input type="checkbox" name="delete" value="${list.message_no}"></td>
           <td>관리자</td>
           <td><a href="messageDetailView.do?no=${list.message_no}&pageNo=${page.currentPage}">${list.message_title}</a></td>
           <c:choose>
           <c:when test="${list.message_status==0}">
           <td>안읽음</td>
           </c:when>
           <c:otherwise>
            <td>읽음</td>
           </c:otherwise>
           </c:choose>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr class="page_bar">
		<td colspan="4" class="page_bar_items">
         <button type="button" id="btn_delete" class="btn btn-success">삭제하기</button>
			<c:if test="${page.previousPageGroup }">
				<a href="userMessageView.do?pageNo=${page.startPageOfPageGroup-1}">◀</a>
			</c:if>		
			<c:forEach var="i" begin="${page.startPageOfPageGroup }" end="${page.endPageOfPageGroup }" step="1">
           <c:if test="${i==0}">
				<a href="userMessageView.do?pageNo=1">1</a>					
           </c:if>
		   <c:if test="${i!=0}">
				<a href="userMessageView.do?pageNo=${i}" id="link${i}">${i}</a>					
		      <script type="text/javascript">
		       if(${page.currentPage}==${i}){$("#link${i}").css("color", "red");}
		      </script>
           </c:if>					
			</c:forEach>
		<c:if test="${page.nextPageGroup }">
			<a href="userMessageView.do?pageNo=${page.endPageOfPageGroup+1}">▶</a>
		 </c:if>
		</td>
	</tr>
	</tfoot>
</table>

</form>
</div>
</body>
</html>