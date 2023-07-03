package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

	public int reviewId;
	public Date regdate;
	public String contents;
	public String productId;
	public String memberId;
	public int jumsu;
}
