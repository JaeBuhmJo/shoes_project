package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaPageDTO {
	private int startPage;
	private int endPage;
	
	private boolean prev;
	private boolean next;
	
	private int total;
	
	private Criteria cri;
	

	public QnaPageDTO(Criteria cri, int total) {
		
		this.total = total;
		this.cri = cri;
		this.endPage=(int)(Math.ceil(cri.getPage()/10.0))*10;
		this.startPage=this.endPage-9;
		
		int realEnd =(int)((Math.ceil(total)/1.0)/cri.getListAmount());
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage < realEnd;
	}


	


		
	
}
