package com.project.service;

import java.util.List;

import com.project.domain.qna.Criteria;
import com.project.domain.qna.QnaDTO;

public interface QnaService {

	public List<QnaDTO> qnaList(Criteria cri);
	public int qnaTotal(Criteria cri);
}
