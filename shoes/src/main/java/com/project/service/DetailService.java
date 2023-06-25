package com.project.service;


import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.domain.ReviewDTO;

public interface DetailService {

	// 제품 조회 폼에서 회원이(memberId) 선택한 제품(productId) 정보 보여주기
	public ProductDTO detail(int productId);
	
	// 상품 상제 정보 페이지에서 cart에 데이터 보내기
	public boolean cartInsert(CartDTO cart);
	
	public List<ReviewDTO> reviewList(Criteria cri);
	public int reviewTotal(Criteria cri);
}

