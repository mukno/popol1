package com.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberVO;
import com.spring.interceptor.SessionNames;
import com.spring.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardContorller {
	
	@Inject
	private BoardService service;
	
	@GetMapping("/board_index")
	public void board_index(Model model) {
			List<BoardVO> list=service.getList();
			model.addAttribute("list",list);	
		
		
		
	}
	@GetMapping("/board_write")
	public void board_write() {
		
	}
	
	@PostMapping("/writeAction")
	public String writeAction(@RequestParam("title")String title
							,@RequestParam("board_content")String board_content
							,HttpSession session){
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userId=vo.getUserId();
		
		BoardVO bvo=new BoardVO();
		bvo.setBoard_content(board_content);
		bvo.setTitle(title);
		bvo.setWriter(userId);
		
	
		int result = service.writeAction(bvo);
		System.out.println("124124124  "+result);
		
		if(result==1) {
			return "redirect:/board/board_index";
			
		}else {
			return "redirect:/home";
			
		}
		
	}
	
	

}
