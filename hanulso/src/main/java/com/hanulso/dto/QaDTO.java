package com.hanulso.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QaDTO {

	private int qbno;
	private String title;
	private String content;
	private int state;
	private String writer;
	private Date regdate;
	private int viewcount;
	private QaReplyDTO QaReplyDTO;
	
}
