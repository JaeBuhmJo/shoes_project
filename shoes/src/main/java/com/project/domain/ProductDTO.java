package com.project.domain;

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
	private String productImage1;
	private String productImage2;
	private String productImage3;
	private String productImage4;
	private String productCountry;
	private int productYear;
	private String productName;
	private boolean onSale;
}
