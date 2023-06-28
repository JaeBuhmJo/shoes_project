package com.project.service;

import com.project.domain.OrderDTO;

public interface PurchaseService {
	
	// 주문 등록
	
	public void Purchasebuy(OrderDTO orderDTO) throws Exception;

}
