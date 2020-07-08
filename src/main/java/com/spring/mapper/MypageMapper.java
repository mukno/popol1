package com.spring.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AddressVO;

public interface MypageMapper {

	public List<AddressVO> address_selectAll(String userId);
	public void add_address(AddressVO addvo);
	public int max_add_num(String userId);
	public int select_add_num(@Param("userId")String userId,@Param("userAdd")String userAdd);
	public void delete_address(AddressVO addvo);
	
	
}
