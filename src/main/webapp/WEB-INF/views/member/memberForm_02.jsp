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
</head>
<body>
<div>
	<img class="logo" alt="booktopia" src="${contextPath}/resources/image/loginForm.png">
	<div class="detail_table3">
		<textarea rows="10" cols="70">
			약관
		</textarea>
		<div class="check">
  			<input id="agree" type="checkbox">
  			<label for="agree">
    			<span>개인정보 수집 및 이용 약관에 동의합니다.</span>
 			</label>
		</div>
		<textarea rows="10" cols="70">
			약관
		</textarea>
		<div class="check">
  			<input id="agree" type="checkbox">
  			<label for="agree">
    			<span>서비스 이용 약관 및 개인정보 처리 방침에 동의합니다.</span>
 			</label>
		</div>
		<div class="check">
  			<input id="agree" type="checkbox">
  			<label for="agree">
    			<span>모두 동의합니다.</span>
 			</label>
		</div>
		<a href="#">
			<input type="button" value="이전 단계">	   
		</a>
		<a href="#">
			<input type="button" value="다음 단계">
		</a>
	</div>
</div>
</body>
</html>