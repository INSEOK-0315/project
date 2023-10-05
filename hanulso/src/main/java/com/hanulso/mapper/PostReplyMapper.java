package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.PostReplyDTO;

public interface PostReplyMapper {

	public int ReplyInsert(PostReplyDTO dto);
	
	public List<PostReplyDTO> ReplyList(int bno);
	
	public int ReplyDelete(int rbno);
	
	public int ReplyUpdate(PostReplyDTO dto);
	
	public PostReplyDTO ReplyView(int rbno);
	
	public PostReplyDTO nextPage(int rbno);
	
	public PostReplyDTO prevPage(int rbno);
	
	public int TotalCount(Criteria cri);

}
