package com.project.domain;

import java.util.StringTokenizer;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Criteria {
	private int page;
	private int listAmount;
	private String searchType;
	private String keyword;
	
	private String order;
	
	private String sortColumn;
	private String sortDirection;

	public Criteria(int page, int listAmount, String order) {
		super();
		if(order!=null) {
			this.order = order;
			StringTokenizer st = new StringTokenizer(order);
			this.sortColumn = st.nextToken();
			this.sortDirection = st.nextToken();
		}else {
			this.sortColumn = "REGISTERED_DATE";
			this.sortDirection = "DESC";
		}
	}
	
	public Criteria(String keyword, String searchType) {
		this.keyword = keyword;
		this.searchType = searchType;
	}
}
