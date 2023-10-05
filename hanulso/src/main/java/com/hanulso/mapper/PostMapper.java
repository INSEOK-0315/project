package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.PostDTO;

public interface PostMapper {
	
	public void SavePost(PostDTO dto);
	
	public List<PostDTO> ListPost(Criteria cri);
	
	public PostDTO ViewPost(int bno);
	
	public void DeletePost(int bno);
	
	public void UpdatePost(PostDTO dto);
	
	public PostDTO nextPage(int bno);
	
	public PostDTO prevPage(int bno);
	
	public int TotalCount(Criteria cri);
	
	public void ViewCount(int bno);
	
}
