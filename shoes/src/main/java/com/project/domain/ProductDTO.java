package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor
public class ProductDTO {
	private String productId;
	private String category;
	private String brand;
	private int gender;
	private String detail;
	private int price;
	private int discountPrice;
	private String productCountry;
	private int productYear;
	private String productName;
	private boolean onSale;
	private int soldCount;
	private Date registeredDate;
	private Date modifiedDate;
	private String filePath;
	 
	private List<InventoryDTO> inventories;
	private List<AttachmentDTO> attachmentList;
}
