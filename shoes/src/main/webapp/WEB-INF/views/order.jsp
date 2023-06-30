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

    <link rel="stylesheet" href="/assets/css/order.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/css/order.css">
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 
    
    
    
    <!-- Main Theme files-->
    <!-- <script src="/assets/js/sliders-init.js"></script> -->
    <!-- <script src="/assets/js/theme.js"></script> -->
    
    <script src="/assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    
    <!-- iamport 결제에 필요한것들 -->
    <!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    
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
			
			 
			   // 회원정보 가져와서 배송정보 입력 필드에 설정
			//    var userDetails = {
			//        memberId: "${userDetails.memberId}",
			//        name: "${userDetails.name}",
			//        phone: "${userDetails.phone}",
		    //        address: "${userDetails.address}"
			//    };
			
			    // 값 설정
			//    document.getElementById("memberIdInput").value = userDetails.memberId;
			//    document.getElementById("nameInput").value = userDetails.name;
			//    document.getElementById("phoneInput").value = userDetails.phone;
			//    document.getElementById("addressInput").value = userDetails.address;
			
			
	   	});
		
		 	
});
</script>


<body>
	
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
             		        <input type="hidden" class="individual_bookPrice_input" value="${ci.Price}">
							<input type="hidden" class="individual_salePrice_input" value="${ci.discountPrice}">
							<input type="hidden" class="individual_bookCount_input" value="${ci.cartamount}">
							<input type="hidden" class="individual_totalPrice_input" value="${ci.discountPrice * ci.cartamount}">
							<input type="hidden" class="individual_bookId_input" value="${ci.productId}">	
		                </td>
		                <td>
		                 	<img src="" alt="나이키 슬리퍼">
	                	</td>
		                <td>
		                 	<span class="cart__list__smartstore">${cart.productName}나이키 슬리퍼 </span>
		                    <p>편하게 신을수 있는 슬리퍼</p>
		                    <span class="price">${cart.price}원</span>
		                    <span style="text-decoration: line-through; color: lightgray;">${cart.discountPrice}00,000원</span>
		    			</td>
					    <td class="cart__list__option">
					        <p>수량 : <span class="productCount">${cart.cartamount}</span>개</p>                 
					    </td>
					    <td>			 
					    	<span class="totalPrice" data-price="${cart.price}">${cart.totalPrice}30,000원</span>
					    	<br>
					    </td>
			    		<td>무료</td>
					</tr>
           	 	</c:forEach>
	      	</tbody>
		</table>
                  
                    
                <!-- 배송정보 -->
                    <article class="delivery">
				    <form class="col-md-9 m-auto" method="get" role="form">
				        <h1>배송정보</h1>
				        <table>
				            <tr>
				                <td>아이디</td>
				                <td><input type="text" name="memberId" id="memberIdInput" value="${userDetails.memberId }" readonly></td>
				            </tr>
				            <tr>
				                <td>수령자 이름</td>
				                <td><input type="text" name="orderer" id="nameInput" value="${userDetails.name }"  readonly></td>
				            </tr>
				            <tr>
				                <td>연락처</td>
				                <td>
				                    <input type="text" name="hp" id="phoneInput"  value="${userDetails.phone }" readonly>
				                    <span>- 포함 입력</span>
				                </td>
				            </tr>
				            <tr>
				                <td>주소</td>
				                <td>
				                    <input type="text" name="addr1" id="addressInput"  value="${userDetails.address }" readonly>
				                </td>
				            </tr>
				        </table>
				    </form>
				</article> 
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
                        <input type="submit" value="결제하기">
                    </div>

                    
                    
                    <!-- 결제방법 -->
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <p>
                                <button type="button" id="pay_btn"  onclick="requestPay({{ auth()->check() }})">
								  <img src="/assets/img/kakaopay.png" alt="카카오페이">
								</button>
                            </p>
                        </div>
                    </article>
                    
                    <!-- 경고 -->
                    <article class="alert">
                        <ul>
                            <li><span>BLACKPEARL은 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 BLACKPEAR 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.
                            </span></li>
                            <li><span>BLACKPEAR 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.
                            </span></li>
                        </ul>
                    </article>
               </form>
            </section>
        </main>
	       
	
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>