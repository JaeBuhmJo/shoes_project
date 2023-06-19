package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor
public class InventoryDTO {
	private String inventoryId;
	private String productId;
	private int productSize;
	private int quantity;
	private Date stockedDate;
	
}
