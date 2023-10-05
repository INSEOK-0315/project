package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.FaqDTO;
import com.hanulso.mapper.FaqMapper;

import lombok.Setter;

@Service
public class FaqServiceImpl implements FaqService {

	@Setter(onMethod_=@Autowired)
	private FaqMapper mapper;
	
	@Override
	public void SaveFaq(FaqDTO dto) {
		mapper.SaveFaq(dto);
	}

	@Override
	public List<FaqDTO> ListFaq(Criteria cri) {
		List<FaqDTO> list = mapper.ListFaq(cri);
		return list;
	}

	@Override
	public FaqDTO ViewFaq(int bno) {
		mapper.ViewCount(bno);
		return mapper.ViewFaq(bno);
	}

	@Override
	public void UpdateFaq(FaqDTO dto) {
		mapper.UpdateFaq(dto);
	}

	@Override
	public void DeleteFaq(int bno) {
		mapper.DeleteFaq(bno);
	}

	@Override
	public FaqDTO nextPage(int bno) {
		mapper.ViewCount(bno);
		return mapper.nextPage(bno);
	}

	@Override
	public FaqDTO prevPage(int bno) {
		mapper.ViewCount(bno);
		return mapper.prevPage(bno);
	}

	@Override
	public int TotalCount(Criteria cri) {
		return mapper.TotalCount(cri);
	}

	@Override
	public void ViewCount(int bno) {
		mapper.ViewCount(bno);
	}

}
