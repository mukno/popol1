package com.spring.service;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.MemberVO;

public interface MemberService {
	
	public MemberVO member_login(MemberVO vo);
	public int change_pwd(String userId,String new_userPw);
	public MemberVO select_member(String userId);
	public int change_addr(@Param("useradd")String useradd,@Param("userId")String userId);
}
