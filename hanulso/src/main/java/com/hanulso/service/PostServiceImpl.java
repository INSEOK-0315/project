package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.PostDTO;
import com.hanulso.mapper.PostMapper;

import lombok.Setter;

@Service
public class PostServiceImpl implements PostService {

	@Setter(onMethod_=@Autowired)
	private PostMapper mapper;
	
	@Override
	public void SavePost(PostDTO dto) {
		mapper.SavePost(dto);
	}
	
	@Override
	public List<PostDTO> ListPost(Criteria cri) {
		
		return mapper.ListPost(cri);
	}
	
	@Override
	public int TotalCount(Criteria cri) {
		return mapper.TotalCount(cri);
	}
	
	@Override
	public void ViewCount(int bno) {
		mapper.ViewCount(bno);
	}
	
	@Override
	public PostDTO nextPage(int bno) {
		
		return mapper.nextPage(bno);
	}
	
	@Override
	public PostDTO prevPage(int bno) {
		
		return mapper.prevPage(bno);
	}
	
	@Override
	public PostDTO ViewPost(int bno) {
		mapper.ViewCount(bno);
		return mapper.ViewPost(bno);
	}
	
	@Override
	public void UpdatePost(PostDTO dto) {
		mapper.UpdatePost(dto);
		
	}
	
	@Override
	public void DeletePost(int bno) {
		mapper.DeletePost(bno);
	}
	
}
