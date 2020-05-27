package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.MemberVO;

public interface MemberMapper {
	public MemberVO member_login(MemberVO vo);
	public int change_pwd(@Param("userId")String userId,@Param("new_userPw")String new_userPw);
	public MemberVO select_member(String userId);
	public int change_addr(@Param("useradd")String useradd,@Param("userId")String userId);

}
