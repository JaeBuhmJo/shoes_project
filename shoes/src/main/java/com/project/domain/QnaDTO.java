package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {

	public int qnaId;
	public String memberId;
	public String productId;
	public String question;
	public String answer;
	public Date questionDate;
	public Date answerDate;
	public String title;
}
