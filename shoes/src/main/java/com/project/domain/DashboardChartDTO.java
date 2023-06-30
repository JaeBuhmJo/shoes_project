package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DashboardChartDTO {
	private int salesAmount;
	private String salesDate;
	
	private String productId;
	private String productName;
	private int productSalesAmount;
}
