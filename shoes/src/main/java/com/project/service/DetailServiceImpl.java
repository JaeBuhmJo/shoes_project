package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.domain.ProductDTO;
import com.project.domain.QnaDTO;
import com.project.mapper.DetailMapper;
import com.project.mapper.QnaMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;

	
	@Override
	public ProductDTO detail(int productId) {
		
		return detailMapper.detail(productId);
	}

	@Override
	public boolean cartInsert(CartDTO cartDto) {
		// TODO Auto-generated method stub
		return detailMapper.cartInsert(cartDto)==1?true:false;
	}
	
	@Override
	public boolean qnaInsert(QnaDTO qna) {
		log.info("qna 작성");
		return detailMapper.qnaInsert(qna)==1?true:false;
	}

}
