package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderProductDTO;
import com.project.domain.PurchaseDTO;

public interface OrderService {
	
	/* 주문 하기 */
	public void order(OrderDTO orderdto);

	public void placeOrder(List<CartDTO> cartId, String memberId, String orderName, String orderAddress, String orderPhone, String orderPayment);

	public List<OrderProductDTO> orderList(String memberId);

	
}
