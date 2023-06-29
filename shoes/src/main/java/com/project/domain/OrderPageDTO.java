package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderPageDTO {
	
	
	private List<PurchaseDTO> orders;
	
	public List<PurchaseDTO> getOrders() {
		return orders;
	}
	
	public void setOrders(List<PurchaseDTO> orders) {
		this.orders = orders;
	}
	
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
		
	}


