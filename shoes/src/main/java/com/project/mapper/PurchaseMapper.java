package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PurchaseMapper {
	public int getOrderCount();
	public int getOrderAmount();
	public int getOrderedCustomerCount();
}
