package com.project.service;

import com.project.domain.CartDTO;

public interface PurchaseService {
	
	public boolean savePurchaseLog(CartDTO cartDTO);
	
}
