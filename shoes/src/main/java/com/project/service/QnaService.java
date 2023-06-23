package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.domain.QnaDTO;
import com.project.domain.QnaPageDTO;

public interface QnaService {

	public List<QnaDTO> qnaList(Criteria cri);
	public int qnaTotal(Criteria cri);

	public QnaDTO qnaRead(int qnaId);

}
