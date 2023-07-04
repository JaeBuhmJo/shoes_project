package com.project.domain;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PurchasesDTO {
	private String orderId;
	private String memberId;
	private String productId;
	private String inventoryId;
	private int purchaseAmount;
	private Date purchaseDate;
}
