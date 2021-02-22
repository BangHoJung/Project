<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 관리자가 유저에게 메세지 보내는 페이지 굳이 쓸 필요가 없을것같습니다. 
문의에 답변을 달면 자동적으로 메세지를 보내게 만들면 굳이 따로 쪽지를 보내는 페이지를 안만들어도 되며
이벤트 당첨자도 굳이 안보내도 될것같습니다.log파일처럼 이벤트 당첨자 아이디를 저장해서 파일을 읽어와서 저장된 아이디에
원하는 쪽지를 보내게 설정하면 상관없을것 같습니다.다수의 이용자(100명~천명 많게는 전체회원)에게 처리해야되는 시스템이라 굳이 페이지로 
나눌 필요는 없을 것 같습니다 일단 틀만 잡아놨습니다.-->
<title>메세지 보내기</title>
<script src="lib/js/jquery-3.5.1.min.js"></script>
<script>
if(${sessionScope.login==null} || ${sessionScope.login==false} || ${sessionScope.grade !=2}){alert("잘못된 접근방법입니다");history.back();}


</script>
</head>
<body>
   <form action="sendMessage.do">
   <b>받는 사람</b>
   <input type="text" id="id" style="width: 300px;" placeholder="여러명을 동시에 보낼때는 쉼표(,)로 구분" name="id" oninput="this.value = this.value.replace(/[^a-zA-Z0-9,]/g, '').replace(/(\..*)\./g, '$1');"><br>  
   <b>제목</b>
   <input type="text" id="title" style="width: 300px;" name="title" value="문의하신 질문에 답변이 도착했습니다~~"><br>
   <b>내용</b><br>
   <textarea id="content" name="content" rows="10" cols="50" style="resize: none;">&#10;&#10;&#10;&#10;추가적인 문의사항은 MyPage의 문의하기를 통해서 문의해주세요~~좋은 하루 되세요~~</textarea>
   <button id="btn_send">쪽지 보내기</button>
   </form>
</body>
</html>