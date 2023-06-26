package com.project.domain;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartDTO {

	
	// 장바구니 담길것
	
	private int cartId; // 장바구니 구분명
	
	private String memberId; // 회원 이름
	         
	private int productId; // 제품 코드
	
	private int cartAmount; // 담은 수량
	
	// product
	
	private int productName; // 상품명
	
	private int Price; // 가격
	
	private int discountPrice; // 할인 가격
	
	private int Detail; // 상품 상세정보
	
	// 추가 할것
	private int totalPrice;
	
	// 상품 이미지
	private List<Product_ImageDTO> imagelist;

}

	
	
	
	

