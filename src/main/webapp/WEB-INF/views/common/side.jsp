<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
		<H3>관리자</H3>
		<ul>
			<li><a href="#">등록 회원 조회</a></li>
			<li><a href="#">등록 사업체 조회</a></li>
			<li><a href="#">상품 조회</a></li>
			<li><a href="#">문의 내역</a></li>
			<li><a href="#">신고 내역</a></li>
			<li><a href="#">전체 주문 조회</a></li>
			<li><a href="#">매출 관리</a></li>
			<li><a href="#">이벤트 관리</a></li>
			<li><a href="#">관리자 게시물 등록</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">회원 정보 수정</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="#">구매 내역</a></li>
			<li><a href="#">문의 내역</a></li>
			<li><a href="#">주문 조회</a></li>
			<li><a href="#">My 포인트</a></li>
			<li><a href="#">My 게시글 조회</a></li>
			<li><a href="#">회원 탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='company_page' }">
	<li>
		<h3>마이페이지</h3>
		<ul>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">회원 정보 수정</a></li>
			<li><a href="#">상품 문의 내역</a></li>
			<li><a href="#">판매 내역</a></li>
			<li><a href="#">스케줄 관리</a></li>
			<li><a href="#">My 상품 조회</a></li>
			<li><a href="#">My 게시글 조회</a></li>
			<li><a href="#">회원 탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>디자인</h3>
		<ul>
			<li><a href="#">인쇄/홍보물</a></li>
			<li><a href="#">패키지/커버/로고</a></li>
			<li><a href="#">웹/모바일</a></li>
			<li><a href="#">브랜딩/마케팅</a></li>
			<li><a href="#">산업/제품디자인</a></li>
			<li><a href="#">캐릭터/일러스트</a></li>
			<li><a href="#">캘리그라피/폰트</a></li>
			<li><a href="#">공간/건축</a></li>
			<li><a href="#">패션/텍스타일</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>IT/프로그래밍</h3>
		<ul>
			<li><a href="#">UX기획</a></li>
			<li><a href="#">웹</a></li>
			<li><a href="#">커머스</a></li>
			<li><a href="#">모바일</a></li>
			<li><a href="#">프로그램</a></li>
			<li><a href="#">트렌드</a></li>
			<li><a href="#">데이터</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>영상/사진/음향</h3>
		<ul>
			<li><a href="#">영상</a></li>
			<li><a href="#">사진</a></li>
			<li><a href="#">음향</a></li>
			<li><a href="#">엔터테이너</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>마케팅</h3>
		<ul>
			<li><a href="#">채널 활성화</a></li>
			<li><a href="#">바이럴/체험단</a></li>
			<li><a href="#">업종/목적별</a></li>
			<li><a href="#">최적화 노출</a></li>
			<li><a href="#">광고(퍼포먼스)</a></li>
			<li><a href="#">PR/행사</a></li>
			<li><a href="#">분석/전략</a></li>
			<li><a href="#">옥외/인쇄/방송 광고</a></li>
			<li><a href="#">해외 마케팅</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>문서/번역</h3>
		<ul>
			<li><a href="#">비즈니스/카피</a></li>
			<li><a href="#">마케팅 글쓰기</a></li>
			<li><a href="#">콘텐츠 글쓰기</a></li>
			<li><a href="#">스토리텔링</a></li>
			<li><a href="#">타이핑/첨삭</a></li>
			<li><a href="#">번역/통역</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>경영자문/운영지원</h3>
		<ul>
			<li><a href="#">사업계획</a></li>
			<li><a href="#">스타트업 자문</a></li>
			<li><a href="#">기업 자문</a></li>
			<li><a href="#">업종별 창업</a></li>
			<li><a href="#">비즈니스 문서</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>주문제작</h3>
		<ul>
			<li><a href="#">인쇄/판촉물</a></li>
			<li><a href="#">시공</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>세무/법무/노무</h3>
		<ul>
			<li><a href="#">법무</a></li>
			<li><a href="#">세무/회계</a></li>
			<li><a href="#">지식재산권 보호</a></li>
			<li><a href="#">노무</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>취업/입시/노하우/직무역량</h3>
		<ul>
			<li><a href="#">취업/이직</a></li>
			<li><a href="#">입시/자격증</a></li>
			<li><a href="#">투잡/재테크</a></li>
			<li><a href="#">전자책/VOD</a></li>
			<li><a href="#">데이터/개발 레슨</a></li>
			<li><a href="#">실무/자기개발 레슨</a></li>
			<li><a href="#">외국어 레슨</a></li>
			<li><a href="#">디자인/영상 레슨</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
<c:when test="">
	<li>
		<h3>취미/생활</h3>
		<ul>
			<li><a href="#">뷰티/운동</a></li>
			<li><a href="#">댄스/뮤직</a></li>
			<li><a href="#">미술/글쓰기</a></li>
			<li><a href="#">공예/취미</a></li>
			<li><a href="#">웨딩</a></li>
			<li><a href="#">청소/수리/설치</a></li>
			<li><a href="#">기타</a></li>
		</ul>
	</li>
</c:when>
</c:choose>	
</ul>
</nav>
</body>
</html>