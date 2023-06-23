package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.domain.QnaDTO;
import com.project.domain.QnaPageDTO;
import com.project.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;

	@Override
	public List<QnaDTO> qnaList(Criteria cri) {
		return mapper.qnaList(cri);
	}

	@Override
	public int qnaTotal(Criteria cri) {
		
		return mapper.qnaTotal(cri);
	}



	@Override
	public QnaDTO qnaRead(int qnaId) {
		
		return mapper.qnaRead(qnaId);
	}



//	@Override
//	public QnaPageDTO qna(int total) {
//		
//		return mapper.qna(total);
//	}
	


}
