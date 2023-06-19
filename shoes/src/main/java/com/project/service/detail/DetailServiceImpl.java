package com.project.service.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.detail.MemberDTO;
import com.project.domain.detail.ProductDTO;
import com.project.mapper.detail.DetailMapper;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;
	
	@Override
	public ProductDTO detailRead(int productId, MemberDTO memberId) {
		
		return detailMapper.detailRead(productId, memberId);
	}

}
