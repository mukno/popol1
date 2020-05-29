package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardMapper mapper;
	
	@Override
	public int writeAction(BoardVO bvo) {
		return mapper.writeAction(bvo);
	}

}
