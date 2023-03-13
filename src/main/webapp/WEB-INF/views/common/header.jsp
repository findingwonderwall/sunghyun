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
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			/* error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data); */
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
</script>
</head>
<body>
<div id="logo">
	<a href="${contextPath}/main/main.do">
		<img width="147px" height="147px" alt="booktopia" src="${contextPath}/resources/image/logo_1.png">
		</a>
	</div>
	<div id="search" >
		<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검색" >
		</form>
	</div>
	<div id="head_link">
		<ul>
		   <c:choose>
		     <c:when test="${isLogOn == true and not empty memberInfo }">
		     	<li><a>${memberInfo.member_id} 님 안녕하세요!</a></li>
			 	<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
			 </c:otherwise>
			</c:choose>
			   <li><a href="#">고객센터</a></li>
      <c:if test="${isLogOn == true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if> 
		</ul>
	</div>
	<div id="head_menu">
		<ul>
			<li><a href="#">전체 카테고리</a>
				<ul>
					<span class="bold">&nbsp;&nbsp;비즈니스</span>
					<li><a href="${contextPath}/goods/goodList.do"">&nbsp;&nbsp;디자인</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;디자인</span>
							<li><a href="#">&nbsp;&nbsp;인쇄/홍보물</a></li>
							<li><a href="#">&nbsp;&nbsp;패키지/커버/로고</a></li>
							<li><a href="#">&nbsp;&nbsp;웹/모바일</a></li>
							<li><a href="#">&nbsp;&nbsp;브랜딩/마케팅</a></li>
							<li><a href="#">&nbsp;&nbsp;산업/제품디자인</a></li>
							<li><a href="#">&nbsp;&nbsp;캐릭터/일러스트</a></li>
							<li><a href="#">&nbsp;&nbsp;캘리그라피/폰트</a></li>
							<li><a href="#">&nbsp;&nbsp;공간/건축</a></li>
							<li><a href="#">&nbsp;&nbsp;패션/택스타일</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;IT/프로그래밍</a>
						<ul>
							<span class="bold">IT/프로그래밍</span>
							<li><a href="#">&nbsp;&nbsp;UX기획</a></li>
							<li><a href="#">&nbsp;&nbsp;웹</a></li>
							<li><a href="#">&nbsp;&nbsp;커머스</a></li>
							<li><a href="#">&nbsp;&nbsp;모바일</a></li>
							<li><a href="#">&nbsp;&nbsp;프로그램</a></li>
							<li><a href="#">&nbsp;&nbsp;트렌드</a></li>
							<li><a href="#">&nbsp;&nbsp;데이터</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;영상/사진/음향</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;영상/사진/음향</span>
							<li><a href="#">&nbsp;&nbsp;영상</a></li>
							<li><a href="#">&nbsp;&nbsp;사진</a></li>
							<li><a href="#">&nbsp;&nbsp;음향</a></li>
							<li><a href="#">&nbsp;&nbsp;엔터테이너</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;마케팅</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;마케팅</span>
							<li><a href="#">&nbsp;&nbsp;채널 활성화</a></li>
							<li><a href="#">&nbsp;&nbsp;바이럴/체험단</a></li>
							<li><a href="#">&nbsp;&nbsp;업종/목적별</a></li>
							<li><a href="#">&nbsp;&nbsp;최적화 노출</a></li>
							<li><a href="#">&nbsp;&nbsp;광고(퍼포먼스)</a></li>
							<li><a href="#">&nbsp;&nbsp;PR/행사</a></li>
							<li><a href="#">&nbsp;&nbsp;분석/전략</a></li>
							<li><a href="#">&nbsp;&nbsp;옥외/인쇄/방송 광고</a></li>
							<li><a href="#">&nbsp;&nbsp;해외 마케팅</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;문서/번역</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;문서/번역</span>
							<li><a href="#">&nbsp;&nbsp;비즈니스 카피</a></li>
							<li><a href="#">&nbsp;&nbsp;마케팅 글쓰기</a></li>
							<li><a href="#">&nbsp;&nbsp;콘텐츠 글쓰기</a></li>
							<li><a href="#">&nbsp;&nbsp;스토리텔링</a></li>
							<li><a href="#">&nbsp;&nbsp;타이핑/첨삭</a></li>
							<li><a href="#">&nbsp;&nbsp;번역/통역</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;경영자문/운영지원</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;경영자문/운영지원</span>
							<li><a href="#">&nbsp;&nbsp;사업계획</a></li>
							<li><a href="#">&nbsp;&nbsp;스타트업 자문</a></li>
							<li><a href="#">&nbsp;&nbsp;기업 자문</a></li>
							<li><a href="#">&nbsp;&nbsp;업종별 창업</a></li>
							<li><a href="#">&nbsp;&nbsp;비즈니스 문서</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;주문제작</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;주문제작</span>
							<li><a href="#">&nbsp;&nbsp;인쇄/판촉물</a></li>
							<li><a href="#">&nbsp;&nbsp;시공</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<li><a href="#">&nbsp;&nbsp;세무/법무/노무</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;세무/법무/노무</span>
							<li><a href="#">&nbsp;&nbsp;법무</a></li>
							<li><a href="#">&nbsp;&nbsp;세무/회계</a></li>
							<li><a href="#">&nbsp;&nbsp;지식재산권 보호</a></li>
							<li><a href="#">&nbsp;&nbsp;노무</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<span class="bold">&nbsp;&nbsp;N잡·커리어</span>
					<li><a href="#">&nbsp;&nbsp;취업/입시/노하우/직무역량</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;취업/입시/노하우/직무역량</span>
							<li><a href="#">&nbsp;&nbsp;취업/이직</a></li>
							<li><a href="#">&nbsp;&nbsp;입시/자격증</a></li>
							<li><a href="#">&nbsp;&nbsp;투잡/재테크</a></li>
							<li><a href="#">&nbsp;&nbsp;전자책/VOD</a></li>
							<li><a href="#">&nbsp;&nbsp;데이터/개발 레슨</a></li>
							<li><a href="#">&nbsp;&nbsp;실무/자기개발 레슨</a></li>
							<li><a href="#">&nbsp;&nbsp;외국어 레슨</a></li>
							<li><a href="#">&nbsp;&nbsp;디자인/영상 레슨</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
					<span class="bold">&nbsp;&nbsp;취미·생활</span>
					<li><a href="#">&nbsp;&nbsp;취미/생활</a>
						<ul>
							<span class="bold">&nbsp;&nbsp;취미/생활</span>
							<li><a href="#">&nbsp;&nbsp;뷰티/운동</a></li>
							<li><a href="#">&nbsp;&nbsp;댄스/뮤직</a></li>
							<li><a href="#">&nbsp;&nbsp;미술/글쓰기</a></li>
							<li><a href="#">&nbsp;&nbsp;공예/취미</a></li>
							<li><a href="#">&nbsp;&nbsp;웨딩</a></li>
							<li><a href="#">&nbsp;&nbsp;청소/수리/설치</a></li>
							<li><a href="#">&nbsp;&nbsp;기타</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li><a href="#">공지사항</a>
				<ul>
					<li><a href="#">&nbsp;&nbsp;공지사항</a></li>
					<li><a href="#">&nbsp;&nbsp;이벤트</a></li>
					<li><a href="#">&nbsp;&nbsp;사이트 사용법</a></li>
				</ul>
			</li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">Prime</a></li>
			<li><a href="#">마이페이지</a>
				<c:choose>
					<c:when test="${isLogOn == true and not empty memberInfo == member_id }">
					<ul>
						<li><a href="#">&nbsp;&nbsp;기본 정보</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 정보 수정</a></li>
						<li><a href="#">&nbsp;&nbsp;장바구니</a></li>
						<li><a href="#">&nbsp;&nbsp;구매 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;문의 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;주문 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;My 포인트</a></li>
						<li><a href="#">&nbsp;&nbsp;My 게시글 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 탈퇴</a></li>
					</ul>
					</c:when>
					<c:when test="${isLogOn == true and not empty memberInfo == company_id }">
					<ul>
						<li><a href="#">&nbsp;&nbsp;기본 정보</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 정보 수정</a></li>
						<li><a href="#">&nbsp;&nbsp;상품 문의 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;판매 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;스케줄 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;My 상품 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;My 게시글 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;회원 탈퇴</a></li>
					</ul>
					</c:when>
				</c:choose>
				<c:if test="${isLogOn == true and memberInfo.member_id =='admin' }">  
	   	   			<ul>
	   	   				<li><a href="#">&nbsp;&nbsp;등록 회원 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;등록 사업체 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;상품 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;문의 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;신고 내역</a></li>
						<li><a href="#">&nbsp;&nbsp;게시판 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;전체 주문 조회</a></li>
						<li><a href="#">&nbsp;&nbsp;매출 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;이벤트 관리</a></li>
						<li><a href="#">&nbsp;&nbsp;관리자 게시물 등록</a></li>
					</ul>	
	    		</c:if> 
			</li>
		</ul>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
	</div>
</body>
</html>