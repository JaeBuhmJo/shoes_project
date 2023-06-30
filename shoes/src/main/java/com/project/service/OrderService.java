package com.project.service;

import java.util.List;

import com.project.domain.OrderDTO;

import com.project.domain.OrderListDTO;

import com.project.domain.OrderProductDTO;
import com.project.domain.PurchaseDTO;

public interface OrderService {
	
	/* 주문 하기 */
	public void order(OrderDTO orderdto);

	public List<OrderProductDTO> orderList(String memberId);
	
	// 주문 목록 조회
	public List<OrderListDTO> list(String memberId);
	

}
