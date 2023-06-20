package com.project.domain.detail;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InventoryDTO {

	private int inventoryId;
	private String productSize;
	private int quantity;
	private int productId;
	private Date StockDate;
	
	
	
}
