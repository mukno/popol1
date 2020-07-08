package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.AddressVO;
import com.spring.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Inject
	private MypageMapper mapper;

	@Override
	public List<AddressVO> address_selectAll(String userId) {
		return mapper.address_selectAll(userId);
	}

	@Override
	public void add_address(AddressVO addvo) {
		mapper.add_address(addvo);
	}

	@Override
	public int select_add_num(String userId, String userAdd) {
		return mapper.select_add_num(userId, userAdd);
	}

	@Override
	public int max_add_num(String userId) {
		return mapper.max_add_num(userId);
	}

	@Override
	public void delete_address(AddressVO addvo) {
		mapper.delete_address(addvo);
	}

	
}
