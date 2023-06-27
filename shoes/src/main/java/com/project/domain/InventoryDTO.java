package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor
public class InventoryDTO {
	private String inventoryId;
	private String productId;
	private String productSize;
	private int quantity;
	private String stockedDate;
	private String productColor;
	private boolean discontinued;
	
	public InventoryDTO(String productId, String productColor, String productSize, int quantity) {
		this.productId = productId;
		this.productColor = productColor;
		this.productSize = productSize;
		this.quantity = quantity;
	}
}
