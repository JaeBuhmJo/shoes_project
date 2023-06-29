package com.project.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.CartDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.domain.QnaDTO;
import com.project.domain.ReviewDTO;

@Mapper
public interface DetailMapper {

	// 제품 조회 폼에서 회원이(memberId) 선택한 제품(productId) 정보 보여주기
		public ProductDTO detail(@Param("productId") String productId);
		
	// 장바구니에 담기 누를 시 장바구니에 제품 정보 보내기
		public int cartInsert(CartDTO cart);

		public List<ReviewDTO> reviewList(Criteria cri);
		public int reviewTotal(Criteria cri);
		
		public List<InventoryDTO> inventory(InventoryDTO inventory);

		
		public List<ColorSize> color(String productId);
		public List<ColorSize> size(String productId,String productColor);
		
		public InventoryDTO inventoryIdGet(String inventoryId,String productColor,int productSize);
		public CartDTO cartIdGet(String memberId);
}
