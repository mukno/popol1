package com.spring.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.CommentVO;

public interface BoardMapper {

	public int writeAction(BoardVO bvo);
	public int updateAction(BoardVO bvo);
	public int deleteAction(int bno);
	public List<BoardVO> getList(Map<String, Integer> map);
	public BoardVO boardShow(int bno);
	public void addhits(int bno);
	public void addreplyCnt(int bno);
	public void minusreplyCnt(int bno);
	public int commentAction(CommentVO addcvo);
	public List<CommentVO> getComment(int bno);
	public int comment_Delete(@Param("comment_num")int comment_num,@Param("comment_board")int comment_board);
	public int deleteAllComment(int comment_board);
	public String nowTime();
	public int getListCnt();
	
	
}
