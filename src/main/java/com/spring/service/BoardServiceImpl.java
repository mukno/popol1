package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.CommentVO;
import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardMapper mapper;
	
	@Override
	public int writeAction(BoardVO bvo) {
		return mapper.writeAction(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public BoardVO boardShow(int bno) {
		return mapper.boardShow(bno);
	}

	@Override
	public int updateAction(BoardVO bvo) {
		return mapper.updateAction(bvo);
	}

	@Override
	public int deleteAction(int bno) {
		return mapper.deleteAction(bno);
	}

	@Override
	public int commentAction(CommentVO addcvo) {
		return mapper.commentAction(addcvo);
	}

	@Override
	public void addhits(int bno) {
		mapper.addhits(bno);
	}

	
	
	
}

