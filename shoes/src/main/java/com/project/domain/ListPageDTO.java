package com.project.domain;

import lombok.Data;

@Data
public class ListPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int total;

	private Criteria cri;

	public ListPageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPage() / 5.0) * 5);
		this.startPage = this.endPage - 4;

		int totalEnd = (int) Math.ceil((total / 1.0) / cri.getListAmount());

		this.prev = startPage == 1 ? false : true;
		this.next = endPage > totalEnd ? false : true;
		this.endPage = next ? endPage : totalEnd;
	}
}
