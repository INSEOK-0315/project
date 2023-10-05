package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.QaDTO;
import com.hanulso.mapper.QaMapper;

import lombok.Setter;

@Service
public class QaServiceImpl implements QaService {

	@Setter(onMethod_=@Autowired)
	private QaMapper mapper;
	
	@Override
	public void InsertQa(QaDTO dto) {
		mapper.InsertQa(dto);
	}
	
	@Override
	public List<QaDTO> ListQa(Criteria cri) {
		List<QaDTO> list = mapper.ListQa(cri);
		return list;
	}
	
	@Override
	public int TotalCount(Criteria cri) {
		return mapper.TotalCount(cri);
	}
	
	@Override
	public QaDTO nextPage(int qbno) {
		
		return mapper.nextPage(qbno);
	}
	
	@Override
	public QaDTO prevPage(int qbno) {
		
		return mapper.prevPage(qbno);
	}
	
	@Override
	public QaDTO ViewQa(int qbno) {
		mapper.ViewCount(qbno);
		return mapper.ViewQa(qbno);
	}
	
	@Override
	public void DeleteQa(int qbno) {
		mapper.DeleteQa(qbno);
		
	}
	
	@Override
	public void UpdateProQa(QaDTO dto) {
		mapper.UpdateProQa(dto);
	}
	
	@Override
	public void UpdateQaState(QaDTO dto) {
		mapper.UpdateQaState(dto);
		
	}
	
	@Override
	public void UpdateQaState2(QaDTO dto) {
		mapper.UpdateQaState2(dto);
		
	}
	
	@Override
	public void ViewCount(int Qbno) {
		mapper.ViewCount(Qbno);
		
	}
}
