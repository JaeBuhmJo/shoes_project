package com.project.domain;

import lombok.AllArgsConstructor;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderProductDTO {
	
	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private String productId;
    
	/* 주문 수량 */
    private int purchaseAmount;
    
	/* 상품 가격 */
    private int Price;
    
	/* 상품 할인 율 */
    private double discountPrice;
    
    
	// DB테이블 존재 하지 않는 데이터
    
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    

}
