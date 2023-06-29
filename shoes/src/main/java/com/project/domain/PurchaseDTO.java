package com.project.domain;

import java.util.Date;
/* 상품 데이터 담을 클래스 */
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
	

	private int orderId;
	private String memberId;
	private String productId;
	private String inventoryId;
	private int purchaseAmount;
	private Date purchaseDate;
	
	private List<OrderProductDTO> orderproduct;
	
	/* DB로부터 꺼내올 값 */
    private String productName;
    
    private int Price;
    
    private double discountPrice;
    
	/* 만들어 낼 값 */
    
    private int totalprice;
    
    
     /* 상품 이미지 */
 	private List<AttachmentDTO> attachmentList;	     

}