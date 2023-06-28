package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.ReviewDTO;

@Mapper
public interface CustomerMapper {

	public ReviewDTO reviewInsert(int reviewId);
}
