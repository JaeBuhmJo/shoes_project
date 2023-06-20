package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.qna.Criteria;
import com.project.domain.qna.QnaDTO;


@Mapper
public interface QnaMapper {

	// 댓글 정보 보여주기
		public List<QnaDTO> qnaList(Criteria cri);
		public int qnaTotal(Criteria cri);
}
