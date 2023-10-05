package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.PostDTO;

public interface PostService {

	public void SavePost(PostDTO dto);
	
	public List<PostDTO> ListPost(Criteria cri);
	
	public int TotalCount(Criteria cri);
	
	public void ViewCount(int bno);
	
	public PostDTO nextPage(int bno);
	
	public PostDTO prevPage(int bno);
	
	public PostDTO ViewPost(int bno);
	
	public void UpdatePost(PostDTO dto);
	
	public void DeletePost(int bno);
	

}
