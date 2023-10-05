package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.dto.PostReplyDTO;
import com.hanulso.mapper.PostReplyMapper;

import lombok.Setter;

@Service
public class PostReplyServiceImpl implements PostReplyService {

	@Setter(onMethod_=@Autowired)
	private PostReplyMapper mapper; 
	
	@Override
	public int ReplyInsert(PostReplyDTO dto) {
		
		return mapper.ReplyInsert(dto);
	}

	@Override
	public List<PostReplyDTO> ReplyList(int bno) {
		List<PostReplyDTO> rlist = mapper.ReplyList(bno);;
		return rlist;
	}
	
	@Override
	public PostReplyDTO ReplyView(int rbno) {
		return mapper.ReplyView(rbno);
	}
	
	@Override
	public int ReplyDelete(int rbno) {
		System.out.println("delete : "+rbno);
		return mapper.ReplyDelete(rbno);
	}
	
	@Override
	public int ReplyModify(PostReplyDTO dto) {
		System.out.println("modify >> "+dto);
		return mapper.ReplyUpdate(dto);
	}


}
