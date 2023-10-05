package com.hanulso.mapper;

import java.util.Map;

import com.hanulso.dto.MemberDTO;

public interface MemberMapper {

	public void MemberInsert(MemberDTO dto);

	public int IdCheck(Map<String,String> map); 
	
	public int NickNameCheck(Map<String,String> map);
	
	public MemberDTO ViewMember(int bno);
	
	public void UpdateMember(MemberDTO dto);
	
	public void DeleteMember(int bno);
}
