package com.hanulso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.dto.QaReplyDTO;
import com.hanulso.mapper.QaMapper;
import com.hanulso.mapper.QaReplyMapper;

import lombok.Setter;

@Service
public class QaReplyServiceImpl implements QaReplyService {

	@Setter(onMethod_=@Autowired)
	private QaReplyMapper rmapper;
	
	@Setter(onMethod_=@Autowired)
	private QaMapper qmapper;
	
	@Override
	public void SaveQaReply(QaReplyDTO dto) {
		rmapper.SaveQaReply(dto);
	}

	@Override
	public QaReplyDTO ViewQaReply(int rbno) {
		
		return rmapper.ViewQaReply(rbno);
	}

	@Override
	public void deleteQaReply(int rbno) {
		rmapper.deleteQaReply(rbno);

	}

	@Override
	public void UpdateQaReply(QaReplyDTO dto) {
		rmapper.UpdateQaReply(dto);

	}

}
