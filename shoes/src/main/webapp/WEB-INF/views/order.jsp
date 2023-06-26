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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
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
		} */ 
		
		
		
});
</script>


<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	
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
                  
                    
                <!-- 배송정보 -->
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <table>
                              <tr>
                                <td>아이디</td>
                                <td><input type="text" name="member_id"></td>
                            </tr>
                            <tr>
                                <td>수령자 이름</td>
                                <td><input type="text" name="orderer"></td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td>
                                    <input type="text" name="hp">
                                    <span>- 포함 입력</span>
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td>
                                    <input type="text" name="addr1">
                                </td>
                            </tr>
                        </table>
                    </article>
                     <div class="final">
                        <h2>최종결제 정보</h2>
                        <table>
                            <tr>
                                <td>총</td>
                                <td>0 건</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td>00,000</td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td>-1,000</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>포인트 할인</td>
                                <td>-1,000</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td>00,000</td>
                            </tr>
                        </table>
                        <input type="submit" value="결제하기">
                    </div>

                    
                    
                    <!-- 결제방법 -->
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type4">무통장 입금
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type5">카카오페이
                                    <img src="/assets/img/img_kakaopay.png" alt="카카오페이">
                                </label>
                            </p>
                        </div>
                    </article>
                    
                    <!-- 경고 -->
                    <article class="alert">
                        <ul>
                            <li><span>재범shop은 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 재범shop 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.
                            </span></li>
                            <li><span>재범shop 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.
                            </span></li>
                        </ul>
                    </article>
               </form>
            </section>
        </main>
	       
	
	<c:import url="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>