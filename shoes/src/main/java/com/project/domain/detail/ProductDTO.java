package com.project.domain.detail;

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
	private boolean gender;
	private String detail;
	private String productCountry;
	private int price;
	private int discountPrice;
	private String productImage1;
	private String productImage2;
	private String productImage3;
	
	//cart amount 가져오기
	private CartDTO amount;
	
	//inventory 에서 productSize 가져오기
	private InventoryDTO productSize;

}
