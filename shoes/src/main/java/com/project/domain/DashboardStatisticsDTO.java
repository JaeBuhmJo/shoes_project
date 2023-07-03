package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DashboardStatisticsDTO {
	private int onSaleProductsCount;
	private int offSaleProductsCount;
	private int dayPurchaseAmount;
	private int daySalesAmount;
	private int dayCustomerCount;
	private int todayPurchaseAmount;
	private int todaySalesAmount;
	private int todayCustomerCount;
	private int totalMemberCount;
	private int todayVisitCount;
	private int dailyVisitCount;
	private int totalVisitCount;
}
