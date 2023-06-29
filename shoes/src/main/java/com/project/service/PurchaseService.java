package com.project.service;

import java.util.List;

import com.project.domain.PurchaseDTO;


public interface PurchaseService {
	
	/* 주문 정보 */
	public List<PurchaseDTO> getOrderlist(List<PurchaseDTO> orders);

}
