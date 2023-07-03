package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertPurchaseDTO {
	private String memberId; 
	private String productId;
	private int cartAmount;
	private String inventoryId;
}
