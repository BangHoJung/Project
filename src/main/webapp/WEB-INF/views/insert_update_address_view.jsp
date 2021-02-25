<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>내 주소</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/insert_update_address_view_mobile.css" media="screen and (max-width:768px)">
<link rel="stylesheet" href="css/insert_update_address_view_pc.css" media="screen and (min-width:769px)">
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> 
	function getPostcode() {
                       var index=document.getElementsByName("roadAddress").length;
		               if(index==5){alert("주소는 최대 5개까지 추가 가능합니다.");return false;} 	   
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 추가 주소 정보를 해당 필드에 넣는다.
					    //여기에 데이버 베이스 연결 들어가야됨
                     var data="address="+roadAddr;
                     $.ajax({
                    	  url : "insertMemberAddressAction.do",
                    	  data : data,
                    	  method : "post",
                    	  success:function(d){
                    		  var result=d;
                    		  if(!(result=="중복된 주소입니다."))
                              $(".container").find("table").append("<tr><td><input type='text' name='roadAddress' value='"+roadAddr+"' readonly></td><td><button type='button' id='btn_deletePost' class='btn'>삭제</button></td><td><button type='button' id='btn_choicePost' class='btn'>선택</button></td></tr>");
                    		  else
                    			  alert(result);
                    	  }
                       });    
					}
				}).open();
	        }
	$(function () {
	if(${sessionScope.login ==null} || ${sessionScope.login==false}){alert("잘못된 접근방법입니다.");location.href="loginView.do";}
       $("input").blur();
	   $(document).on("click","#btn_deletePost",function() {
	       //클릭시 버튼이 위치한 tr 인덱스 출력 0부터 시작
    	   var address=$(this).parent().parent().find("input").val();   
    	   location.href="deleteAddressAction.do?address="+address;
       });	
       $(document).on("click","#btn_choicePost",function() {
    	   var address=$(this).parent().parent().find("input").val();   
    	   location.href="choiceAddressAction.do?address="+address;
       });
                	
	
	});
</script>
</head>
<body>
  <jsp:include page="/templete/mypage_header.jsp"></jsp:include>
  <div class="body">
  <jsp:include page="/templete/mypage_menu.jsp"></jsp:include>
   <div class="container">
     <div><h1>내 주소</h1><input type="button" onclick="getPostcode()" value="추가하기" class="btn" id="getPost"></div>
         <table class="table table-bordered">
         <c:forEach var="address" items="${sessionScope.list}">
            <c:choose>
             <c:when test="${address.address_status ==1}">
               <tr>
                <td>
            <input type="text" value="${address.address_Text}" name="roadAddress" readonly>
                </td>		
                </tr>
             </c:when>
             <c:otherwise>
              <tr>
                <td>
            <input type="text" value="${address.address_Text}" name="roadAddress" readonly>
                </td>
                <td>
            <button type="button" id="btn_deletePost" class="btn">삭제</button>
                </td>
                <td>
            <button type="button" id="btn_choicePost" class="btn">선택</button>
               </td>		
              </tr>
             </c:otherwise>
            </c:choose>
         </c:forEach>
         </table>
         </div>
   </div> 
</body>
        
</html>