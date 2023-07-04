package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ReviewDTO;
import com.project.mapper.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper mapper;
	
	@Override
	public boolean reviewInsert(ReviewDTO review) {
		
		return mapper.reviewInsert(review)==1?true:false;
	}

	@Override
	public boolean deleteRid(int review) {
		
		return mapper.deleteRid(review)==1?true:false;
	}

	@Override
	public boolean updateReview(ReviewDTO dto) {
		
		return mapper.updateReview(dto)==1?false:true;
	}

}
