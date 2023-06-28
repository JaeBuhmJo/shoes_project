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
	
	
	private List<OrderPageProductDTO> orders;
	
	public List<OrderPageProductDTO> getOrders() {
		return orders;
	}
	
	public void setOrders(List<OrderPageProductDTO> orders) {
		this.orders = orders;
	}
	
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
		
	}


