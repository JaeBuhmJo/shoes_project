package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
//주문내역 불러오는 DTO
public class OrderListDTO {
	private String productId;
	private int purchaseAmount;
	private Date purchaseDate;
	private String brand;
	private int price;
	private int footSize;
	private String productName;
	private String productColor;
	
	
	private String filePath;
	
}
