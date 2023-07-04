package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.OrderListDTO;
import com.project.domain.Criteria;
import com.project.domain.OrderDTO;
import com.project.domain.PurchaseDTO;

import com.project.domain.OrderProductDTO;


@Mapper
public interface OrderMapper {

	
	/* 주문 상품 정보 (주문처리) */
	public OrderProductDTO getOrderInfo(String productId);
	

	/* 주문 상품 정보 (주문취소) */
	public List<OrderProductDTO> gerOrderProductInfo(String orderId);
	
	// 주문 상품 내역 조회
	public List<OrderListDTO> orderList(@Param("memberId") String memberId,@Param("cry") Criteria cry);

	/* 주문 테이블 등록 */
	public int Order(OrderDTO orderdto);
	
	/* 주문 상품 테이블 등록  */
	public int OrderProduct(OrderProductDTO orderproductdto);
	
	// 주문 상품 총 갯수 조회(페이지 나누기)
	public int getTotalOrderCount(@Param("memberId") String memberId,@Param("cry") Criteria cry);
	
	


}
