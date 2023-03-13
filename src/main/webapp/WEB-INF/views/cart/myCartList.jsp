<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<c:set  var="finalGoodsPrice" value="0" /> <!-- 총 배송금액 -->
<c:set  var="totalGoodsPrice" value="0" /> <!-- 총 배송금액 -->
<head>
<script type="text/javascript">






function calcGoodsPrice(bookPrice,obj,goods_id,bookSPrice,index,delivery){
    let totalPrice,final_total_price,totalNum;   
    let p_final_totalPrice=document.getElementById("p_final_totalPrice");
    let h_final_total_price=document.getElementById("h_final_totalPrice");
    
   let p_totalNum=document.getElementById("p_totalGoodsNum");
   let h_totalNum=document.getElementById("h_totalGoodsNum");
   
   let p_totalPrice=document.getElementById("p_totalGoodsPrice");
   let h_totalPrice=document.getElementById("h_totalGoodsPrice");
   
   let p_totalSalesPrice=document.getElementById("p_totalSalesPrice");
   let h_totalSalesPrice=document.getElementById("h_totalSalesPrice");
   
   let p_totalDeliveryPrice=document.getElementById("p_totalDeliveryPrice");
   let h_totalDeliveryPrice=document.getElementById("h_totalDeliveryPrice");
   //내 변수
   let rNum, rPrice, rDelivery, rSales, rFinalPrice, fffinalPrice;
   
   var length=document.frm_order_all_cart.cart_goods_qty.length;
      var _cart_goods_qty=0;
      if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
         _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;      
      }else{
         _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
      }
      
   var goods_qty=_cart_goods_qty;//=document.getElementById("cart_goods_qty");

  
   if(obj.checked==true){
      totalNum=Number(h_totalNum.value)+1;
      rNum =Number(h_totalNum.value)+1;
      rFinalPrice = Number(h_final_total_price.value) + (Number(bookSPrice)*Number(goods_qty));
      rPrice = Number(h_totalPrice.value) + (Number(bookPrice)*Number(goods_qty));
      rSales =( Number(h_totalSalesPrice.value) + ( (Number(bookPrice)-Number(bookSPrice)) * Number(goods_qty) ));
      rDelivery = Number(h_totalDeliveryPrice.value) + Number(delivery) ;
      //fffinalPrice = rFinalPrice + rDelivery;
   }else{
      totalNum=Number(h_totalNum.value)-1;
      rNum =Number(h_totalNum.value)-1;
      rFinalPrice = Number(h_final_total_price.value) - (Number(bookSPrice)*Number(goods_qty));
      rPrice = Number(h_totalPrice.value) - (Number(bookPrice)*Number(goods_qty));
      rSales =( Number(h_totalSalesPrice.value) - ( (Number(bookPrice)-Number(bookSPrice)) * Number(goods_qty) ));
      
      rDelivery = Number(h_totalDeliveryPrice.value) - Number(delivery) ;
      //fffinalPrice = rFinalPrice - rDelivery;
   }   
   
   h_totalNum.value=totalNum;
   p_totalNum.innerHTML=totalNum;

   h_totalSalesPrice.value = rSales;
   p_totalSalesPrice.innerHTML = rSales;
   
   h_totalPrice.value= rPrice;      // 총 상품금액
   p_totalPrice.innerHTML= rPrice;   // 총 상품금액
   
   h_totalDeliveryPrice.value = rDelivery;
   p_totalDeliveryPrice.innerHTML = rDelivery;
   

   fffinalPrice =Number(h_totalPrice.value)+ Number(h_totalDeliveryPrice.value) - Number(h_totalSalesPrice.value);
   
   h_final_total_price.value=fffinalPrice;//rFinalPrice;      // 최종 결제금액
   p_final_totalPrice.innerHTML=fffinalPrice;//rFinalPrice;   // 최종 결제금액
}





