package com.hanulso.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // 페이지 번호
	private int amount; // 한페이지에 출력할 레코드 개수
	
	private String type; // 검색 종류
	private String keyword; // 검색 단어
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
