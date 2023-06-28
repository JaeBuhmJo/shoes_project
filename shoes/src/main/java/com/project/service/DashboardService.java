package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.domain.DashboardDataDTO;

public interface DashboardService {
	public DashboardDataDTO getDashboardData();
	public Map<String, Integer> getAreaChart();
}
