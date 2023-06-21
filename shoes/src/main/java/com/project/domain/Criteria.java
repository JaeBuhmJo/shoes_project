package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	
	public int page;
	public int amount;

	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int page, int amount) {
		super();
		this.page= page;
		this.amount = amount;
	}
	
}
