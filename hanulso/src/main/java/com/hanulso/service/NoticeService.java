package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.NoticeDTO;

public interface NoticeService {

	public void saveNotice(NoticeDTO dto);
	
	public List<NoticeDTO> ListNotice(Criteria cri);
	
	public NoticeDTO viewNotice(int bno);
	
	public void deleteNotice(int bno);
	
	public void updateNotice(NoticeDTO dto);
	
	public NoticeDTO nextPage(int bno);
	
	public NoticeDTO prevPage(int bno);
	
	public int TotalCount(Criteria cri);
	
	public void ViewCount(int bno);
	
	public List<NoticeDTO> recentnotice(NoticeDTO dto);
}
