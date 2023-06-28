package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.OrderDTO;
import com.project.domain.OrderPageProductDTO;
import com.project.domain.OrderProductDTO;


@Mapper
public interface OrderMapper {

	/* 주문 상품 정보 */
	public OrderPageProductDTO getOrderlist(String productId);
	
	/* 주문 상품 정보 (주문처리) */
	public OrderProductDTO getOrderInfo(String productId);
	
	/* 주문 테이블 등록 */
	public int Order(OrderDTO orderdto);
	
	/* 주문 상품 테이블 등록  */
	public int OrderProduct(OrderProductDTO orderproductdto);
	
	

}
