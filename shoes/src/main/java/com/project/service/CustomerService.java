package com.project.service;

import com.project.domain.ReviewDTO;

public interface CustomerService {

	public boolean reviewInsert(ReviewDTO review);
	public ReviewDTO reviewGet(String reviewId);


	public boolean deleteRid(int review);
	
	public boolean updateReview(ReviewDTO dto);
	
}
