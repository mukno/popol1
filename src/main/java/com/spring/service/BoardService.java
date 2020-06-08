package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.CommentVO;

public interface BoardService {

	public int writeAction(BoardVO bvo);
	public int updateAction(BoardVO bvo);
	public int deleteAction(int bno);
	public List<BoardVO> getList();
	public BoardVO boardShow(int bno);
	public void addhits(int bno);
	public void addreplyCnt(int bno);
	public int commentAction(CommentVO addcvo);
	public List<CommentVO> getComment(int bno);
	
}
