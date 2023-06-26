package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	private int page;
	private int listAmount;
	private String searchType;
	private String keyword;
	private String order;
	private String category;
	private String gender;
	private boolean discontinued;

	public Criteria(int page, int listAmount, String order) {
		super();
			this.order = order;
	}

	public Criteria(String keyword, String searchType) {
		this.keyword = keyword;
		this.searchType = searchType;
	}
}
