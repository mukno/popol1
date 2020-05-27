package com.spring.controller;

import java.io.Console;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AddressVO;
import com.spring.domain.MemberVO;
import com.spring.interceptor.SessionNames;
import com.spring.service.MemberService;
import com.spring.service.MenuService;
import com.spring.service.MypageService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@Inject
	private MenuService menu_service;
	
	@Inject
	private MypageService mypage_service;
	
	@GetMapping("/home")
	public void home(HttpSession session
					 ,Model model) throws Exception{
		try {
			System.out.println("Get home");
			MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
			String userId=vo.getUserId();
			if(userId!=null) {
				List<AddressVO> address_List=mypage_service.address_selectAll(userId);
				model.addAttribute("address_List",address_List);
				 
				
			}
			
		} catch (Exception e) {
			
		}
		
		
		
		
	}
	
	@GetMapping("/test")
	public void test() {
			
	}
	
	
	
	
	
	@PostMapping("/home")
	public void loginPost(MemberVO vo
			 			  ,Model model
			 			  ,String basicURL){
		System.out.println("post home");
		model.addAttribute("method","post");
			String uri="";
			if(basicURL==null) {
				uri="/home";
			}else {
				uri=basicURL.substring(14,basicURL.length()-4);
				
			}
			MemberVO user=service.member_login(vo);
			if(user!=null) {
				
				model.addAttribute("user",user);
				model.addAttribute("uri",uri);
				String userId=user.getUserId();
				List<AddressVO> address_List=mypage_service.address_selectAll(userId);
				model.addAttribute("address_List",address_List);
				
			}else {
				System.out.println("failddd");
				model.addAttribute("loginResult","아이디 혹은 비밀번호를 잘못 입력하셨습니다.");
				model.addAttribute("uri",uri);
				
				
			
			}
		
	}
		
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//shopDB에있는 데이터 삭제 하기위한 session userid
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
	
		session.removeAttribute(SessionNames.LOGIN);		
		session.invalidate();
	
		
		menu_service.deleteAll_shop(userId);
		
		return "redirect:/home";
	}
	
	@GetMapping("/change_pwd")
	public @ResponseBody String change_pwd(HttpSession session
						  ,@RequestParam("userPw")String userPw
						  ,@RequestParam("new_userPw")String new_userPw
						  ,@RequestParam("check_new_userPw")String check_new_userPw) {
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		int result=0;
		
		
		
		MemberVO member=service.select_member(userId);
		
		//입력한 비밀번호와 실제 비밀번호가 맞는경우
		if(userPw.equals(member.getUserPw())) {
			//입력한 비밀번호(맞음) 과 새 비밀번호가 일치할경우
			if(userPw.equals(new_userPw)) {
				result=2;
				
			}else {
				result=service.change_pwd(userId, new_userPw);
				
			}
			
			
		}else {
			
			result=0;
		}
		
		
		return ""+result;
	}
	
	@GetMapping("/sign_login")
	public @ResponseBody String sign_login(@RequestParam("userId")String userId
										   ,@RequestParam("userPw")String userPw
										   ,HttpServletRequest request) {
		MemberVO vo=new MemberVO();
		
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		
		MemberVO user=service.member_login(vo);
		String uri=null;
		HttpSession session=request.getSession();
		
		
		if(user!=null) {
			uri="succ";
			session.setAttribute(SessionNames.LOGIN, user);
			session.setMaxInactiveInterval(24*60*60);
			return uri;
			
		}else {
			uri="fail";
			return uri;
			
			
		
		}
		
		
	}
	
	@GetMapping("change_addr")
	public @ResponseBody String change_addr(HttpSession session
						   ,@RequestParam("useradd")String useradd) {
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		int result=service.change_addr(useradd, userId);
		if(result==1) {
			MemberVO user=service.select_member(userId);
			session.setAttribute(SessionNames.LOGIN, user);
			
		}
		
		
		return "1";
		
		
		
	}
	

}
