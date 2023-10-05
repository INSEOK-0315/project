package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.FaqDTO;

public interface FaqService {

public void SaveFaq(FaqDTO dto);
	
	public List<FaqDTO> ListFaq(Criteria cri);
	
	public FaqDTO ViewFaq(int bno);
	
	public void UpdateFaq(FaqDTO dto);
	
	public void DeleteFaq(int bno);
	
	public FaqDTO nextPage(int bno);
	
	public FaqDTO prevPage(int bno);
	
	public int TotalCount(Criteria cri);
	
	public void ViewCount(int bno);
}
