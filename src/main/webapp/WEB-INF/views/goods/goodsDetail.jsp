<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
 <%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}

#close {
	z-index: 4;
	float: right;
}
</style>
<script type="text/javascript">

	function add_cart(goods_id,order_goods_qty) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id,
				order_goods_qty:$('#order_goods_qty').val()
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}

	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
	
function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	 if(isLogOn=="false" || isLogOn=='' ){
		alert("로그인 후 주문이 가능합니다!!!");
	} 
	
	
		var total_price,final_total_price;
		var order_goods_qty=document.getElementById("order_goods_qty");
		
		var formObj=document.createElement("form");
		var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=order_goods_qty.value;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
	}	
</script>
</head>
<body>
	<h2>비즈니스 &gt; 디자인 &gt; 로고디자인</h2>
	<div class="tabs-wrap post-library">      
	  <div class="tabs-content">
	    <div class="tab-content active imgc" data-tab="tab-1">
	      <img src="${contextPath}/resources/image/image_1.jpg" alt="">
	      <a href=""
	         title="" 
	         data-fancybox="images-preview" 
	         class="zoom">
	        <i class="fa fa-arrows-alt"></i>
	      </a>
	    </div>
	    <div class="tab-content imgc" data-tab="tab-2">
	      <img src="" alt="">
	      <a href=""
	         title="" 
	         data-fancybox="images-preview" 
	         class="zoom">
	        <i class="fa fa-arrows-alt"></i>
	      </a>
	    </div>
	    <div class="tab-content imgc" data-tab="tab-3">
	      <img src="" alt="">
	      <a href=""
	         title="" 
	         data-fancybox="images-preview" 
	         class="zoom">
	        <i class="fa fa-arrows-alt"></i>
	      </a>
	    </div>  
	    <div class="tab-content imgc" data-tab="tab-4">
	      <img src="" alt="">
	      <a href=""
	         title="" 
	         data-fancybox="images-preview" 
	         class="zoom">
	        <i class="fa fa-arrows-alt"></i>
	      </a>
	    </div>
	  </div>
	  <div class="tabs">
	    <a href="#" class="tab active" data-tab="tab-1">
	      <span class="imgc">
	        <img src="${contextPath}/resources/image/image_3.jpg" alt="">
	      </span>
	    </a>
	    <a href="#" class="tab" data-tab="tab-2">
	      <span class="imgc">
	        <img src="${contextPath}/resources/image/image_4.jpg" alt="">
	      </span>
	    </a>
	    <a href="#" class="tab" data-tab="tab-3">
	      <span class="imgc">
	        <img src="${contextPath}/resources/image/image_5.jpg" alt="">
	      </span>
	    </a>       
	    <a href="#" class="tab" data-tab="tab-4">
	      <span class="imgc">
	        <img src="${contextPath}/resources/image/image_6.jpg" alt="">
	      </span>
	    </a>
	  </div>
	  <a href=""
	     data-fancybox="images-preview"
	     data-thumbs='{"autoStart":true}'
	     title="" 
	     class="tab-more">
	    <div class="imgc">
	       <img src="${contextPath}/resources/image/image_2.jpg" alt="">
	      <div class="text-wrap">
	        <span style="font-size: 0.8em">이미지 더보기</span>
	      </div>
	    </div>
	  </a>
	  <div style="display: none;">
	    <a href="" 
	       data-fancybox="images-preview" 
	       data-thumb=""></a>
	
	    <a href="" 
	       data-fancybox="images-preview" 
	       data-thumb=""></a>
	
	    <a href=""
	       data-fancybox="images-preview" 
	       data-thumb=""></a>
	
	    <a href="" 
	       data-fancybox="images-preview" 
	       data-thumb=""></a>
	
	    <a href="" 
	       data-fancybox="images-preview" 
	       data-thumb="https://source.unsplash.com/hBYzBU1xP6s/240x160"></a>
	  </div>
	</div>
	<%-- <div id="goods_image">
		<figure>
			<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
		</figure>
	</div> --%>
	
	<!-- 내용 들어 가는 곳 -->
	<div id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품 설명</a></li>
			<li><a href="#tab2">가격 정보</a></li>
			<li><a href="#tab3">수정·재진행</a></li>
			<li><a href="#tab4">취소·환불</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<h4>책소개</h4>
				<p>${fn:replace(goods.goods_intro,crcn,br)}</p>
				<c:forEach var="image" items="${imageList }">
					<img 
						src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</div>
			<div class="tab_content" id="tab2">
				<h4>저자소개</h4>
				<p>
				<div class="writer">저자 : ${goods.goods_writer}</div>
				 <p>${fn:replace(goods.goods_writer_intro,crcn,br) }</p> 
				
			</div>
			<div class="tab_content" id="tab3">
				<h4>책목차</h4>
				<p>${fn:replace(goods.goods_contents_order,crcn,br)}</p> 
			</div>
			<div class="tab_content" id="tab4">
				<h4>출판사서평</h4>
				 <p>${fn:replace(goods.goods_publisher_comment ,crcn,br)}</p> 
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/resources/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
			<form action='${contextPath}/cart/myCartList.do'  >				
				<input  type="submit" value="장바구니 보기">
			</form>
		</div>
	</div>	
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>