package com.project.domain;

import lombok.Data;

@Data
public class Criteria {
	private int page;
	private int listAmount;
	private String searchType;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int page, int listAmount) {
		super();
		this.page = page;
		this.listAmount = listAmount;
	}
}
