package com.hanulso.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PostDTO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int viewcount;
	private String imgurl;
	private int postlike;

}
