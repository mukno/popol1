package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ItemNumberVO;
import com.spring.domain.ItemVO;
import com.spring.domain.OrderRecodeVO;
import com.spring.domain.ShopDeleteVO;
import com.spring.domain.ShopVO;
import com.spring.mapper.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuMapper mapper;
	
	@Override
	public List<ItemVO> menu_selectAll(ItemNumberVO num) {
		return mapper.item_selectAll(num);
	}

	@Override
	public ItemVO item_selectOne(int num) {
		
		return mapper.item_selectOne(num);
	}


	@Override
	public void add_order_recode_detail(OrderRecodeVO recode) {
		mapper.add_order_recode_detail(recode);
		
	}

	@Override
	public List<ShopVO> select_order_recode(String userId) {
		return mapper.select_order_recode(userId);
	}

	@Override
	public void add_shop(ShopVO shop) {
		mapper.add_shop(shop);
		
	}


	@Override
	public void deleteAll_shop(String userId) {
		mapper.deleteAll_shop(userId);
		
	}

	@Override
	public List<OrderRecodeVO> select_order_recode_detail(String userId) {
		return mapper.select_order_recode_detail(userId);
	}

	@Override
	public List<ShopVO> select_mypage_recode(String userId, int order_count) {
		return mapper.select_mypage_recode(userId, order_count);
	}

	@Override
	public int select_shop_order_count(String userId) {
		return mapper.select_shop_order_count(userId);
	}

	@Override
	public int select_order_count(String userId) {
		return mapper.select_order_count(userId);
	}

	@Override
	public List<ShopVO> selectAll_shop(String userId) {
		return mapper.selectAll_shop(userId); 
	}
	

	@Override
	public void copy_order_recode(String userId) {
		mapper.copy_order_recode(userId);
		
	}

	@Override
	public void delete_shop(ShopDeleteVO shopdel) {
		mapper.delete_shop(shopdel);
		
	}

	@Override
	public int select_item_trun(String userId) {
		return mapper.select_item_trun(userId);
	}
	
	
	
}
