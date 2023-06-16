package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnasId {

	public int QnaId;
	public String memberId;
	public int productId;
	public String question;
	public String answer;
	public Date questionDate;
	public Date answerDate;
}
