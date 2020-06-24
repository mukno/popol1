package com.spring.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ItemNumberVO;
import com.spring.domain.ItemVO;
import com.spring.domain.OrderRecodeVO;
import com.spring.domain.ShopDeleteVO;
import com.spring.domain.ShopVO;
import com.spring.domain.item_lankVO;

public interface MenuMapper {
	public List<ItemVO> item_selectAll(ItemNumberVO num);
	public ItemVO item_selectOne(int num);
	public void add_shop(ShopVO shop);
	public void deleteAll_shop(String userId);
	public List<ShopVO> selectAll_shop(String userId);
	public void delete_shop(ShopDeleteVO shopdel);
	public int select_item_trun(String userId);
	public List<ShopVO> select_order_recode(String userId);
	public int select_order_count(String userId);
	public void copy_order_recode(String userId);
	public void add_order_recode_detail(OrderRecodeVO recode);
	public int select_shop_order_count(String userId);
	public List<OrderRecodeVO> select_order_recode_detail(String userId);
	public List<ShopVO> select_mypage_recode(@Param("userId")String userId,@Param("order_count")int order_count);
	public List<item_lankVO> recommend_menu_count(ItemNumberVO num);
	public List<ItemVO> recommend_item_selectAll(Map<String, Object> map);
	
	
}
