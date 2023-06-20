package com.project.domain.detail;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {

	private String memberId;
	private int productId;
	private int cartAmount;
	

	
	
}
