package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.InsertPurchaseDTO;
import com.project.domain.OrderDTO;
import com.project.domain.PurchaseDTO;

@Mapper
public interface PurchaseMapper {

	public int insertPurchase(InsertPurchaseDTO insertPurchaseDTO);
	
	/* 주문 상품 정보 */
	public PurchaseDTO getOrderlist(String productId);
	
	//주문 목록 리스트
	public List<OrderDTO> orderList(String memberId);
	
}
