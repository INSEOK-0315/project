package com.hanulso.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.dto.MemberDTO;
import com.hanulso.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Override
	public void MemberInsert(MemberDTO dto) {
		mapper.MemberInsert(dto);
	}
	
	

	@Override
	public int IdCheck(String id) {
		
		Map<String,String> map = new HashMap<>(); 
		map.put("id", id);
		   
		return mapper.IdCheck(map);
	}

	@Override
	public int NickNameCheck(String nickname) {

		Map<String,String> map = new HashMap<>();
		map.put("nickname", nickname);
		return mapper.NickNameCheck(map);

	}
	

	@Override
	public MemberDTO ViewMember(int bno) {
		// TODO Auto-generated method stub
		return mapper.ViewMember(bno);
	}
	
	@Override
	public void UpdateMember(MemberDTO dto) {
		mapper.UpdateMember(dto);
		
	}
	
	@Override
	public void DeleteMember(int bno) {
		mapper.DeleteMember(bno);
		
	}
}
