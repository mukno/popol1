package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardMapper {

	public int writeAction(BoardVO bvo);
	public int updateAction(BoardVO bvo);
	public int deleteAction(int bno);
	public List<BoardVO> getList();
	public BoardVO boardShow(int bno);
	public void addhits(int bno);
	
	
}
