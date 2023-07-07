package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.domain.ReviewDTO;
import com.project.mapper.DetailMapper;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;

	
	@Override
	public ProductDTO detail(String productId) {
		
		return detailMapper.detail(productId);
	}
	//카트에 선택한 정보 보내기 코드
	@Override
	public boolean cartInsert(CartDTO cart) {
		// TODO Auto-generated method stub
		return detailMapper.cartInsert(cart)==1?true:false;
	}
	@Override
	public List<ReviewDTO> reviewList(Criteria cri,String productId) {

		return detailMapper.reviewList(cri,productId);
	}
	@Override
	public int reviewTotal(Criteria cri,String productId) {
		
		return detailMapper.reviewTotal(cri,productId);
	}
	@Override
	public List<InventoryDTO> inventory(InventoryDTO inventory) {
		return detailMapper.inventory(inventory);
	}
	@Override
	public List<ColorSize> color(String productId) {
		
		return detailMapper.color(productId);
	}
	@Override
	public List<ColorSize> size(String productId, String productColor) {
		return detailMapper.size(productId,productColor);
	}
	
	@Override
	public CartDTO cartIdGet(String memberId) {
		return detailMapper.cartIdGet(memberId);
	}
	@Override
	public InventoryDTO inventoryIdGet(String productId, String productColor,String productSize) {
		
		return detailMapper.inventoryIdGet(productId,productColor,productSize);
	}
	@Override
	public ReviewDTO stars(String productId) {
		return detailMapper.stars(productId);
	}
	
}
