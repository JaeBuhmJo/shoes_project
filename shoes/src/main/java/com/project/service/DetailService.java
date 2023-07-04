package com.project.service;


import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.domain.ReviewDTO;

public interface DetailService {

	// 제품 조회 폼에서 회원이(memberId) 선택한 제품(productId) 정보 보여주기
	public ProductDTO detail(String productId);
	
	// 상품 상제 정보 페이지에서 cart에 데이터 보내기
	public boolean cartInsert(CartDTO cart);
	
	// 리뷰 페이지 나누기
	public List<ReviewDTO> reviewList(Criteria cri,String productId);
	public int reviewTotal(Criteria cri,String productId);
	
	public List<InventoryDTO> inventory(InventoryDTO inventory);
	
	public List<ColorSize> color(String productId);
	public List<ColorSize> size(String productId,String productColor);

	public InventoryDTO inventoryIdGet(String productId, String productColor,String productSize);
	public CartDTO cartIdGet(String memberId);
	
}

