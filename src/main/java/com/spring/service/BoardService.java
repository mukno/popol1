package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;

public interface BoardService {

	public int writeAction(BoardVO bvo);
}
