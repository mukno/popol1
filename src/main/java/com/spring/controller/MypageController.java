package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AddressVO;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderRecodeVO;
import com.spring.domain.ShopVO;
import com.spring.interceptor.SessionNames;
import com.spring.service.MenuService;
import com.spring.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MenuService menu_service;

	@Inject
	private MypageService mypage_service;
	
	@GetMapping("/sample")
	public void getsample(){
		  
		asf
	}
	@PostMapping("/sample")
	public void postsample(){
		
	}
	@GetMapping("/jusoPopup")
	public void getjusoPopup(){
		
	}
	@PostMapping("/jusoPopup")
	public void postjusoPopup(){
		
	}
	@GetMapping("/mypage_add_address")
	public void mypage_add_address(Model model){
		model.addAttribute("page_num","2");
		
	}
	@GetMapping("/mypage_select")
	public void mypage_select(Model model
			                  ,HttpSession session) {
		model.addAttribute("page_num","0");
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		List<OrderRecodeVO> recode=menu_service.select_order_recode_detail(userId);
		model.addAttribute("recode",recode);
		
		
	}
	
	@GetMapping("/mypage_order")
	public void mypage_order(Model model
							 ,HttpSession session) {
		model.addAttribute("page_num","1");
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		List<OrderRecodeVO> recode=menu_service.select_order_recode_detail(userId);
		
		
		
		ArrayList<List<ShopVO>> recode_item=new ArrayList<List<ShopVO>>();
		int i=0;
		for (OrderRecodeVO orderRecodeVO : recode) {
			OrderRecodeVO recode_one=recode.get(i);
			int order_count=recode_one.getOrder_count();
			i=i+1;
			List<ShopVO> item_one=menu_service.select_mypage_recode(userId, order_count);
			recode_item.add(item_one);
		}
		
		model.addAttribute("recode",recode);
		model.addAttribute("recode_item",recode_item);
		
	}
	
	@GetMapping("/mypage_address")
	public void mypage_set(Model model
						   ,HttpSession session) {
		model.addAttribute("page_num","2");
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		List<AddressVO> address=mypage_service.address_selectAll(userId);
		model.addAttribute("address",address);
		System.out.println("12412412 "+address);
		
	}

	@GetMapping("/mypage_change")
	public void mypage_change(Model model) {
		model.addAttribute("page_num","3");
		
	}
	
	@GetMapping("/add_address")
	public @ResponseBody String add_address(@RequestParam("roadAddrPart1")String roadAddrPart1
					         ,@RequestParam("addrDetail")String addrDetail
					         ,HttpSession session) {
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		String address=roadAddrPart1+" "+addrDetail;
		int add_num=0;
		AddressVO addvo=new AddressVO();
		List<AddressVO> address_list=mypage_service.address_selectAll(userId);
		
		if(address_list.isEmpty()) {
			addvo.setUserId(userId);
			addvo.setUseradd(address);
			addvo.setAdd_num(add_num+1);
		}else {
			add_num=mypage_service.select_add_num(userId);

			addvo.setUserId(userId);
			addvo.setUseradd(address);
			addvo.setAdd_num(add_num+1);
		}
		
		mypage_service.add_address(addvo);
		
		return "1";
	}
	
	@GetMapping("/delete_addr/{num}")
	public String delete_addr(@PathVariable("num")int num
							  ,HttpSession session) {
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		AddressVO addvo=new AddressVO();
		addvo.setUserId(userId);
		addvo.setAdd_num(num);
		
		mypage_service.delete_address(addvo);
		
		
		
		return "redirect:/mypage/mypage_address";
	}

}
