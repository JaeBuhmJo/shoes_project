package com.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseMapper purchaseMapper;

	@Override
	public boolean savePurchaseLog(CartDTO cartDTO) {
		return purchaseMapper.insertPurchase(cartDTO)==1?true:false;
	}
}
