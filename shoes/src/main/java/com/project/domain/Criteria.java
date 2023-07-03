package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Criteria {
	private int page;
	private int listAmount;
	private String searchType;
	private String keyword;
	private String innerKeyword;
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
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int page, int listAmount) {
		super();
		this.page= page;
		this.listAmount = listAmount;
	}
}
