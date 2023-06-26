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
	private String order_id;
	
	/* 상품 번호 */
    private int product_id;
    
	/* 주문 수량 */
    private int purchase_amount;
    
	/* 상품 가격 */
    private int price;
    
	/* 상품 할인 율 */
    private double discountPrice;
    
    
	// DB테이블 존재 하지 않는 데이터
    
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    

}
