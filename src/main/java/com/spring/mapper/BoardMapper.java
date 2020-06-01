package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardMapper {

	public int writeAction(BoardVO bvo);
	public List<BoardVO> getList();
	
}
