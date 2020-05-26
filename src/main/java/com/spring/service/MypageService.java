package com.spring.service;


import java.util.List;

import com.spring.domain.AddressVO;



public interface MypageService {
	
	public List<AddressVO> address_selectAll(String userId);
	public void add_address(AddressVO addvo);
	public int select_add_num(String userId);
	public void delete_address(AddressVO addvo);
	
	
}
