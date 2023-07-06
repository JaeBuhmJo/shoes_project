<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
 
    <link rel="stylesheet" type="text/css" href="/assets/css/cart.css">
    <div class="container py-5">
    
        <div class="cart__information bg-ligth">
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
              	    <th class="td_width_3">이미지</th>
					<th class="td_width_4">상품정보</th>
					<th class="td_width_5">단가</th>
					<th class="td_width_6">수량</th>
					<th class="td_width_7">합계 금액</th>
	             </tr>
	         </thead>             			
           	 <tbody>
      	 		
           	 	<c:forEach var="cart" items="${cartList}" varStatus="status">
           	 	
	           	 	<tr class="cart__list__detail">								
	                 	<td>
	                 		<input type="checkbox" name="cbox" id="checkbox2" value="${cart.cartId}" data-cartId="${clist.cartId}">
             		        <input type="hidden" class="individual_cartPrice_input" value="${ci.Price}">
							<input type="hidden" class="individual_cartAmount_input" value="${ci.cartAmount}">
							<input type="hidden" class="individual_totalPrice_input" value="${ci.discountPrice * ci.cartamount}">
							<input type="hidden" class="individual_productId_input" value="${ci.productId}">	
		                </td>
		                <td>
		                 	<img src="/attachment/file?fileName=${cart.filePath}" alt="">
	                	</td>
		                <td>
		                 	<span class="cart__list__smartstore "><b>${cart.productName}</b> </span>
		                 	<br />
		                 	<br />
		                 	<br />
		                    <span class="">색상 : ${cart.productColor } / 사이즈 : ${cart.productSize }</span>
		    			</td>
		                <td>
		                    <span class="price">${cart.price}원</span>
		    			</td>
					    <td class="cart__list__option">
					        <p>수량 : <span class="productCount">${cart.cartAmount}</span>개</p>                 
					    </td>
					    <td>			 
					    	<span class="totalPrice" data-price="${cart.price * cart.cartAmount}">${cart.price * cart.cartAmount}원</span>
					    	<br>
					    </td>
					</tr>
           	 	</c:forEach>
	      	</tbody>  
		</table> 
		<a href="/cart/dump" id="cartdump"><button type="button" >장바구니 비우기</button></a>
		
		<form action="/cart/order" method="get" id="orderForm">
		
		</form>
        <div class="total">
            <h2>전체합계</h2>
            <table>
                <tr> 
                    <td><span id="totalKind_span">구매 상품 종류</span></td>
                    <td><span id="totalCount_span">${cartTotal.totalKind}</span></td>
                </tr>
                <tr>
                    <td><span id="totalKind_span">총 구매 수량</span></td>
                    <td><span id="totalCount_span">${cartTotal.totalCount}</span></td>
                </tr>
                <tr>
                    <td><span id="finalTotalkind_span">전체 주문금액</span></td>
                    <td><span id="finalTotalPrice_span text-danger">${cartTotal.totalPrice}</span></td>
                </tr>
            </table>
            <div class="cart__mainbtns">
	          <button class="cart__bigorderbtn left" >쇼핑 계속하기</button>
	          <button class="cart__bigorderbtn right" id="orderBtn" onclick="" >주문하기</button>
         	</div>
       	</div>             
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
		</div>
		<script>  
		const csrfToken='${_csrf.token}';
		</script>
  
    <script src="/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/templatemo.js"></script>
	<script src="/js/cart.js"></script> 
	<!-- 아임포트 결제 라이브러리 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="/js/iamport.js"></script>    
<%@ include file="include/footer.jsp" %>