package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *  상품 데이터를 담을 클래스
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDTO {
	
	 

	/* 주문 번호 */
	private String orderId;
	
	/* 주문 회원 아이디 */
	private String memberId;
	
	/* 수령자 이름 */
	private String orderName;
	
	/* 수령자 주소 */
	private String oredrAddress;
	
	/* 수령자 연락처 */
	private String orderPhone;
	
	/* 결제 수단 */
	private String oredrPayment;
	
	// DB 데이터에 존재하지 않는 데이터
	
	/* 판매가(모든 상품 비용) */
	private int totalPrice;
	
	/* 최종 판매 비용 */
	private int orderfinalPrice;

}
