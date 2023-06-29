package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.DashboardChartDTO;
import com.project.domain.DashboardStatisticsDTO;

@Mapper
public interface DashboardMapper {
	public DashboardStatisticsDTO getStatistics();
	public List<DashboardChartDTO> getWeeklySalesAmount();
	public List<DashboardChartDTO> getWeeklyTopThree();
}
