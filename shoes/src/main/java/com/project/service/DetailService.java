package com.project.service;


import com.project.domain.detail.CartDTO;
import com.project.domain.detail.ProductDTO;

public interface DetailService {

	// 제품 조회 폼에서 회원이(memberId) 선택한 제품(productId) 정보 보여주기
	public ProductDTO detail(int productId);
	public boolean cartInsert(CartDTO cartDto);
}

