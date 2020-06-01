package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;

public interface BoardService {

	public int writeAction(BoardVO bvo);
	public List<BoardVO> getList();
}
