package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PurchaseDTO {
	
	private int oderId;
	private String memberId;
	private String productId;
	private String inventoryId;
	private int purchaseAmount;
	private Date purchaseDate;
	
	private List<InventoryDTO> inventories;
	private List<AttachmentDTO> attachmentList;
	
	
	

}
