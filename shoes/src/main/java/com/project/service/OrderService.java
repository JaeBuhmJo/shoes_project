package com.project.service;

import java.util.List;

import com.project.domain.OrderDTO;
import com.project.domain.OrderPageProductDTO;

public interface OrderService {
	
	/* 주문 정보 */
	public List<OrderPageProductDTO> getorder_list(List<OrderPageProductDTO> orders);
	
	/* 주문 하기 */
	public void order(OrderDTO orderdto);
	
	
	

}
