package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.domain.OrderListDTO;
import com.project.domain.Criteria;

@Mapper
public interface OrderMapper {
	
	// 주문 상품 내역 조회
	public List<OrderListDTO> orderList(@Param("memberId") String memberId,@Param("cry") Criteria cry);

	// 주문 상품 총 갯수 조회(페이지 나누기)
	public int getTotalOrderCount(@Param("memberId") String memberId,@Param("cry") Criteria cry);

}
