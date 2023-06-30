package com.project.domain;

/* 상품 데이터 담을 클래스 */
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderPageProductDTO {
	
	
	
	/* view로부터 전달 받을값 */
	private int productId;
	
	private int cartamount;
	
	/* DB로부터 꺼내올 값 */
    private String productName;
    
    private int Price;
    
    private double discountPrice;
    
	/* 만들어 낼 값 */
    
    private int totalprice;
    
    
     /* 상품 이미지 */
 	private List<ProductImageDTO> imagelist;	     

}
