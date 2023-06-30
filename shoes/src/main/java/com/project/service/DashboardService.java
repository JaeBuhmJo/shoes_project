package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.domain.DashboardStatisticsDTO;

public interface DashboardService {
	public DashboardStatisticsDTO getDashboardData();
	public Map<String, Integer> getAreaChartData();
	public List<String> getPieChartData();
}
