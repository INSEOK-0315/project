package com.hanulso.service;

import com.hanulso.dto.QaReplyDTO;

public interface QaReplyService {

	public void SaveQaReply(QaReplyDTO dto);
	
	public QaReplyDTO ViewQaReply(int rbno);
	
	public void deleteQaReply(int rbno);
	
	public void UpdateQaReply(QaReplyDTO dto);
}
