<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome 재범Shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <link rel="stylesheet" href="/assets/css/cart.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/css/cart.css">
    
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
			
			// 전체 합계 금액 
			
		});
		
		// 선택 삭제
		
		
		
		

		
		 /* // 수량 플러스 
		$('.plus_btn').click(function(){
			
			const numberText = $(this).parents('.cart__list__option').find('.productCount');
			let thisNumber = Number(numberText.text());
			thisNumber++;
			numberText.text(thisNumber);
			
			const $totalPrice = $(this).parents('.cart__list__detail').find('.totalPrice');
			
			
			let parserPrice = Number(numberParser($totalPrice.text()))
			const culPrice = parserPrice + Number($totalPrice.data('price'))
			$totalPrice.text(culPrice.toLocaleString() + '원')
		})
		
		// 수량 마이너스
		$('.minus_btn').click(function(){
			
			const numberText = $(this).parents('.cart__list__option').find('.productCount');
			let thisNumber = Number(numberText.text());
			if(thisNumber == 1){
				return false;
			}
			thisNumber--;
			numberText.text(thisNumber);
			let parserPrice = Number(numberParser($('.totalPrice').text()))
			const culPrice = parserPrice - Number($('.totalPrice').data('price'))
			$('.totalPrice').text(culPrice.toLocaleString() + '원')
		 })
		
		function numberParser(str){
			str = str.replace(',','');
			str = str.replace('원','');
			return str;
		}  */
		
		
		
});
</script>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />  
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
             	<tr class="cart__list__detail">
                 	<td>
                 		<input type="checkbox" name="cbox" id="checkbox2">
	                </td>
	                <td>
	                 	<img src="" alt="나이키 슬리퍼">
                	</td>
	                <td>
	                 	<span class="cart__list__smartstore">나이키 슬리퍼</span>
	                    <p>편하게 신을수 있는 슬리퍼</p>
	                    <span class="price">30,000원</span>
	                    <span style="text-decoration: line-through; color: lightgray;">00,000</span>
	    			</td>
				    <td class="cart__list__option">
				        <p>수량 : <span class="productCount">1</span>개</p>                 
				    </td>
				    <td>			 
				    	<span class="totalPrice" data-price="30000">30,000원</span>
				    	<br>
				    </td>
		    		<td>무료</td>
				</tr>
				<tr class="cart__list__detail">
				   <td>
                 		<input type="checkbox" name="cbox" id="checkbox2">
	                </td>
	                <td>
	                 	<img src="" alt="아디다스 운동화">
                	</td>
	                <td>
	                 	<span class="cart__list__smartstore">아디다스 운동화</span>
	                    <p> 걸음이 편한 운동화</p>
	                    <span class="price">70,000원</span>
	                    <span style="text-decoration: line-through; color: lightgray;">00,000</span>
	    			</td>
				    <td class="cart__list__option">
				        <p>수량 : <span class="productCount">1</span>개</p>                 
				    </td>
				    <td>			 
				    	<span class="totalPrice" data-price="70000">70,000원</span>
				    	<br>
				    </td>
		    		<td>무료</td>
	            </tr>            
	      	</tbody>
		</table>
		
		<div class="right-align basketrowcmd">
                <a class="abutton1" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a class="abutton2" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
       
        <div class="total">
            <h2>전체합계</h2>
            <table>
                <tr>
                    <td><span id="totalKind_span">상품수</span></td>
                    <td><span id="totalCount_span">2</span></td>
                </tr>
                <tr>
                    <td><span id="totalKinds_span">상품금액</span></td>
                    <td><span id="totalamount_span">00,000</span></td>
                </tr>
                <tr>
                    <td><span id="disCounts_span">할인금액</span></td>
                    <td><span id="disCount_span">-1,000</span></td>
                </tr>
                <tr>
                    <td><span id="shipprice_span">배송비</span></td>
                    <td><span id="shipfree_span">무료</span></td>
                </tr>
                <tr>
                    <td><span id="finalTotalkind_span">전체 주문금액</span></td>
                    <td><span id="finalTotalPrice_span">00,000</span></td>
                </tr>
            </table>
            <div class="cart__mainbtns">
	          <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
	          <button class="cart__bigorderbtn right" onclick="location.href='/cart/order?order=1'" >주문하기</button>
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
		<form action="/cart/delete" method="post" class="quantity_delete_form">
			<input type="hidden" name="cart_id" class="delete_cart_id">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>		
				
		<!-- 주문 form -->
		<form action="location.href='/cart/order?order=1'" method="get" class="order_form">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
		</form>	
		<script>
		const csrfToken='${_csrf.token}';
		</script>
    </section>
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>