package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
	private String imp_uid;
	private String merchant_uid;
	private String orderId;
	private String orderName;
	private int amount;
	private MemberDTO member;
	private String pay_method;
}
