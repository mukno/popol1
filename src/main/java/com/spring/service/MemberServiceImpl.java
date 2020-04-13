package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberMapper mapper;
	
	
	
	@Override
	public MemberVO select_member(String userId) {
		
		return mapper.select_member(userId);
	}



	@Override
	public MemberVO member_login(MemberVO vo) {
		return mapper.member_login(vo);
	}



	@Override
	public int change_pwd(String userId, String new_userPw) {
		return mapper.change_pwd(userId, new_userPw);
		
	}

}