function modify_cart_qty(goods_id,bookPrice,index){
   //alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
   if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
      _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;      
   }else{
      _cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
   }
      
   var cart_goods_qty=Number(_cart_goods_qty);
   //alert("cart_goods_qty:"+cart_goods_qty);
   //console.log(cart_goods_qty);
   $.ajax({
      type : "post",
      async : false, //false인 경우 동기식으로 처리한다.
      url : "${contextPath}/cart/modifyCartQty.do",
      data : {
         goods_id:goods_id,
         cart_goods_qty:cart_goods_qty
      },
      
      success : function(data, textStatus) {
         //alert(data);
         if(data.trim()=='modify_success'){
            alert("수량을 변경했습니다!!");   
            location.reload("");
         }else{
            alert("다시 시도해 주세요!!");   
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

function delete_cart_goods(cart_id){
   var cart_id=Number(cart_id);
   var formObj=document.createElement("form");
   var i_cart = document.createElement("input");
   i_cart.name="cart_id";
   i_cart.value=cart_id;
   
   formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartGoods.do";
    formObj.submit();
}

function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
   var total_price,final_total_price,_goods_qty;
   var cart_goods_qty=document.getElementById("cart_goods_qty");
   
   _order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
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
    i_order_goods_qty.value=_order_goods_qty;
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

function fn_order_all_cart_goods(){
//   alert("모두 주문하기");
   var order_goods_qty;
   var order_goods_id;
   var objForm=document.frm_order_all_cart;
   var cart_goods_qty=objForm.cart_goods_qty;
   var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
   var checked_goods=objForm.checked_goods;
   var length=checked_goods.length;
   
   
   //alert(length);
   if(length>1){
      for(var i=0; i<length;i++){
         if(checked_goods[i].checked==true){
            order_goods_id=checked_goods[i].value;
            order_goods_qty=cart_goods_qty[i].value;
            cart_goods_qty[i].value="";
            cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
            //alert(select_goods_qty[i].value);
            console.log(cart_goods_qty[i].value);
         }
      }   
   }else{
      order_goods_id=checked_goods.value;
      order_goods_qty=cart_goods_qty.value;
      cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
      //alert(select_goods_qty.value);
   }
      
    objForm.method="post";
    objForm.action="${contextPath}/order/orderAllCartGoods.do";
   objForm.submit();
}

</script>
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

button {
  /* 생략 */
  margin: 0;
  padding: 0.5rem 1rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  color:white;
  display: inline-block;
  width: auto;
  border: none;
  border-radius: 4px;
  margin-bottom:10px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  cursor: pointer;
  transition: 0.5s;
  background-color:#f89b00;
}
.option{
         margin-bottom:5px;
 }
 .option1{
         margin-bottom:5px;
 }
 
</style>
</head>
<body>
   <table class="list_view">
      <tbody align=center >
         <tr>
         <td class="clear"></td>
            <td class="fixed" >상품이미지</td>
            <td>업체명</td>
            <td class="fixed">상품명</td>
            <td>옵션 및 수량</td>
            <td>금액</td>
         </tr>
         
          <c:choose>
             <c:when test="${ empty myCartList }">
                <tr>
                   <td colspan=5 class="fixed"><strong>장바구니에 상품이 없습니다.</strong></td>
                </tr>
            </c:when>
             <c:otherwise>
                <tr>       
                     <form name="frm_order_all_cart">
                      <c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
                      <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
                      <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
                     <td><input type="checkbox" id="checked_goods" name="checked_goods"  checked  value="${item.goods_id }"  onClick="calcGoodsPrice(${item.goods_sales_price },this,${item.goods_id },${item.goods_sales_price*0.9 },${cnt.count-1 },${item.goods_delivery_price })"></td>
                     <td class="goods_image">
                        <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
                           <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
                        </a>
                     </td>
                     <td ><span>${item.goods_publisher }</span></td>
                     <td>
                        <h2>
                           <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title } <span style="font-size: 5;">(${item.goods_id })</span></a>
                        </h2>
                     </td>
                     <td>
                     <div class="option">
                     <select>
         <option value="select">옵션</option>
         <option>STANDARD</option>
         <option>DELUXE</option>
         <option>PREMIUM</option>
         </select>
         </div>
                   <div class="option1">
                        <input type="text" id="cart_goods_qty" name="cart_goods_qty" size=3 value="${cart_goods_qty}"><br>
                        </div>
                        <a href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price*0.9 },${cnt.count-1 });" >
                            <img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
                        </a>
                     </td>
                    
                     
                     <td>
                        <strong>
                         <fmt:formatNumber  value="${item.goods_sales_price*0.9*cart_goods_qty}" type="number" var="total_sales_price" />
                           ${total_sales_price}원
                        </strong> </td>
                     <td>
                   
                        <a href="#"> 
                          <button id="abcd">변경</button>
                        </a><br> 
                        <a href="javascript:delete_cart_goods('${cart_id}');"> 
                          <button id="abcd">삭제</button>
                        </a>
                     </td>
               </tr>
            <c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_sales_price*cart_goods_qty }" />
            <c:set  var="totalDeliveryPrice" value="${totalDeliveryPrice+item.goods_delivery_price }" />
            <c:set  var="finalGoodsPrice" value="${finalGoodsPrice+item.goods_sales_price*0.9*cart_goods_qty+totalDeliveryPrice }" /> <!-- totalGoodsPrice+item.goods_sales_price*0.9*cart_goods_qty -->
            <%-- <c:set  var="totalDiscountedPrice" value="${(totalGoodsPrice-finalGoodsPrice) }" /> --%>
            <c:set  var="totalDiscountedPrice" value="${totalDiscountedPrice+item.goods_sales_price*0.1*cart_goods_qty}" />
            <c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
            </c:forEach>
          
      </tbody>
   </table>
        
   <div class="clear"></div>
    </c:otherwise>
   </c:choose> 
   <br>
   <br>
   
   <center>
    <br><br>   
       <a href="javascript:fn_order_all_cart_goods()">
          <button class="delete">전체삭제</button>
       </a>
       <a href="#">
          <button>주문하기</button>
       </a>
   <center>
</form>   