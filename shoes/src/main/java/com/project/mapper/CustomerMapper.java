package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.ReviewDTO;

@Mapper
public interface CustomerMapper {

	public int reviewInsert(ReviewDTO review);
	
	public int deleteRid(int reviewId);
	
	public int updateReview(ReviewDTO dto);
	
	public ReviewDTO reviewGet(String reviewId);
}
