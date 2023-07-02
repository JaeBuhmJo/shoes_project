<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome 재범Shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/assets/css/cart.css">

    <!-- Load fonts style after rendering the layout styles -->
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 
    <!-- Main Theme files-->
    <!-- <script src="/assets/js/sliders-init.js"></script> -->
    <!-- <script src="/assets/js/theme.js"></script> -->
    <script src="/assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    
    
</head>
<script type="text/javascript">
$(function(){
		
	// 서버로 전송할 데이터
	const form = {
		memberId : '${member.memberId}',
		productId :  '${Order_list.productId}',
		cartamount : ''
	}
	
		// 전체 선택 및 해제
		$("#cboxAll").click(function () {
			// 체크 동작
			 if ($(this).is(":checked")) {
			   $("input[name=cbox]").prop("checked", true);
			 } else {
			   $("input[name=cbox]").prop("checked", false);
			 }					 
		});
	
		
		$("input[name=cbox]").click(function(){
			// 체크 동작
			if($("input[name=cbox]").length == $("input[name=cbox]:checked").length){
				$("#cboxAll").prop("checked", true)
			}else{
				$("#cboxAll").prop("checked", false)
			}
				 
			
		});
		
		 // 카트 선택 삭제
		 $(".abutton1").click(function () {
         $("input[name=cbox]:checked").each(function () {
             var cartId = $(this).data("cartId");
         // 선택된 상품을 삭제하는 로직을 추가하세요
         $(this).closest(".cart__list__detail").remove();
          });
       });
		 
		 // 카트 전체 삭제
		 $(".abutton2").click(function () {
         $(".cart__list__detail").remove();
        });
		 
		 // 전체 합계 금액
		 
	 $("input[name=cbox]").click(function () {
         var totalKind = $("input[name=cbox]:checked").length;
         var totalAmount = 0;
         var discount = 0;
         var shipPrice = 0;
         var finalTotalPrice = 0;

  	$("input[name=cbox]:checked").each(function () {
   		 var price = $(this).closest(".cart__list__detail").find(".price").text();
    	 price = price.replace(/[^0-9]/g, "");
   		 totalAmount += parseInt(price);
     });

         finalTotalPrice = totalAmount - discount;

	  $("#totalCount_span").text("상품수: " + totalKind);
	  $("#totalCount_span").text(totalKind);
	  $("#totalamount_span").text("상품금액: " + totalAmount.toLocaleString() + "원");
	  $("#totalamount_span").text(totalAmount.toLocaleString());
	  $("#disCount_span").text("할인금액: " + discount.toLocaleString() + "원");
	  $("#disCount_span").text(discount.toLocaleString());
	  $("#shipfree_span").text("배송비: " + shipPrice.toLocaleString() + "원");
	  $("#shipfree_span").text(shipPrice.toLocaleString());
	  $("#finalTotalPrice_span").text("전체 주문금액: " + finalTotalPrice.toLocaleString() + "원");
	  $("#finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	});
		
		
    //	$('#orderBtn').click(function(){
	//		$("input[name=cbox]:checked").each(function(){
	//			$('#orderForm').append('<input type="hidden" name="cartIdList['+i+'].memberId" value="' + $(this).val() +'"/>')
	//		})
	//		
	//		$('#orderForm').submit();
	//	 })
	  // 상품 정보를 결제 페이지로 전달하는 로직 추가
		 var form = document.createElement('form');
		 form.method = 'POST';
		 form.action = 'order.jsp'; // 결제 페이지 URL 설정

		 selectedProducts.forEach(function(product) {
	 	 var input = document.createElement('input');
		 input.type = 'hidden';
		 input.name = 'selectedProducts[]'; // 상품 정보 배열을 전달하므로 '[]'를 추가하여 배열로 처리
		 input.value = JSON.stringify(product);
		 form.appendChild(input);
	});

		document.body.appendChild(form);
	 	form.submit();
		}
		
	});
</script>
<body>
 
   	<section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        
        
        
		 <table class="cart__list">
	         <thead>
	             <tr>
	                <th>
                 	 	<input type="checkbox" id="cboxAll" name="cboxAll">
               		</th>
              	    <th class="td_width_3">상품정보</th>
					<th class="td_width_4">판매가</th>
					<th class="td_width_5">수량</th>
					<th class="td_width_6">합계</th>
					<th class="td_width_7">배송비</th>         
	             </tr>
	         </thead>             			
           	 <tbody>
      	 		
           	 	<c:forEach var="cart" items="${cartList}" varStatus="status">
           	 	
	           	 	<tr class="cart__list__detail">								
	                 	<td>
	                 		<input type="checkbox" name="cbox" id="checkbox2" value="${cart.cartId}" data-cartId="${clist.cartId}">
             		        <input type="hidden" class="individual_cartPrice_input" value="${ci.Price}">
							<input type="hidden" class="individual_discountPrice_input" value="${ci.discountPrice}">
							<input type="hidden" class="individual_cartAmount_input" value="${ci.cartamount}">
							<input type="hidden" class="individual_totalPrice_input" value="${ci.discountPrice * ci.cartamount}">
							<input type="hidden" class="individual_productId_input" value="${ci.productId}">	
		                </td>
		                <td>
		                 	<img src="${cart.attachmentList[0].filePath}" alt="나이키 슬리퍼">
	                	</td>
		                <td>
		                 	<span class="cart__list__smartstore">${cart.productName}나이키 슬리퍼 </span>
		                    <p>${cart.detail}</p>
		                    <span class="price">${cart.price}원</span>
		                    <span style="text-decoration: line-through; color: lightgray;">${cart.discountPrice}원</span>
		    			</td>
					    <td class="cart__list__option">
					        <p>수량 : <span class="productCount">${cart.cartamount}</span>개</p>                 
					    </td>
					    <td>			 
					    	<span class="totalPrice" data-price="${cart.price * cart.cartAmount}">${cart.price * cart.cartAmount}원</span>
					    	<br>
					    </td>
			    		<td>무료</td>
					</tr>
           	 	</c:forEach>
	      	</tbody>
		</table>
		
		<form action="/cart/order" method="get" id="orderForm">
		
		</form>
		
		<div class="right-align basketrowcmd">
                <a class="abutton1" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a class="abutton2" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
       
        <div class="total">
            <h2>전체합계</h2>
            <table>
                <tr>
                    <td><span id="totalKind_span">상품수</span></td>
                    <td><span id="totalCount_span">${totalCount}</span></td>
                </tr>
                <tr>
                    <td><span id="totalKinds_span">상품금액</span></td>
                    <td><span id="totalamount_span">${price}</span></td>
                </tr>
                <tr>
                    <td><span id="disCounts_span">할인금액</span></td>
                    <td><span id="disCount_span">${discountAmount}</span></td>
                </tr>
                <tr>
                    <td><span id="shipprice_span">배송비</span></td>
                    <td><span id="shipfree_span">무료</span></td>
                </tr>
                <tr>
                    <td><span id="finalTotalkind_span">전체 주문금액</span></td>
                    <td><span id="finalTotalPrice_span">${totalPrice}</span></td>
                </tr>
                
            </table> 
            <div class="cart__mainbtns">
	          <button class="cart__bigorderbtn left" >쇼핑 계속하기</button>
	          <button class="cart__bigorderbtn right" id="orderBtn" onclick="location.href='/cart/order?order=1'" >주문하기</button>
         	</div>
       	</div>
       	
       
       		
       	
       	
       <!-- 수량 조정 form -->
		<form action="/cart/update" method="post" class="quantity_update_form">
			<input type="hidden" name="cart_id" class="update_cartId">
			<input type="hidden" name="cart_amount" class="update_cart_amount">
			<input type="hidden" name="member_id" value="${member.memberId}">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>	 
				  
		<!-- 삭제 form -->
		<form action="/cart/delete" method="post" class="abutton1_delete_form">
			<input type="hidden" name="cartId" class="delete_cart_id">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>		
				
		<!-- 주문 form -->
		<form action="location.href='/cart/order?order=1'" method="get" class="order_form">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
		</form>	
		<form action="" id="operForm">
			<input type="hidden" name="page" value="1"/>
			<input type="hidden" name="listAmount" value="15"/>
			<input type="hidden" name="searchType" value=""/>
			<input type="hidden" name="keyword" value=""/>
			<input type="hidden" name="order" value="registered-date-desc"/>
		</form> 
		<script>
		const csrfToken='${_csrf.token}';
		</script> 
    </section>
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="/js/cart.js"></script>
</body>
</html>
