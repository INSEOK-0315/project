package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.QaDTO;

public interface QaService {

	public void InsertQa(QaDTO dto);
	
	public List<QaDTO> ListQa(Criteria cri);
	
	public int TotalCount(Criteria cri);
	
	public QaDTO nextPage(int qbno);
	
	public QaDTO prevPage(int qbno);
	
	public QaDTO ViewQa(int qbno);
	
	public void DeleteQa(int qbno);
	
	public void UpdateProQa(QaDTO dto);
	
	public void UpdateQaState(QaDTO dto);
	
	public void UpdateQaState2(QaDTO dto);
	
	public void ViewCount(int Qbno);
	
	
}
