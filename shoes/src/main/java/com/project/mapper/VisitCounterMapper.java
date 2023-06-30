package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.VisitDTO;

@Mapper
public interface VisitCounterMapper {
	public int wasVisited(VisitDTO visitDTO);
	public int createVisit(VisitDTO visitDTO);
}
