package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseMapper purchaseMapper;
	
	@Override
	public int getOrderCount() {
		return purchaseMapper.getOrderCount();
	}

	@Override
	public int getOrderAmount() {
		return purchaseMapper.getOrderAmount();
	}

	@Override
	public int getOrderedCustomerCount() {
		return purchaseMapper.getOrderedCustomerCount();
	}

}
