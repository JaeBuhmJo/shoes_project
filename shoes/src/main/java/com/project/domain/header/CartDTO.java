package com.project.domain.header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {

	private int memberId;
	private int productId;
	private int cartAmount;
	

	
	
}
