package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.domain.QnaDTO;
import com.project.domain.QnaPageDTO;


@Mapper
public interface QnaMapper {

	// 문의 정보 보여주기
		public List<QnaDTO> qnaList(Criteria cri);
		public int qnaTotal(Criteria cri);

		public QnaDTO qnaRead(int qnaId);
		
		public int qnaInsert(QnaDTO qna);
}
