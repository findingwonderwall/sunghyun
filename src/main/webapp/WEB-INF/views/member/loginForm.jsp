<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
   alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
</head>
<body>
<div class="middle">
   <img width="600px" height="200px" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
   <div class="loginForm">
      <form action="${contextPath}/member/login.do" method="post">
         <input name="member_id" type="text" size="20" placeholder="아이디"/><br>
         <input name="member_pw" type="password" size="20" placeholder="비밀번호"/><br>
         <input style="background-color: rgb(255, 215, 0);" type="submit" value="로그인" /><br>
         <a href="#">아이디 찾기</a>  |  <a href="#">비밀번호 찾기</a> |  <a href="${contextPath}/member/addMember.do">회원가입</a>               
      </form>
   </div>
</div>
</body>
</html>