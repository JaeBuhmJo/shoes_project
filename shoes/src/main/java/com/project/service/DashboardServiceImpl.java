package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.DashboardChartDTO;
import com.project.domain.DashboardStatisticsDTO;
import com.project.mapper.DashboardMapper;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private DashboardMapper dashBoardMapper;

	@Override
	public DashboardStatisticsDTO getDashboardData() {
		return dashBoardMapper.getStatistics();
	}

	@Override
	public Map<String, Integer> getAreaChartData() {
		Map<String, Integer> areaChartMap = new HashMap<>();
		for (DashboardChartDTO dashboardChartDTO : dashBoardMapper.getWeeklySalesAmount()) {
			StringTokenizer st = new StringTokenizer(dashboardChartDTO.getSalesDate());
			areaChartMap.put(st.nextToken(), dashboardChartDTO.getSalesAmount());
		}
		return areaChartMap;
	}
 
	@Override
	public List<String> getPieChartData() {
		List<String> pieChartData = new ArrayList<String>();
		for (DashboardChartDTO dashboardChartDTO : dashBoardMapper.getWeeklyTopThree()) {
			StringBuffer sb = new StringBuffer();
			sb.append(dashboardChartDTO.getProductId()+",");
			sb.append(dashboardChartDTO.getProductName()+",");
			sb.append(dashboardChartDTO.getProductSalesAmount());
			pieChartData.add(sb.toString());
		}
		return pieChartData;
	}
}
