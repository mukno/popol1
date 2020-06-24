package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.ItemNumberVO;
import com.spring.domain.ItemVO;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderRecodeVO;
import com.spring.domain.ShopDeleteVO;
import com.spring.domain.ShopVO;
import com.spring.domain.item_lankVO;
import com.spring.interceptor.SessionNames;
import com.spring.service.MenuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/menu/*")
public class MenuController {
	
	@Inject
	private MenuService service;
	
	@GetMapping("/menu_recommend")
	public void menu_recommend(Model model
						 	   ,HttpSession session) {
		//menu.js mouserover이벤트
		model.addAttribute("menu_num","0");
		 
		int start_lank=1;//ex)1 = 인기순위 1위
		int last_lank=10;//ex)5 = 인기순위 10위
		
		ItemNumberVO num = new ItemNumberVO();
		num.setStart_Num(start_lank);
		num.setEnd_Num(last_lank);
		List<item_lankVO> lankVO=service.recommend_menu_count(num);
		
		int lank_num[] = new int[last_lank];
		int i=0;
		for (item_lankVO lank : lankVO) {
			lank_num[i]=lank.getItem_number();
			i++;
		}
		
		List<ItemVO> items=service.recommend_item_selectAll(lank_num);
	
		
		
		
		model.addAttribute("items",items);
		
		//order_list.jsp 장바구니 리스트 정보
		if(session.getAttribute(SessionNames.LOGIN)!=null) {
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
			
			List<ShopVO> shops=service.selectAll_shop(userId);
			model.addAttribute("shops",shops);
		}
		
	}
	@GetMapping("/menu_hamburger")
	public void menu_hamburger(Model model
							   ,HttpSession session) {
		model.addAttribute("menu_num","1");
		
		
		ItemNumberVO num = new ItemNumberVO();
		num.setStart_Num(1);
		num.setEnd_Num(19);
		List<ItemVO> items=service.menu_selectAll(num);
		model.addAttribute("items",items);
		
		if(session.getAttribute(SessionNames.LOGIN)!=null) {
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
			
			List<ShopVO> shops=service.selectAll_shop(userId);
			model.addAttribute("shops",shops);
		}
	}
	@GetMapping("/menu_snack")
	public void menu_snack(Model model
			               ,HttpSession session) {
		model.addAttribute("menu_num","2");
		
		ItemNumberVO num = new ItemNumberVO();
		num.setStart_Num(20);
		num.setEnd_Num(35);
		List<ItemVO> items=service.menu_selectAll(num);
		model.addAttribute("items",items);
		
		if(session.getAttribute(SessionNames.LOGIN)!=null) {
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
	
			List<ShopVO> shops=service.selectAll_shop(userId);
			model.addAttribute("shops",shops);
		}	
		
	}
	@GetMapping("/menu_drink")
	public void menu_drink(Model model
				   	   	   ,HttpSession session) {
		model.addAttribute("menu_num","3");
		
		ItemNumberVO num = new ItemNumberVO();
		num.setStart_Num(36);
		num.setEnd_Num(65);
		List<ItemVO> items=service.menu_selectAll(num);
		model.addAttribute("items",items);
		
		if(session.getAttribute(SessionNames.LOGIN)!=null) {
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
			
			List<ShopVO> shops=service.selectAll_shop(userId);
			model.addAttribute("shops",shops);
		}
		
	}
	@GetMapping("/menu_dessert")
	public void menu_dessert(Model model
							 ,HttpSession session) {
		model.addAttribute("menu_num","4");
		
		ItemNumberVO num = new ItemNumberVO();
		num.setStart_Num(66);
		num.setEnd_Num(73);
		List<ItemVO> items=service.menu_selectAll(num);
		model.addAttribute("items",items);
		
		if(session.getAttribute(SessionNames.LOGIN)!=null) {
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
			
			List<ShopVO> shops=service.selectAll_shop(userId);
			model.addAttribute("shops",shops);
		}
	}
	
	@GetMapping("/add")
	public @ResponseBody ItemVO add_button(@RequestParam("num")int num,Model model){
		ItemVO item=service.item_selectOne(num);
	
		model.addAttribute(item);
		
		return item; 
		
	}
	
	@GetMapping("/shop_add")
	public @ResponseBody void shop_add(@RequestParam("item_number")int item_number
									   ,@RequestParam("item_amount")int item_amount
									   ,@RequestParam("item_set_amount")int item_set_amount
									   ,HttpSession session)throws Exception{
		//shopDB에있는 데이터 추가 하기위한 session userid
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();

		ItemVO item=service.item_selectOne(item_number);
		int item_tot_price=0;
		String item_name=item.getItem_Name();
		
		if(item_set_amount>0) {
			item_tot_price=item_set_amount*item.getItem_Set_Price();
			item_name="세트 - "+item_name;
			shop_add_Action(userId,item_number,item_set_amount,item_tot_price,item_name,item);
		}
		if(item_amount>0) {
			item_name="단품 - "+item.getItem_Name();
			item_tot_price=item_amount*item.getItem_Price();
			shop_add_Action(userId,item_number,item_amount,item_tot_price,item_name,item);
		}
		
		
	
	
	}
	
	public void shop_add_Action(String userId
								,int item_number
								,int item_amount
								,int item_tot_price
								,String item_name
								,ItemVO item) {
		
		List<ShopVO> shops=service.selectAll_shop(userId);
		
		List<ShopVO> order_recode=service.select_order_recode(userId);
		
		
		ShopVO shop=new ShopVO();
		shop.setItem_amount(item_amount);
		shop.setItem_name(item_name);
		shop.setItem_number(item_number);
		shop.setItem_price(item_tot_price);
		shop.setUserId(userId);
	
		if(order_recode.isEmpty()) {
			//order_recode에 든 상품이 없는경우 order_count 1부터 시작
			int order_count=1;
			shop.setOrder_count(order_count);
			if(shops.isEmpty()) {
				//shops에 든 상품이 없는경우 item_turn 1부터 시작
				int item_turn=1;
				shop.setItem_turn(item_turn);
			}else {
				int item_turn=service.select_item_trun(userId);
				shop.setItem_turn(item_turn+1);
			}
			
		}else {
			int order_count=service.select_order_count(userId);
			shop.setOrder_count(order_count+1);
			
			if(shops.isEmpty()) {
				int item_turn=1;
				shop.setItem_turn(item_turn);
			}else {
				int item_turn=service.select_item_trun(userId);
				shop.setItem_turn(item_turn+1);
			}
			
			
		}
		
		
		service.add_shop(shop);
	}
	
	
	
	
	
	
	@GetMapping("/shop_delete")
	public String shop_delete(HttpSession session
							  ,@RequestParam("item_turn")int item_turn) {
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		
		ShopDeleteVO shopdel=new ShopDeleteVO();
		shopdel.setItem_turn(item_turn);
		shopdel.setUserId(userId);
		
		service.delete_shop(shopdel);
		
		return "redirect:/menu/menu_hamburger";
	}
	@GetMapping("/time")
	public @ResponseBody Map<String, Object> time() {
		Map<String, Object> map = new HashMap<String, Object>();
		String order_time=null;
		String deliver_time=null;
		Date date = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		order_time=sdformat.format(cal.getTime());
		cal.add(Calendar.MINUTE,50);	
		deliver_time=sdformat.format(cal.getTime());
		cal.setTime(date);
		
		map.put("order_time", order_time);
		map.put("deliver_time", deliver_time);
		
		System.out.println(map);
		return map;
	}
	
	
	
	@GetMapping("/pay")
	public void pay(HttpSession session
					,@RequestParam("order_time")String order_time
					,@RequestParam("deliver_time")String deliver_time
					,@RequestParam("deliver_address")String deliver_address) {
		
		//order할때의 시간,주소 등 정보 저장
		//userid,order_count,order_time,deliver_time,deliver_address
		System.out.println("1111");
		System.out.println("order_time="+order_time+",,deliver_time"+deliver_time+",,deliver_address"+deliver_address);
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		int order_count=service.select_shop_order_count(userId);
		OrderRecodeVO recode=new OrderRecodeVO();
		
		recode.setUserId(userId);
		recode.setOrder_count(order_count);
		recode.setOrder_time(order_time);
		recode.setDeliver_time(deliver_time);
		recode.setDeliver_address(deliver_address);
		
		service.add_order_recode_detail(recode);
		//결제 한 shop물품들 order_recode에 기록 저장
		service.copy_order_recode(userId);
		
		//결제 후 shopDB초기화
		service.deleteAll_shop(userId);
				
		
	}
	

}
