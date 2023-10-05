package com.hanulso.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.dto.MemberDTO;
import com.hanulso.mapper.LoginMapper;

import lombok.Setter;

@Service
public class LoginServiceImpl implements LoginService {

	@Setter(onMethod_=@Autowired)
	private LoginMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	/*
	 * @Override public int Login(MemberDTO dto) {
	 * 
	 * return mapper.Login(dto); }
	 */

	@Override
	public MemberDTO Login(MemberDTO dto) {

		return mapper.Login(dto);
	}
}
