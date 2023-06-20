package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.detail.CartDTO;
import com.project.domain.detail.ProductDTO;
import com.project.mapper.DetailMapper;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;
	
	@Override
	public ProductDTO detail(int productId) {
		
		return detailMapper.detail(productId);
	}

	@Override
	public boolean cartInsert(CartDTO cartDto) {
		// TODO Auto-generated method stub
		return detailMapper.cartInsert(cartDto)==1?true:false;
	}

}
