package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.dto.NoticeDTO;

public interface NoticeMapper {

	public void SaveNotice(NoticeDTO dto); // 등록, 매개변수 필요
	
	public List<NoticeDTO> ListNotice(Criteria cri);// 리스트
	
	public NoticeDTO ViewNotice(int bno); // 조회
	
	public void DeleteNotice(int bno); // 삭제
	
	public void UpdateNotice(NoticeDTO dto); // 수정
	
	public NoticeDTO nextPage(int bno); // 다음글
	
	public NoticeDTO prevPage(int bno); // 이전글
	
	public int TotalCount(Criteria cri); // 총레코드 개수
	
	public void ViewCount(int bno); // 조회수
	
	public List<NoticeDTO> recentnotice(NoticeDTO dto); // 최근 공지사항
	
}
