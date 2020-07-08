package com.spring.service;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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
	public int userIdCheck(String userId) {
		return mapper.userIdCheck(userId);
	}



	@Override
	public int registerMember(MemberVO vo) {
		return mapper.registerMember(vo);
	}



	@Override
	public int change_addr(String useradd, String userId,int delete_check) {
		return mapper.change_addr(useradd, userId,delete_check);
	}



	@Override
	public MemberVO member_login(MemberVO vo) {
		return mapper.member_login(vo);
	}



	@Override
	public void registerAddress(MemberVO vo) {
		mapper.registerAddress(vo);
	}



	@Override
	public int change_pwd(String userId, String new_userPw) {
		return mapper.change_pwd(userId, new_userPw);
		
	}

}
