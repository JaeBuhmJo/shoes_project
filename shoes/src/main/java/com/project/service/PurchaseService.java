package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;
import com.project.domain.PurchaseDTO;

public interface PurchaseService {
	
	public boolean savePurchaseLog(CartDTO cartDTO);
	
	/* 주문 정보 */
	public List<PurchaseDTO> getOrderlist(List<PurchaseDTO> orders);

}
