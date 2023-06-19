package com.project.domain;

import java.util.Date;

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
	private String productImageOne;
	private String productImageTwo;
	private String productImageThree;
	private String productImageFour;
	private String productCountry;
	private int productYear;
	private String productName;
	private boolean onSale;
	private int soldCount;
	private Date registeredDate;
	private Date modifiedDate;
}
