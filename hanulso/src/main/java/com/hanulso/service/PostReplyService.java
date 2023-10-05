package com.hanulso.service;

import java.util.List;

import com.hanulso.dto.PostReplyDTO;

public interface PostReplyService {

	public int ReplyInsert(PostReplyDTO dto);
	
	public List<PostReplyDTO> ReplyList(int bno);
	
	public int ReplyDelete(int rbno);
	
	public int ReplyModify(PostReplyDTO dto);
	
	public PostReplyDTO ReplyView(int rbno);
	
}
