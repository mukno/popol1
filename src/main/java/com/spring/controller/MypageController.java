package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.MemberVO;
import com.spring.domain.OrderRecodeVO;
import com.spring.domain.ShopVO;
import com.spring.interceptor.SessionNames;
import com.spring.service.MenuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MenuService service;
	
	@GetMapping("/mypage_select")
	public void mypage_select(Model model
			                  ,HttpSession session) {
		model.addAttribute("page_num","0");
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		List<OrderRecodeVO> recode=service.select_order_recode_detail(userId);
		model.addAttribute("recode",recode);
		
		
	}
	
	@GetMapping("/mypage_order")
	public void mypage_order(Model model
							 ,HttpSession session) {
		model.addAttribute("page_num","1");
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		List<OrderRecodeVO> recode=service.select_order_recode_detail(userId);
		
		
		
		ArrayList<List<ShopVO>> recode_item=new ArrayList<List<ShopVO>>();
		int i=0;
		for (OrderRecodeVO orderRecodeVO : recode) {
			OrderRecodeVO recode_one=recode.get(i);
			int order_count=recode_one.getOrder_count();
			i=i+1;
			List<ShopVO> item_one=service.select_mypage_recode(userId, order_count);
			recode_item.add(item_one);
		}
		
		model.addAttribute("recode",recode);
		model.addAttribute("recode_item",recode_item);
		
	}
	
	@GetMapping("/mypage_set")
	public void mypage_set(Model model) {
		model.addAttribute("page_num","2");
		
	}

	@GetMapping("/mypage_change")
	public void mypage_change(Model model) {
		model.addAttribute("page_num","3");
		
	}
	
	

}
