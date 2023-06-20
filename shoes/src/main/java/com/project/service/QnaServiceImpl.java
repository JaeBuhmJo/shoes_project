package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.qna.Criteria;
import com.project.domain.qna.QnaDTO;
import com.project.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {

	private QnaMapper mapper;

	@Override
	public List<QnaDTO> qnaList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.qnaList(cri);
	}

	@Override
	public int qnaTotal(Criteria cri) {
		
		return mapper.qnaTotal(cri);
	}
	


}
