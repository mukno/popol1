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
	public List<CommentVO> getComment(int bno) {
		return mapper.getComment(bno);
	}

	@Override
	public String nowTime() {
		return mapper.nowTime();
	}

	@Override
	public BoardVO boardShow(int bno) {
		return mapper.boardShow(bno);
	}

	@Override
	public void minusreplyCnt(int bno) {
		mapper.minusreplyCnt(bno);
	}

	@Override
	public int deleteAllComment(int comment_board) {
		return mapper.deleteAllComment(comment_board);
	}

	@Override
	public int comment_Delete(int comment_num, int comment_board) {
		return mapper.comment_Delete(comment_num, comment_board);
	}

	@Override
	public void addreplyCnt(int bno) {
		mapper.addreplyCnt(bno);
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

