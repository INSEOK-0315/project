package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.NoticeDTO;
import com.hanulso.mapper.NoticeMapper;

import lombok.Setter;

@Service
public class NoticeServiceimpl implements NoticeService {
	
	@Setter(onMethod_=@Autowired)
	private NoticeMapper mapper;
	
	@Override
	public void saveNotice(NoticeDTO dto) {
		mapper.SaveNotice(dto);
	}
	
	@Override
	public NoticeDTO viewNotice(int bno) {
		mapper.ViewCount(bno);
		return mapper.ViewNotice(bno);
	}
	
	@Override
	public void deleteNotice(int bno) {
		mapper.DeleteNotice(bno);
	}
	
	@Override
	public void updateNotice(NoticeDTO dto) {
		mapper.UpdateNotice(dto);
	}
	
	@Override
	public NoticeDTO nextPage(int bno) {
		mapper.ViewCount(bno);
		return mapper.nextPage(bno);
	}
	
	@Override
	public NoticeDTO prevPage(int bno) {
		mapper.ViewCount(bno);
		return mapper.prevPage(bno);
	}
	
	@Override
	public List<NoticeDTO> ListNotice(Criteria cri) {
		List<NoticeDTO> list = mapper.ListNotice(cri);
		System.out.println("service >>"+list);
		return list;
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
	public List<NoticeDTO> recentnotice(NoticeDTO dto) {
		List<NoticeDTO> list = mapper.recentnotice(dto);
		return list;
	}
	
}
