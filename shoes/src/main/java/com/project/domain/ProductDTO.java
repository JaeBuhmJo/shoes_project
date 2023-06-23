package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {

	private int productId;
	private String category;
	private String brand;
	private String detail;
	private String productCountry;
	private String productYear;
	private int price;
	private int discountPrice;
	private String productImageOne;
	private String productImageTwo;
	private String productImageThree;
	private String productImageFour;
	private int soldCount;
	private Date registeredDate;
	private Date modifiedDate;
	private String productName;
	private int forMen;
	private int forWomen;
	private int onSale;
	
	

	//inventory 에서 productSize 가져오기
	private InventoryDTO productSize;

}
