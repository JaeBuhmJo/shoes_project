package com.project.service;

import java.util.List;

import com.project.domain.Criteria;

import com.project.domain.OrderListDTO;

public interface OrderService {
	
	// 주문 목록 조회
	public List<OrderListDTO> list(String memberId, Criteria cry);
	
	// 주문 목록 총 갯수(페이지 나누기)
	public int getTotalCnt(String memberId, Criteria cry);
}
