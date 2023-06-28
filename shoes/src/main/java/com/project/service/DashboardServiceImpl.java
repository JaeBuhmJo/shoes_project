package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.DashboardDataDTO;
import com.project.mapper.DashboardMapper;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	private DashboardMapper dashBoardMapper;
	
	@Override
	public DashboardDataDTO getDashboardData() {
		return dashBoardMapper.getStatistics();
	}

	@Override
	public Map<String, Integer> getAreaChart() {
		Map<String, Integer> areaChartMap = new HashMap<String, Integer>();
		for (DashboardDataDTO dto : dashBoardMapper.getWeeklySalesAmount()) {
			StringTokenizer st = new StringTokenizer(dto.getSalesDate());
			areaChartMap.put(st.nextToken(), dto.getSalesAmount());
		}
		return areaChartMap;
	}
}
