package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.CartDTO;

@Mapper
public interface PurchaseMapper {

	public int insertPurchase(CartDTO cartDTO);
	
}
