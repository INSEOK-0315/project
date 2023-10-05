package com.hanulso.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcount;

}
