package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.QnaDTO;

public interface QnaService {

	public List<QnaDTO> qnaList(Criteria cri);
	public int qnaTotal(Criteria cri);
	public boolean qnaInsert(QnaDTO qna);
}
