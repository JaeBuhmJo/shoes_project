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
	private int dayPurchaseCount;
	private int daySalesAmount;
	private int dayCustomerCount;
	private int notAnsweredCount;
	private int totalMemberCount;
	private int todayVisitCount;
	private int dailyVisitCount;
	private int totalVisitCount;
}
