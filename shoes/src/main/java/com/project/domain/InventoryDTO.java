package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InventoryDTO {

	private int inventoryId;
	private int productId;
	private String productSize;
	private int quantity;
	private Date StockDate;
	private String productColor;
	private boolean discontinued;
	
	
	
}
