package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.BoardVO;
import com.spring.domain.CommentVO;
import com.spring.domain.MemberVO;
import com.spring.domain.paging;
import com.spring.interceptor.SessionNames;
import com.spring.service.BoardService;

import lombok.Builder.Default;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardContorller {
	
	@Inject
	private BoardService service;
	
	@GetMapping("/board_index")
	public void board_index(Model model,@RequestParam(defaultValue="1")int pageNum) {
			System.out.println("11111"+pageNum);
			String nowTime=service.nowTime();
			
			int countList=10;//한 page에 게시물 수
			int countPage=10;//한번에 보이는 페이지 수
			int totalCount=service.getListCnt();//총 게시물수
			
			List<BoardVO> list=service.getList(pageNum,countList);
			
			for (BoardVO boardVO : list) {
				String writeTime=boardVO.getUpdatedate();
				if(writeTime.substring(0,10).equals(nowTime.substring(0,10))) {
					boardVO.setUpdatedate(writeTime.substring(11));
					
				}else {
					boardVO.setUpdatedate(writeTime.substring(5,10));
					
				}
			}
			
			model.addAttribute("list",list);
			model.addAttribute("paging",new paging(countList, countPage, totalCount, pageNum));
			
		
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
		
		service.addhits(bno);//조회수 추가
		
		BoardVO vo=service.boardShow(bno);//게시판내용물
		
		List<CommentVO> comment_list=service.getComment(bno);//해당 게시판 댓글내용list
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("comment_list",comment_list);
		
		
		
		
		
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
			return "redirect:/board/boardShow?bno="+bno;
			
		}else {
			return "redirect:/home";
			
		}
	}
	
	
	@GetMapping("board_delete")
	public String board_delete(@RequestParam("bno")int bno) {
		
		
		int reply_delete_result=service.deleteAllComment(bno);//글댓글먼저 지우기
		
		int board_delete_result=service.deleteAction(bno);//글지우기
		
		if(board_delete_result==1) {
			return "redirect:/board/board_index";
			
		}else {
			return "redirect:/home";
			
		}
			
		
		
		
	}
	
	@PostMapping("/commentAction")
	public @ResponseBody int commentAction(@RequestBody CommentVO cvo
												   ,HttpSession session){
		
		MemberVO vo=(MemberVO)session.getAttribute(SessionNames.LOGIN);
		String userName=vo.getUserName();
		String userId=vo.getUserId();
		String comment_content=cvo.getComment_content();
		int comment_parent=cvo.getComment_parent();
		int comment_board=cvo.getComment_board();
		
		comment_content=comment_content.replace("\n", "<br>");
		CommentVO addcvo=new CommentVO();
		addcvo.setComment_id(userId);
		addcvo.setComment_name(userName);
		addcvo.setComment_board(comment_board);
		addcvo.setComment_content(comment_content);
		addcvo.setComment_parent(comment_parent);
		
		int result=service.commentAction(addcvo);
		if(result==1) {
			service.addreplyCnt(comment_board);//게시판db의 reply_cnt값 증가
			
		}
		
		return result;
			
		
		
		
		
	}
	
	@GetMapping("/refreshAction")
	public @ResponseBody List<CommentVO> refreshAction(@RequestParam("comment_board")int comment_board){
		
		List<CommentVO> list=service.getComment(comment_board);
		
		return list;
	}
	
	@GetMapping("/comment_Delete")
	public @ResponseBody int comment_Delete(@RequestParam("comment_num")int comment_num
			 				   ,@RequestParam("comment_board")int comment_board) {
		int result=service.comment_Delete(comment_num, comment_board);
		service.minusreplyCnt(comment_board);
		
		return result;
		
	}
	
	
	
	
	

}
