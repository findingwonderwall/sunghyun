<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
//치환 변수 선언합니다.
pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<style>
#abc{
    padding:8px;
}
</style>
<head>
<title>검색 도서 목록 페이지</title>
</head>
<body>
      
	
	<div id="sorting">
		 <select id="abc">
         <option value="select">금액</option>
         <option>1 ~ 5만원</option>
         <option>5 ~ 10 </option>
         <option>10만원 초과</option>
         </select>
            <select id="abc">
         <option value="select">인기순</option>
         <option>최신순</option>
         <option>평점순</option>
         </select>
         <input type="checkbox" >
        <span style= "font-size:15px; font-weight:bold; ">Prime</span></div>
        <div class="clear"></div>
	<div class="main_book">
	<c:set var="goods_count" value="0" />
	<h3 >${goodsList[0].goods_sort}</h3>
	<c:forEach var="item" items="${goodsList }">
		<c:set var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a
			href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
				<img width="121" height="154" alt=""
			src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			</a>

			<div class="title">${item.goods_title }</div>
			<div class="price">
				<fmt:formatNumber value="${item.goods_price}" type="number"
					var="goods_price" />
				${goods_price}원
			</div>
		</div>
		
	</c:forEach>
</div>
	
	<div class="clear"></div>
	<div id="page_wrap">
		<ul id="page_control">
			<li><a class="no_border" href="#">Prev</a></li>
			<c:set var="page_num" value="0" />
			<c:forEach var="count" begin="1" end="10" step="1">
				<c:choose>
					<c:when test="${count==1 }">
						<li><a class="page_contrl_active" href="#">${count+page_num*10 }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#">${count+page_num*10 }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li><a class="no_border" href="#">Next</a></li>
		</ul>
	</div>