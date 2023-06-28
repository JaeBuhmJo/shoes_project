package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.DashboardDataDTO;

@Mapper
public interface DashboardMapper {
	public DashboardDataDTO getStatistics();
	public List<DashboardDataDTO> getWeeklySalesAmount();
}
