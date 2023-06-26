package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.OrderPageProductDTO;
import com.project.domain.OrderProductDTO;


@Mapper
public interface OrderMapper {

	/* 주문 상품 정보 */
	public OrderPageProductDTO getOrder_list(int productId);
	
	/* 주문 상품 정보 (주문처리) */
	public OrderProductDTO getOrderInfo(int productId);
	
	/* 주문 상품 정보 (주문취소) */
	public List<OrderProductDTO> gerOrderProductInfo(String orderId);

}
