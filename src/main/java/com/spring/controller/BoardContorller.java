package com.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
		String userName=vo.getUserName();
		String userId=vo.getUserId();
		board_content=board_content.replace("\n", "<br>");
		
		BoardVO bvo=new BoardVO();
		bvo.setBoard_content(board_content);
		bvo.setTitle(title);
		bvo.setWriter(userName);
		bvo.setUserId(userId);
		
	
		int result = service.writeAction(bvo);
		
		if(result==1) {
			return "redirect:/board/board_index";
			
		}else {
			return "redirect:/home";
			
		}
		
	}
	
	@GetMapping("/boardShow")
	public void boardShow(@RequestParam("bno")int bno
						  ,Model model) {
		service.addhits(bno);
		
		BoardVO vo=service.boardShow(bno);
		model.addAttribute("vo",vo);
		
		
		
		
	}
	
	@GetMapping("/board_update")
	public void board_update(@RequestParam("bno")int bno
							 ,Model model) {
		BoardVO vo=service.boardShow(bno);
		
		String converContent=vo.getBoard_content();
		
		converContent=converContent.replace("<br>", "\n");
		vo.setBoard_content(converContent);
		
		model.addAttribute("vo",vo);
		
	}
	
	@PostMapping("updateAction")
	public String updateAction(@RequestParam("bno")int bno
							   ,@RequestParam("title")String title
						       ,@RequestParam("board_content")String board_content) {
		board_content=board_content.replace("\n", "<br>");
		BoardVO bvo=new BoardVO();
		bvo.setBno(bno);
		bvo.setBoard_content(board_content);
		bvo.setTitle(title);
		
		
		int result=service.updateAction(bvo);
		
		if(result==1) {
			return "redirect:/board/board_index";
			
		}else {
			return "redirect:/home";
			
		}
	}
	
	
	@GetMapping("board_delete")
	public String board_delete(@RequestParam("bno")int bno) {
		
		int result=service.deleteAction(bno);
		
		if(result==1) {
			return "redirect:/board/board_index";
			
		}else {
			return "redirect:/home";
			
		}
	}
	

}
