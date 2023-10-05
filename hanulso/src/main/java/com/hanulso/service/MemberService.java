package com.hanulso.service;

import com.hanulso.dto.MemberDTO;

public interface MemberService {

	public void MemberInsert(MemberDTO dto);
	
	public int IdCheck(String str);

	public int NickNameCheck(String str);
	
	public MemberDTO ViewMember(int bno);
	
	public void UpdateMember(MemberDTO dto);
	
	public void DeleteMember(int bno);
	
	
}
