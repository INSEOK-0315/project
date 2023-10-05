package com.hanulso.mapper;

import com.hanulso.dto.QaReplyDTO;

public interface QaReplyMapper {

	public void SaveQaReply(QaReplyDTO dto);
	
	public QaReplyDTO ViewQaReply(int rbno);
	
	public void deleteQaReply(int rbno);
	
	public void UpdateQaReply(QaReplyDTO dto);
}
