package com.hanulso.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PostReplyDTO {

	private int bno;
	private int rbno;
	private String writer;
	private String content;
	private String profileimg;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate;
	private int postlike;
}
